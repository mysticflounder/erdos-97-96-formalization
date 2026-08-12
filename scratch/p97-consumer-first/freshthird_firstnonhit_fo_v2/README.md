# FreshThird FirstNonHit v2: bounded source-fidelity refinement

This directory is a fresh refinement of v1. It does not modify production
Lean, documentation, or the v1 artifacts.

## Source/schema manifest

Target declaration: `Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.exists_freshThird_firstNonHit_selectedRow_overlap_card_ge_three`,
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean:2466-2480`.

Source declarations and hashes at launch:

| role | declaration/path | SHA-256 |
|---|---|---|
| retained blockers | `RetainedInteriorBlockerCollision.blockers_eq`, `lean/.../RetainedStrictInteriorPairSelector.lean:69-89` | `288860980b83a860ae1ee2c85ab2a9d50c978e559a98018bd947fbafbc17e402` |
| live cross-row inequality | target `hblockersNe`, `lean/.../TwoSourceFreshThirdResidual.lean:99-105` | `0f75f53fde8c0832e378b8e8093a09339d4f13aaa1888b0e3081047d4fd42556` |
| exact-15 guard | `ATailExactFifteenApexProfile.card_ge_fifteen_of_all_cap_card_ge_six`, used at `TwoSourceFreshThirdResidual.lean:368-371,419-422` | `716e1f42d7c39904c9c1fb289f8ea08aa84ae0b4562a62494868cc15afd4a8f5` |
| v1 schema | `freshthird_firstnonhit_fo_v1/firstnonhit_base.in` | `9cfdbe66b8bb509dfb2aaf50e70a6d2a98dacfe6a79dc13f9a401be3c56c7f45` |
| v2 schema | `firstnonhit_v2.in` | `0c26a13abf11e4febcfecb81d4e79a8bf6c10e4b4f947112d15c0cc163202e2a` |

## Added clauses and exact role map

The v2 input adds only:

1. `cen(pa) = cen(pb)` and `cen(ra) = cen(rb)`, instantiating
   `P.blockers_eq` and `Pρ.blockers_eq`.
2. `cen(ra) != cen(pa)`, instantiating the target `hblockersNe` antecedent.
3. Fifteen pairwise-distinct `car(g0)` through `car(g14)` witnesses,
   instantiating the live `15 ≤ D.A.card` consequence of the `L/N/T` residual
   context. This is the exact correction to v1's insufficient ten-witness
   guard.

The active branch remains only the encoded `sameBlocker/sameBlocker` arm:
`FreshThirdCapSourceNonHit.sameBlocker` and
`FreshThirdCapSourceInteraction.sameBlocker`,
`TwoSourceFreshThirdFiber.lean:1980-1989,2068-2078`. The Q projection maps
`FreshThirdBlockerFiber` source distinctness, blocker equality/inequalities,
endpoint freshness, and mutual support incidence to `qa,qb,cen,mem` clauses.
The C projection maps exact-four support and weak endpoint omission to `ca,cb`.

Remaining omissions are deliberately not added: `hρne`, exact selected-class
cardinalities/intersection equalities, strict-cap and cap-cardinality fields,
the retained/common-radius ingress disjunction, source-row-omission and
non-same-blocker interaction constructors, deletion survival and actual
blocker packets, K4 rows/overlap bounds, `LPρ/MPρ/LP/MP`, and the full `T`
minimality/large-cap/no-cover data. The finite `blocked` predicate remains an
uninterpreted schema relation; this is not a Euclidean realization.

## Bounded run status

Commands were bounded to Mace4 60 seconds/domain 15 and Prover9 30 seconds.
Mace4 reached `UNKNOWN` (`max_sec_no`, no model; `v2-mace4.log`), and Prover9
returned `SEARCH FAILED` at its 30-second limit (`v2-prover9.log`). These are
fail-closed finite-search statuses, not UNSAT and not universal claims.
