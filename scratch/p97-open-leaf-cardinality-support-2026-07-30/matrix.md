# P97 live open-leaf cardinality-support matrix

Audit date: 2026-07-30. Publish target: `Problem97.erdos97_rhs`. Live
proof-blueprint snapshot: build `723a29e47f69`.

## Headline

- Proof-blueprint reports **20 open obligations**, but only **19 are named
  sorry-backed theorem leaves**. The twentieth is the unapproved axiom
  `sorryAx`.
- Separately, proof-blueprint flags one named **off-spine** sorry,
  `ATailFiniteN11Frontier.false_of_frontierCommonDeletionPhysicalSecondApex_of_card_eq_eleven`;
  it is not counted as a live production publish leaf.
- Named-leaf tiers: **2 exact-five at `n >= 10`**, **13 exact-four at
  `n >= 12`**, **2 all-large at `n >= 15`**, and **2 cap-eight at
  `n >= 17`**.
- Role order below is `(surplusCap, oppCap1, oppCap2)`.
- The cap identity is
  `surplusCap.card + oppCap1.card + oppCap2.card = A.card + 3`.
- Minimum profiles are the exact arithmetic profiles compatible with the
  recorded interface bounds at minimum `n`; they are not claims that each
  profile is geometrically realizable.

## Matrix

| # | Live named leaf (all in `FrontierLiveClosure.lean`) | Line | Interface cap lower bounds | Minimum `n`; exact profiles at minimum | Where the support lives |
|---:|---|---:|---|---|---|
| 1 | `false_of_twoDistinctExactFourMutualOmissionJointDeletions_blockerCollision` | 702 | `(5,4,5)` plus surface growth | `12`; `(6,4,5)`, `(5,5,5)`, `(5,4,6)` | At leaf: explicit `_hcard` and `ExactFourPostCardElevenRobustSurface`. |
| 2 | `false_of_exactFourMutualOmission_fourCenterCommonDeletion_blockerCoincidence` | 1157 | `(5,4,5)` plus surface growth | `12`; same three | At leaf: explicit `_hcard` and surface. |
| 3 | `false_of_exactFourMutualOmission_fourCenterCommonDeletion_survivalSquare` | 1231 | `(5,4,5)` plus surface growth | `12`; same three | At leaf: explicit `_hcard` and surface. |
| 4 | `false_of_exactFourMutualOmissionRigid221_minimalCore` | 2173 | `(5,4,5)` plus surface growth | `12`; same three | At leaf: explicit `_hcard` and surface. |
| 5 | `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerDeleted` | 2379 | `(5,4,5)` plus surface growth | `12`; same three | At leaf through the context, which stores `hcard` and `surface`. |
| 6 | `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV_sourceRowHeavy` | 2533 | `(5,4,5)` plus surface growth | `12`; same three | At leaf through the stored context. |
| 7 | `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerVRow_oppositeRowHeavy` | 2556 | `(5,4,5)` plus surface growth | `12`; same three | At leaf through the stored context. |
| 8 | `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerVRow_sparseRows` | 2581 | `(5,4,5)` plus surface growth | `12`; same three | At leaf through the stored context. |
| 9 | `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge` | 3299 | `(5,4,6)` | `12`; `(5,4,6)` | At leaf: surface plus explicit `_hsecond`; cap sum directly gives `n >= 12`. |
| 10 | `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceNeU` | 5322 | `(5,4,5)` plus surface growth | `12`; same three | At leaf: explicit `_hcard` and surface. |
| 11 | `false_of_exactFourMutualOmissionRigid221_nonphysicalCollision` | 5494 | `(5,4,5)` plus surface growth | `12`; same three | At leaf: explicit `_hcard` and surface. |
| 12 | `false_of_exactFourPostCardElevenTwoRadiusBranch` | 5983 | `(5,4,6)` | `12`; `(5,4,6)` | At leaf: the two distinct-radius four-classes force `oppCap2 >= 6`; cap sum gives `n >= 12`. |
| 13 | `false_of_exactFourPhysicalConsumerSwappedUniqueFourOutcome` | 6048 | `(5,4,4)` and `noM44` | `12`; `(6,5,4)`, `(6,4,5)`, `(5,6,4)`, `(5,5,5)`, `(5,4,6)` | At leaf: explicit `_hcard`; original/swapped exact-four data give both opposite bounds. `noM44` removes `(7,4,4)`. The cap bounds alone do not give `n >= 12`. |
| 14 | `false_of_firstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual` | 6294 | `(5,5,2)` | `10`; `(6,5,2)`, `(5,6,2)`, `(5,5,3)` | At leaf: residual stores `carrier_card_gt_nine`; exact-five gives three strict interior points and hence `oppCap1 >= 5`. Cap bounds alone give only `n >= 9`. |
| 15 | `false_of_firstApexUniqueRadiusExactFiveCommonObstructionCenterResidual` | 6305 | `(5,5,2)` | `10`; same three | Same exact-five interface support as row 14. |
| 16 | `false_of_retainedInteriorDirectedOmission_and_all_low_hits` | 6767 | **`(6,6,6)`** | **`15`; `(6,6,6)`** | At leaf through the all-large residuals. No cap-eight witness is present. |
| 17 | `TwoSourceExactCollisionRowsTerminal.false_of_crossBlockerCoincidence` | 7450 | **`(6,6,6)`** | **`15`; `(6,6,6)`** | At leaf through the surrounding all-large interface. **The `n >= 17` bound is only in narrower cap-source descendants.** |
| 18 | `TwoSourceExactCollisionRowsTerminal.false_of_capSource_freshThirdBlockerFiber_without_sameCapCrossRow` | 7556 | role order `(6,8,6)`; cap-eight-first **`(8,6,6)`** | **`17`; role `(6,8,6)` / cap-eight-first `(8,6,6)`** | At leaf: all-large interface plus `hsource`, which gives designated `oppCap1 >= 8`. |
| 19 | `TwoSourceExactCollisionRowsTerminal.false_of_twoCapSources_oneSidedDeletionSurvival` | 8850 | role order `(6,8,6)`; cap-eight-first **`(8,6,6)`** | **`17`; role `(6,8,6)` / cap-eight-first `(8,6,6)`** | At leaf: all-large interface plus two source witnesses. Both concern the same `oppCap1`; this is not two distinct cap-eight caps. |

