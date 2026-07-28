# Frontier solve prompts (2026-07-27)

Deep-thinker resolution prompts for the current proof frontier, one document
per leaf family, generated with the `math-toolchain:deep-thinker-prompt`
template (ShouqiaoW/erdos + CDC pattern; direction-neutral). Snapshot basis:
the 2026-07-27 working tree — 22 active sorry-bearing declarations, all in
`ATail/FrontierLiveClosure.lean` (families A–F). Authoritative on-spine
status: `proof-blueprint spine` after the current build refresh.

Every prompt is self-contained (all Lean structures unfolded into plain
planar-metric mathematics) and dual-branch: branch A proves `False` from the
leaf's hypotheses (closes the leaf); branch B exhibits one exact
configuration satisfying every hypothesis (kills the route — equally
reportable). The U1 leaf (family G) is existence-form and its branches are
adapted accordingly.

| Family | Document | Leaves |
|---|---|---|
| A | `2026-07-27-rigid221-physical-apex-chain.md` | 8: `false_of_exactFourMutualOmissionRigid221_minimalCore` (:2253), `..._physicalApex_sourceEqU_blockerDeleted` (:2459), `..._blockerV_sourceRowHeavy` (:2613), `..._blockerV_oppositeRowHeavy` (:2628), `..._blockerV_neitherRowHeavy` (:2651), `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge` (:3353), `..._blockerVRowOther_oppositeRowHeavy` (:5272), `..._blockerVRowOther_sparseRows` (:5293) |
| B | `2026-07-27-mutual-omission-four-center-deletion.md` | 3: `false_of_twoDistinctExactFourMutualOmissionJointDeletions_blockerCollision` (:693), `..._fourCenterCommonDeletion_blockerCoincidence` (:1165), `..._fourCenterCommonDeletion_survivalSquare` (:1240) |
| C | `2026-07-27-physical-apex-boundary.md` | 2: `..._physicalApex_sourceNeU` (:5430), `..._nonphysicalCollision` (:5602) |
| D | `2026-07-27-post-card-eleven-unique-radius.md` | 4: `false_of_exactFourPostCardElevenTwoRadiusBranch` (:6090), `false_of_exactFourPhysicalConsumerSwappedUniqueFourOutcome` (:6167), `false_of_firstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual` (:6247), `false_of_firstApexUniqueRadiusExactFiveCommonObstructionCenterResidual` (:6258) |
| E | `2026-07-27-tri-apex-directed-omission.md` | 1: `false_of_retainedInteriorDirectedOmission_and_all_low_hits` (:6752) |
| F | `2026-07-27-exact-collision-terminals.md` | 4: `false_of_crossBlockerCoincidence` (:7476), `false_of_capSource_freshThirdBlockerFiber` (:7486), `false_of_capSource_firstFiber_collisionFiveCenterDeletion` (:7620), `false_of_capSource_freshOutsideSecondBlockerFiber` (:7648) — hypotheses drawn from the `TwoSourceExactCollisionRowsTerminal` section chain |
| G (RETIRED) | `2026-07-27-u1-double-apex-shared-radius-pair.md` | `DoubleApexOffSurplusSharedRadiusPair` (`U1LargeCapRouteBTail.lean:2401`) — NOT an active obligation: the whole declaration sits inside the 2026-07-25 retirement block comment (:2371–:2623), and its conclusion is refuted under the hypotheses by the proved reflection kernel `oppCap2_escape_gen` (:2257). The document is kept as an archive of the retired Route-A residual; do not run it as a frontier prompt. |

Usage: run a prompt in a deep-thinker harness (the multiagent block is
parameterized; map exploration → `math-professor`, proving → `math-prover`,
audit → `math-skeptic`, computation → solver skills). Any branch-B
certificate must be adversarially audited before the corresponding parent
route is re-planned. Line numbers refer to the 2026-07-27 tree and drift
with edits; the declaration names are the stable keys.
