# TwoSource theorem-bank audit (2026-08-07)

Scope: the three production leaves below only. `FreshThirdResidual` and
`FreshThirdFiber` are active Frontier Ledger work and were not audited.
Statements/imports were checked in the live sources; no production files were
edited or built.

| target | plausible bank hit | applicability / first missing antecedent | result |
|---|---|---|---|
| [`TwoSourceCanonicalSurface.lean:104`](../../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceCanonicalSurface.lean#L104) `false_of_crossBlockerCoincidence` | `collisionCrossHit_or_geometricMultiplicity` (BlockerMultiplicityGeometry); older cross-blocker and Kalmanson banks | The target already assumes `CrossBlockerCoincidence` (four equality arms) and `GeometricMultiplicityResidual` (three alternatives, including the excluded FreshThird family). The producer only constructs this disjunction; it does not contradict an equality arm. No bank theorem consumes the retained `T`, two-radius interior equalities, disjoint source pairs, blocker inequality, and two mutual-omission cycles. First missing bridge is a source-clean global exclusion for each equality arm, with the residual's geometric alternative; no direct theorem/import hit. | **No closure; no material producer.** |
| [`TwoSourceFirstFiberCollision.lean:1259`](../../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFirstFiberCollision.lean#L1259) `false_of_capSource_firstFiber_outsidePairDeletionExactRows` | exact-12 ordered-cut files; BlockerV exact-15/16; older UniqueFour Kalmanson cores | Requires arbitrary `P,Pρ,Q,source,source'` plus `FiveSurvivorExactRowsBoundary` for a deleted outside point and `FirstFiberCollisionFiveCenterExactRowsResidual`. Exact-12 consumers require a Rigid221 carrier and a `FrozenBoundaryOrder`/fixed ordered-cut realization; BlockerV consumers require exact-15/16 labels, `PositionEmbedding`, four `OutsidePair` rows, and realized membership profile. UniqueFour cores require their fixed six-role/ordered-index package. None is present, and the target does not import those consumers. First missing antecedent is the corresponding exact finite-profile/order package (not an absent arithmetic lemma). | **No closure; no material hit.** |
| [`TwoSourceFirstFiberCollision.lean:1302`](../../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFirstFiberCollision.lean#L1302) `false_of_capSource_firstFiber_crossedThreeRowExactSupports` | `KalmansonThreeEqualitySchemas.false_of_support_first_two_k2_three_selected_rows_triangle_reflected` (line 1342); older `SixRoleKalmansonTriangle.false_of_two_k2_three_row_triangle_reflected` | Candidate is source-clean, but needs six ordered `Fin n` indices, convex-independent boundary/injective image/CCW package, three `SelectedFourClass` rows, and six positive support memberships (pairwise row intersections). `FirstFiberCrossedThreeRowExactSupports` gives first/common/opposite row exact supports; its `commonOutside_not_mem_oppositeRow` and `oppositeOutside_not_mem_commonRow` explicitly remove the needed common–opposite positive incidence. Thus the first missing antecedent is a positive shared support point (then the boundary indexing/order adapter). The target imports `TwoSourceFreshThirdResidual`, not `KalmansonThreeEqualitySchemas` or its consumer. | **No closure; candidate is a blocked consumer, not a producer.** |

## Fidelity endpoints

[`lean/scratch/e-package-bank/FidelityCheck.lean:83`](../../lean/scratch/e-package-bank/FidelityCheck.lean#L83)
is explicitly a copied E1 binder harness: it applies the bank artifacts and
ends in one deliberate `sorry`; the companion `EPackageBank.lean` is the
sorry-free artifact. The two C mirrors at
[`c-package-bank/FidelityCheck.lean:119`](../../lean/scratch/c-package-bank/FidelityCheck.lean#L119)
and [line 211](../../lean/scratch/c-package-bank/FidelityCheck.lean#L211)
likewise copy live C leaves and deliberately end in `sorry`; `CPackageBank.lean`
is sorry-free. These three are fidelity harness endpoints, not new closure
targets.

The fresh `erdos-97-96-formalization-lean` corpus and canonical reports
(`docs/general-n-certificate-bank-mining-2026-07-09.md`,
`certificates/p97_rvol_general_n_mining.{md,json}`,
`certificates/erdos97_legacy_general_n_mining.{md,json}`, and
`certificates/erdos_general_theorem_p97_mining.{md,json}`) were searched.
That review found no applicable exact-12 ordered cut, exact-15/16
BlockerV consumer, or older UniqueFour Kalmanson core. In particular, the
Kalmanson candidate needs a six-index incidence package absent from the live
TwoSource interface; synthesizing that package would be new producer work.
