# Tri-apex retained-omission bank audit (2026-08-07)

Scope: the seven remaining `sorry`s in
`P97/ATail/FrontierLiveClosure/TriApexEndpointRetainedOmission.lean` after
excluding the two paired-grid child leaves explicitly owned by
`PairedGridCartographer` (lines 1949 and 1978).  This is a read-only audit; no
build was run and no production source was changed.

| source sorry | verdict | nearest checked candidate(s) | first missing bridge |
|---|---|---|---|
| `false_of_retainedOmission_reverseHitFresh_endpointCrossHit_firstCenterEqFreshSource_triApexAllLarge_core` (line 3402; `sorry` line 3416) | help | `EndpointFreshFiveRoleKalmanson.false_of_firstCenterEqFreshSource_of_crossHit_of_placement` (EndpointFreshFiveRoleKalmanson.lean:251) | Candidate is source-proven and derives the required five-role metric contradiction, but requires `FirstCenterEqFreshSourcePlacement Q` (eight explicit CCW orders). The target supplies only `Q`, `K_mem_J_shell`, and `A=J`; no placement producer exists, and the module is not in this file's import closure. |
| `false_of_retainedOmission_reverseHitFresh_endpointCrossHit_sharedBlocker_JInLeftAdjacentCap_triApexAllLarge_core` (line 3421; `sorry` line 3439) | no hit | Kalmanson three/four-equality schemas and exact-12 ordered-cut consumers (e.g. `ExactTwelveRigid221KalmansonConsumer.lean:33,146`) | No checked consumer has the `A=X`, left-adjacent-cap endpoint hypotheses.  A usable route still needs a five/six-role CCW placement producer, the row equalities for `O,A,X,J,C,K`, and import ingress (the exact-12 consumer is not imported here). |
| `false_of_retainedOmission_reverseHitFresh_endpointCrossHit_sharedBlocker_JInRightAdjacentCap_triApexAllLarge_core` (line 3443; `sorry` line 3461) | no hit | Same Kalmanson schema bank as the left branch | Reflection changes only the cap side; it does not supply a terminal.  Missing are the right-branch CCW placement/order producer and the corresponding metric-equality adapter; exact-12/BlockerV banks do not consume this endpoint packet. |
| `false_of_retainedOmission_reverseHitFresh_endpointCrossHit_secondCenterEqFirstSource_triApexAllLarge_core` (line 3524; `sorry` line 3538) | help | `EndpointFreshFiveRoleKalmanson.false_of_secondCenterEqFirstSource_of_crossHit_of_placement` (EndpointFreshFiveRoleKalmanson.lean:312) | Source-proven five-role consumer requires `SecondCenterEqFirstSourcePlacement Q` (eight CCW orders).  Target has only `X=C` and the shell hit; placement construction and module import are absent. |
| `false_of_retainedOmission_reverseHitFresh_endpointCrossHit_genericRoles_triApexAllLarge_core` (line 3543; `sorry` line 3561) | no hit | Cardinality-independent Kalmanson three/four-equality consumers; exact-15/16 BlockerV coverage | Generic target gives inequalities for role coincidences but no finite ordered-row/CCW witness or complete equality rows.  Exact-15/16 consumers require the unrelated `OriginalUniqueFourResidual` + `ExactFourRigid221...BlockerV` packet and card 15/16, so no adapter or direct application exists. |
| `false_of_retainedOmission_reverseHitFresh_endpointCommonDeletion_triApexAllLarge_core` (line 3601; `sorry` line 3616) | no hit | `false_of_exactFiveDistinct_commonDeletion` (Rigid221Closure.lean:990; transitively calls sorry-backed `false_of_exactFiveDistinct_biApexRobust_postCardEleven`, line 968), and `nonempty_commonDeletionTwoCenterPacket_of_sharedCriticalPair` (RobustLargeRadiusReduction) | The former is not an admissible closed bank terminal and, even ignoring that dependency, only handles `FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual`, physical `oppApex2`, and its oriented packet; the target has `ReverseHitFreshEndpointContext`, `Q.K`, and physical `oppApex1`.  The latter is only a packet producer, not a contradiction, and has different second-apex/cardinality hypotheses. |
| `false_of_retainedOmission_reverseHitFresh_threeDistinctBlockers_triApexAllLarge_core` (line 3647; `sorry` line 3657) | no hit | `RetainedMatchingThreeDistinctBlockerPath` (RetainedMatchingCommonDeletionCycle.lean:262) is only the target's data structure; nearby large-cap/fresh-third consumers have different packet types | Pairwise distinctness alone has no checked metric terminal.  Missing a universal lift from this path to a CCW ordered-row/Kalmanson or finite BlockerV certificate (plus all source equalities and cardinality/profile assumptions). |

## Bank status checks

* Exact-15 and exact-16 `BlockerV` coverage and their `Rigid221SourceHeavy`
  adapters are source-proven and import-reachable through `Rigid221Closure`,
  but consume a different `OriginalUniqueFourResidual`/BlockerV packet.  They
  cannot close any of the seven endpoint leaves directly.
* The exact-17 cap-nine child
  `...card_eq_seventeen_secondCapNine` (Rigid221SourceHeavy.lean:10074) and
  the `...card_ge_eighteen` child (line 10153) are themselves `sorry`-backed;
  they are not admissible bank candidates.  The proved cap-ten/cap-eleven
  reductions still have the same unrelated BlockerV hypotheses.
* The canonical report's Kalmanson and exact-15/16 claims are consistent with
  this audit: they are reusable metric/finite consumers, not endpoint-context
  producers (`docs/general-n-certificate-bank-mining-2026-07-09.md:72-100`).
