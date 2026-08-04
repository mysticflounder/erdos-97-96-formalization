# Frontier solve prompts (2026-07-27)

Historical deep-thinker resolution prompts, one document per leaf family,
generated with the `math-toolchain:deep-thinker-prompt` template
(ShouqiaoW/erdos + CDC pattern; direction-neutral). Their snapshot basis is
the 2026-07-27 working tree — then 22 active sorry-bearing declarations, all
in `ATail/FrontierLiveClosure.lean` (families A–F). These prompt-time leaf
maps and line numbers are not a live frontier. Authoritative on-spine status
comes from `proof-blueprint spine` after the current build refresh.

> **Relocation notice (2026-08-03 doc sweep).** Eight consumed/superseded
> prompts moved to `docs/archive/2026-08-03-doc-sweep/solve-prompts/`: the
> Family F set (`2026-07-27-exact-collision-terminals.md`, the four
> `2026-07-27-f-bridge-*.md` round-2 bridges, and
> `2026-07-27-f-round1-response.md`) and the retired U1 double-apex pair
> (`2026-07-27-u1-double-apex-shared-radius-pair.md`,
> `2026-07-28-u1-double-apex-round1-response.md`). The tables below still
> name them; read those rows as history. The nine prompts remaining in this
> directory all target obligations that are still open.

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
| F (CONSUMED; HISTORICAL) | `2026-07-27-exact-collision-terminals.md` — round 1 answered; do not redispatch. Kept only as the "F doc" / Γ source cited by the four round-2 bridges below. Its prompt-time frontier had 4 leaves. ~~As of the 2026-07-30 cap-source consolidation, the direct frontier has 2: `false_of_crossBlockerCoincidence` and `false_of_capSourceThirdCanonicalRowSurface`.~~ **Corrected 2026-08-03:** `false_of_capSourceThirdCanonicalRowSurface` (`FrontierLiveClosure.lean:13103`) is now a proved dispatcher, not a leaf, and `TwoSourceExactCollisionRowsTerminal` currently holds **5** open leaves — `false_of_crossBlockerCoincidence`, `false_of_twoCapSources_freshOutsideFirstBlockerFiber`, `false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`, `false_of_capSource_firstFiber_outsidePairDeletionExactRows`, `false_of_capSource_firstFiber_crossedThreeRowExactSupports`. The former fresh-third, one-sided-deletion, and aligned/nonbisector interfaces are compatibility adapters and are not independent targets. | Historical snapshot only; use the closure matrix and generated blueprint for current status |
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
| C | `2026-07-28-c-round1-response.md` | No proof, no certificate. Eight exact structural lemmas: \|D₀\|=2, unique K4 radius at a₂, apex-witness exactification (= C∖{z}), five-point collision class K with K∩C=K∩D₀={s,t}, full deletion-robustness of P (never a blocker), P≠a₁, collision-pair mutual omission + distinct blockers, placement census. Banked: `lean/scratch/c-package-bank/CPackageBank.lean`, 18 kernel-clean theorems (all eight targets) + `FidelityCheck.lean` harness. Honest negatives: D₀'s identity carries no local information; surviving placements locally realizable in convex position. |
| D | `2026-07-28-d-round1-response-a.md`, `2026-07-28-d-round1-response-b.md` (two independent runs) | No proof, no certificate. Run A: unique-four-center lemma (blocker property alone pins every ≥4-row through the deleted point), D3 three-center packet, D4 shared-row normal form + bisector census, D2 protected pairs, D1 2×2-split residual. Run B: D4 global one-defect two-deletion cover (unique common defect b) with Lean sketch; D1 \|Γ₂\|≥6; D3 robust/critical split via `PhysicalSecondApexCommonDeletion`; warning — D2's swap is not an involution (no descent measure); D4 purification statement (3) is CONJECTURE, do not axiomatize. Banked: `lean/scratch/d-package-bank/DPackageBank.lean`, 65 kernel-clean theorems (all six targets + stretch; run A's rigid 2×2 split proven vacuous, `d1_swappedCommonDeletion_pair` unconditional). Follow-up D1 closer agent: assigned route (pair-deletion global survival → minimality) REFUTED — global K4 survival after any pair erase forces a mutual-blocker pair; 30 further theorems + obstruction census in `D1GlobalSurvival.lean`, see `D1SURVIVAL-REPORT.md`. D1 leaf still open. |
| E | `2026-07-28-e-round1-response.md` | No proof, no certificate. Central finding: polarity mismatch — the directed-omission packet supplies survival/omission where the two-hit localizer needs failure/membership, so the localizer cannot fire on the omission edge (independently matches `scratch/triapex-planar-bridge/findings.md`). Re-derives the 15-point equality-shadow obstruction (`scratch/triapex-incidence-obstruction/`): counting with E6.4/E7/E8/E9 alone cannot close E1; adds numerical (non-certificate) evidence against planar embedding of that shadow. Exact remaining gap = a positive-incidence PRODUCER: the three-hit witness, or the weaker form ¬K4(A∖{q},c(p)) ∧ c(p)∉C_i° for a same-rich-cap pair. Warns the existing three-hit-conclusion theorem is downstream of the same coordinator (circular). No banking dispatched — provable content already in production/banks. |
| U1 (retired, off-spine) | `2026-07-28-u1-double-apex-round1-response.md` | No proof, no certificate. Confirms `DoubleApexOffSurplusSharedRadiusPair` is a retired restoration target. Claims H9–H14 are manufacturable from H8 ({{UNVALIDATED}} — plausible, unaudited; note it cites \|A\|≥11 where H1 gives \|A\|>9, harmless since choosing u needs only 6), reducing the leaf to: convex-independent global-K4 carrier + two-large-cap packet + no-M44 + critical shell system + \|A\|>9 ⟹ ⊥. Exact missing interface: multi-deletion failure (MD) — singleton blockers yield a failed remaining center unless the deletion set is closed under the blocker map χ; converges exactly with the banked D1GlobalSurvival pair-erase refutation (\|V\|=2 mutual-blocker forcing, commit `96ced43f`). Open combinatorial core: rule out proper blocker-closed sets from global K4 + convexity + caps + no-M44 (the local two-cycle `scratch/blocker-cycle-geometry/` shows cycle-local data alone cannot). No banking — off-spine target. |

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
