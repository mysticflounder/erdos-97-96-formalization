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

## Round 1 responses (2026-07-27)

Verbatim harness responses, each annotated with a provenance/audit-status
header (citations verified against the tree; unverified and CONJECTURE
items listed explicitly in the header):

| Family | Document | Outcome |
|---|---|---|
| F | `2026-07-27-f-round1-response.md` | No proof, no certificate. Four boxed global-bridge targets (the round-2 subjects below); two CONJECTURE items: F3c-redundancy derivation, sharpened F3/F4 terminals. |
| B | `2026-07-27-b-round1-response.md` | No proof, no certificate. Three gap normal forms: (B1-gap) third carrier bisector point, (B2-gap) global consequence of a source–center coincidence, (B3-gap) survival at every center outside the four named; B3-rem removability equivalence is the B-family analog of F3c-redundancy (CONJECTURE until kernel-checked). |

## Round 2 — Family F bridge prompts (2026-07-27)

One prompt per boxed bridge from the F round-1 response. Each carries the
full Γ of the F document forward (disclosed condensations only), unfolds
the exact Lean consumer interfaces its bridge must feed, quarantines the
round-1 CONJECTURE items outside §6 background, and keeps the dual-branch
contract — for Bridges 3 and 4, branch B is explicitly a full realizability
certificate for Γ (it would kill all four F leaves, not just the bridge).

| Bridge | Document | Target |
|---|---|---|
| 1 | `2026-07-27-f-bridge-cross-shell-incidence.md` | A named positive cross-shell incidence feeding one of the three consumer packages T1/T2/T3. |
| 2 | `2026-07-27-f-bridge-second-cap-center.md` | A second first-cap center bisecting the named off-cap pair `{e,o}` (contradicts `outsidePair_unique_capCenter`); the F3-side sink `false_of_firstFiber_twoOutsideHits_of_capCenter` is already kernel-checked, the F4-side sink must be written. |
| 3 | `2026-07-27-f-bridge-k4-subcarrier.md` | A proper convex-independent K₄ subcarrier contradicting `CounterexampleData.Minimal`; includes the exact break threshold for the unique-four cover bound (vacuous at card ≥ 15). |
| 4 | `2026-07-27-f-bridge-m44-repackaging.md` | An alternative MEC surplus packet satisfying `IsM44` (contradicts `noM44`); reduction (B4) to a three-vertex non-obtuse boundary triple with two exact-four caps. |