The exact-four surface base bounds are `(5,4,5)`. Its `capGrowth` trichotomy
adds one unit in exactly one of the three recorded ways, yielding the three
minimum-`n` profiles shown above. In contrast, the swapped exact-four leaf has
no surface argument; its explicit `n >= 12` hypothesis and `noM44` account for
its five-profile list.

## Trust and scope

All 19 named rows have `sorry` bodies and lie on the publish spine. The refreshed
axiom audit for `Problem97.erdos97_rhs` reports six transitive axioms: the sole
unapproved custom axiom is `sorryAx`; `Lean.trustCompiler` is approved, and the
remaining four are core axioms.

These are necessary cardinality consequences of each live interface, not proofs
of the leaves. In particular, a fixed-`n` UNSAT result would not close the
arbitrary-`n` theorem without a proved hereditary reduction.

No full Lake build was run. Proof-blueprint was refreshed from current
importable oleans, but the dirty worktree was changing concurrently, the latest
recorded full build had failed, and some indexed modules lacked importable
oleans. The clean graph snapshot used here is build `723a29e47f69`.

## Audit artifacts

- `matrix.json`: machine-readable 19-row matrix.
- `spine-final-snapshot.txt`: refreshed proof-blueprint spine and the
  20-versus-19 discrepancy.
- `axioms-current.txt`: transitive axiom report for the publish target.
- `spine-current.txt`, `status-current.txt`, `leaf-signatures.txt`,
  `cap-source-context.txt`, `one-sided-context.txt`: supporting source/frontier
  extracts.
