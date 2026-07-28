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
| A | `2026-07-27-rigid221-physical-apex-chain.md` | 8 at prompt time; 6 after the 2026-07-28 refactor (`a0f73bc1`): `false_of_exactFourMutualOmissionRigid221_minimalCore`, `..._physicalApex_sourceEqU_blockerDeleted`, `..._blockerV_sourceRowHeavy`, `..._blockerVRow_{oppositeRowHeavy,sparseRows}` (renamed from `blockerVRowOther_*`), `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge` — `blockerV_oppositeRowHeavy` and `blockerV_neitherRowHeavy` were closed by the refactor |
| B (REMOVED) | `2026-07-27-mutual-omission-four-center-deletion.md` — removed 2026-07-28 (git history) after the banking pass: its round-2 gap candidates are dead ((B3-gap) refuted, (B1-gap) negation proven leaf-independently) and the local geometry it targets is banked in `lean/scratch/b-family-bank/`. Do not redispatch; a future B prompt must be drafted fresh on the banked normal forms. 2026-07-28 refactor note: all three B leaves are live again in the landed tree (`a0f73bc1`), including B2/B3. | 3: `false_of_twoDistinctExactFourMutualOmissionJointDeletions_blockerCollision` (:693), `..._fourCenterCommonDeletion_blockerCoincidence` (:1165), `..._fourCenterCommonDeletion_survivalSquare` (:1240) |
| C | `2026-07-27-physical-apex-boundary.md` | 2: `..._physicalApex_sourceNeU` (:5430), `..._nonphysicalCollision` (:5602) |
| D | `2026-07-27-post-card-eleven-unique-radius.md` | 4: `false_of_exactFourPostCardElevenTwoRadiusBranch` (:6090), `false_of_exactFourPhysicalConsumerSwappedUniqueFourOutcome` (:6167), `false_of_firstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual` (:6247), `false_of_firstApexUniqueRadiusExactFiveCommonObstructionCenterResidual` (:6258) |
| E | `2026-07-27-tri-apex-directed-omission.md` | 1: `false_of_retainedInteriorDirectedOmission_and_all_low_hits` (:6752) |
| F (CONSUMED) | `2026-07-27-exact-collision-terminals.md` — round 1 answered; do not redispatch. Kept only as the "F doc" / Γ source cited by the four round-2 bridges below. | 4: `false_of_crossBlockerCoincidence` (:7476), `false_of_capSource_freshThirdBlockerFiber` (:7486), `false_of_capSource_firstFiber_collisionFiveCenterDeletion` (:7620), `false_of_capSource_freshOutsideSecondBlockerFiber` (:7648) — hypotheses drawn from the `TwoSourceExactCollisionRowsTerminal` section chain |
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
| F | `2026-07-27-f-round1-response.md` | No proof, no certificate. Four boxed global-bridge targets (the round-2 subjects below). Banking 2026-07-28: F3c-redundancy PROVEN (`lean/scratch/f3c-redundancy-bank/` — (F3c) from Γ+(F3b) alone, (F3a) unused); F3-side sharpened terminals were already kernel-checked (`FirstFiberOverlapDescent.lean:772`, `:901`), only the F4 mirrors remain CONJECTURE. |
| B | `2026-07-27-b-round1-response.md` | No proof, no certificate. Three gap normal forms. Banking 2026-07-28 (`lean/scratch/b-family-bank/`): all three round-1 CONJECTURE items PROVEN (B1 bisector saturation, B3-rem both directions, B2 canonical-row forcing); (B3-gap) REFUTED under B3's own binders, (B1-gap) negation proven leaf-independently — neither is a round-2 target. (B2-gap) is the only open gap direction (B2 arm 3 needs radius-uniqueness at `β(z₂)` — attack in flight via the D response's unique-four-center device, `lean/scratch/b-family-bank/B2Arm3.lean`). |
| C | `2026-07-28-c-round1-response.md` | No proof, no certificate. Eight exact structural lemmas: \|D₀\|=2, unique K4 radius at a₂, apex-witness exactification (= C∖{z}), five-point collision class K with K∩C=K∩D₀={s,t}, full deletion-robustness of P (never a blocker), P≠a₁, collision-pair mutual omission + distinct blockers, placement census. Banking in flight (`lean/scratch/c-package-bank/`). Honest negatives: D₀'s identity carries no local information; surviving placements locally realizable in convex position. |
| D | `2026-07-28-d-round1-response-a.md`, `2026-07-28-d-round1-response-b.md` (two independent runs) | No proof, no certificate. Run A: unique-four-center lemma (blocker property alone pins every ≥4-row through the deleted point), D3 three-center packet, D4 shared-row normal form + bisector census, D2 protected pairs, D1 2×2-split residual. Run B: D4 global one-defect two-deletion cover (unique common defect b) with Lean sketch; D1 \|Γ₂\|≥6; D3 robust/critical split via `PhysicalSecondApexCommonDeletion`; warning — D2's swap is not an involution (no descent measure); D4 purification statement (3) is CONJECTURE, do not axiomatize. Banking in flight (`lean/scratch/d-package-bank/`). |

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
