# Math Skeptic Audit: docs/closure-plan-full-spec-2026-07-09.md

**Target**: docs/closure-plan-full-spec-2026-07-09.md (3,151 lines, read in full)
**Date**: 2026-07-14
**Verdict**: NEEDS WORK (freshness residue and one dispatch-relevant reachability gap; no mislabeled-rigor blockers)
**Prior audits read**: docs/audits/2026-07-13-closure-plan-audit.md (all six of its findings are confirmed resolved in the current doc; nothing below repeats a resolved item, two items below are its *unresolved* minors)

## Summary

The rigor-label discipline in this document is strong: negative results, finite shadows, trusted-CAS verdicts, and conditional adapters are consistently scoped, and every 2026-07-14 claim I spot-checked against Lean/scratch artifacts held up. The remaining defects are freshness: two passages still assert the superseded 80-hole inventory as current, the "Ordering and sizing" section still sizes the liveData cluster at its pre-T1/T3-wiring shape, and the primary execution order names `u1TwoLargeCapObstruction` as a sink without disclosing that it is not import-reachable in this repository.

## Findings (ranked)

### F1: "Current dispatch correction" asserts the superseded 80-hole inventory
- **Location**: docs/closure-plan-full-spec-2026-07-09.md:1854-1857
- **Quote**: "The only project source sorries are the 80 Front-A holes in `U1LargeCapRouteBTail.lean`"
- **Classification**: STALE
- **Why wrong**: The heading is "**Current dispatch correction, 2026-07-13**" — present-tense dispatch authority. Verified live: `proof-blueprint symbols --with-sorry` reports exactly 12 declarations; grep of the file finds 32 code `sorry`s (24 LIVE-Q + 7 LIVE-C + 1 K-A-PAIR). The doc's own inventory section (lines 41-54, "updated 2026-07-14") says 12/32.
- **Rewrite**: "The only project source sorries are the 32 Front-A holes (12 declarations) in `U1LargeCapRouteBTail.lean`" — or date-scope the sentence as a 2026-07-13 snapshot.

### F2: "Ordering and sizing" still sizes the liveData cluster pre-wiring, and misstates what closing K-A-PAIR buys
- **Location**: docs/closure-plan-full-spec-2026-07-09.md:2632-2636
- **Quote**: "**Front-A liveData families:** the three 24-leaf permutation bands and seven terminal center branches … Closing the shared-radius theorem removes only one downstream dependency; it does not close these families."
- **Classification**: STALE
- **Why wrong**: Wrong twice against the doc's own §A.2b (refreshed 2026-07-14) and the live spine. (a) The T1 and T3 bands are production-wired and source-sorry-free; the direct open surface is 4 LIVE-Q helpers (24 holes) + 7 LIVE-C helpers (7 holes). (b) The T1/T3 orbits are transitively open *only through K-A-PAIR*, so closing the shared-radius theorem does kernel-close them. As written, this section — the one a scheduler reads for sizing — overstates the open-mathematics count.
- **Rewrite**: "**Front-A liveData families:** the 24 LIVE-Q ordered-subcube leaves and seven LIVE-C terminal center branches (31 direct holes). The T1/T3 orbits are production-wired and close with the shared-radius theorem; the Q and C families do not."

### F3: Execution order names a consumer that is not import-reachable in this repository
- **Location**: docs/closure-plan-full-spec-2026-07-09.md:2695-2696 (execution-order item 2); also used at :3002
- **Quote**: "force the seven equalities consumed by `u1TwoLargeCapObstruction`, or derive `False` directly"
- **Classification**: GATE
- **Why wrong**: Verified: zero hits for `u1TwoLargeCapObstruction` anywhere under `lean/` in this repo; the mining registry (certificates/p97_rvol_general_n_mining.md:97) places it in the sibling project at `lean/RVOL/P97/U1TwoLargeCapObstruction.lean:77`; the 2026-07-14 unique-row report (scratch/atail-force/unique-row-producer/REPORT.md:220-227) confirms `source_reachable: false` and that Lean reports the constant unknown after importing the leaf module. Presenting it as an immediate sink in the *primary* execution order violates the plan's own preflight contract (lines 30-37: record "source/import reachability"). The caveat currently lives only in an uncommitted scratch report.
- **Rewrite**: "force the seven equalities consumed by the sibling-bank theorem `u1TwoLargeCapObstruction` (proved in p97-rvol; not import-reachable here — an explicit port is a prerequisite of this route), or derive `False` directly."

### F4: Inventory section still hands the reader the 80-hole matrix decomposition
- **Location**: docs/closure-plan-full-spec-2026-07-09.md:75
- **Quote**: "The matrix decomposes the 80 holes into producer families"
- **Classification**: STALE
- **Why wrong**: This sentence sits inside "Current inventory (updated 2026-07-14)", twenty lines below the correct 12/32 table, and the matrix (updated 2026-07-14) now decomposes 32 holes. Internal contradiction within one section.
- **Rewrite**: "The matrix decomposes the 32 holes into producer families".

### F5: §A.0 line anchors are stale (repeat of an unfixed 07-13 minor)
- **Location**: docs/closure-plan-full-spec-2026-07-09.md:147-152
- **Quote**: "(U1LargeCapRouteBTail.lean:2672)"; "`capProfile_eq_554_of_card_eq_eleven` (line 2158) … (line 2155 comment)"
- **Classification**: STALE
- **Why wrong**: Verified against current source: the leaf declaration is at :2517 (hole :2562); line 2672 is now inside a different theorem's proof; `capProfile_eq_554_of_card_eq_eleven` is at :2214. The section is dated "(2026-07-09 source reads)", but it sits beside §A.2b which was refreshed to 2026-07-14, and the 07-13 audit already flagged these anchors. (Same one-line drift affects the matrix K-A-PAIR row, ":2516, hole :2561" → :2517/:2562.)
- **Rewrite**: refresh or strike the anchors per the doc's own snapshot protocol (lines 24-28).

### F6: "active-run provenance" for a run the doc later declares terminal (repeat of an unfixed 07-13 minor)
- **Location**: docs/closure-plan-full-spec-2026-07-09.md:226-227
- **Quote**: "this is active-run provenance, not merely a working-tree capability."
- **Classification**: STALE / WEASEL
- **Why wrong**: Oracle-13 reached `combined-frontier` and exited (doc's own lines 350-362), and the whole Census554 lane is quiescent at the 5,939-row bank (lines 377-393). "Active-run" is a present-tense process claim the doc elsewhere forbids.
- **Rewrite**: "this catalog was exercised live by the (now terminal) oracle-13 run, not merely a working-tree capability."

### F7: "routine normalization" pre-labels an admitted-pending transport
- **Location**: docs/closure-plan-full-spec-2026-07-09.md:2934-2938
- **Quote**: "the remaining routine normalization is to orient a small cap as `oppIndex1`" … "The orientation transport is still pending."
- **Classification**: WEASEL (low)
- **Why wrong**: The transport is unproved; "routine" is a difficulty forecast, not evidence. The doc's rigor style elsewhere avoids exactly this.
- **Rewrite**: "the remaining normalization — not yet proved — is to orient a small cap as `oppIndex1`".

## Freshness correction to the tasking ground truth

The tasking stated the (6,5,4) target-negating shadow's "realizability is currently unresolved pending an exact real-exclusion replay." Per the current working-tree artifact (scratch/atail-force/unique-row-producer/REPORT.md, 2026-07-14): the first fixed (6,5,4) shadow's exact real exclusion is **done and independently replayed** (positive-polynomial obstruction `4·x10y² + 1 = Σ cᵢgᵢ`, certificate SHA `6a37fbfd…`); all fourteen fixed shadows encountered so far are excluded over ℝ; four source-indexed survivors are excluded by cross-checked UNIT ideals. The branch remains a **nonconverged CEGAR sequence** — no finite-shadow UNSAT — and the generated Lean cores are source-complete but unbuilt under a standing no-build gate. The plan doc makes no false claim here (it correctly defers to the owner lane at :2871-2881 and :3134-3137).

## Correctly calibrated statements (checked, so this report is falsifiable)

1. **Inventory table** (plan:41-68): 12 declarations / 32 holes, 1 pair + 4 LIVE-Q + 7 LIVE-C, T1/T3 source-sorry-free and transitively open through K-A-PAIR only — matches `proof-blueprint symbols --with-sorry` (exactly those 12 symbols) and the file's 32 code sorries exactly.
2. **Provenance claim** (plan:2777-2782, "the outer wrapper already constructs all source rows from one concrete `CriticalShellSystem`"): verified — `u1_largeCap_routeB_tail_false` builds all five rows via `CriticalSourceRows.ofCriticalShellSystem`/`CriticalRowPacket.ofCriticalShellSystem Hcritical` (U1LargeCapRouteBTail.lean:9537-9585); the structure itself (U1Depth5Prefix.lean:539) carries no provenance field, and the plan correctly locates provenance at the parent call site, not the leaf.
3. **FRONTIER-EXTRACT DONE-PRODUCTION** (plan:2797-2807): `lean/Erdos9796Proof/P97/ATail/CriticalPairFrontier.lean` exists, has zero source `sorry`, and is imported by U1LargeCapRouteBTail.lean; an axiom-audit companion exists in scratch.
4. **Exact-pair classifier** (plan:2783-2791): 369,743 = 44,831 + 108,435 + 215,547 + 930 is consistent across plan, matrix (ATAIL-EXACT-PAIR-COVERAGE, DONE-NEGATIVE / FINITE ABSTRACTION ONLY), and the producer plan; correctly not promoted to a coverage proof.
5. **Two-radii cap bound** (plan:2919-2929): `oppositeVertex_distinct_K4_radii_force_cap_card_ge_six` exists sorry-free in scratch/atail-force/full-geometry-producer/CapFiveApexRigidity.lean, and the plan honestly bounds its reach (fails from card 14 via (5,6,6); "not a uniform closure theorem").
6. **Census554 necessity bridge** (plan:598-625): `exists_card11SelectedCube_cubeOk` at lean/Erdos9796Proof/P97/Census554/GeometryBridge.lean:1273, file sorry-free.
7. `outsidePair_unique_capCenter` (consumed at plan:1374 and :3061-3071) is a proved production theorem (CapSelectedRowCounting.lean:283, sorry-free file) — consuming it is not circular.
8. Production module `EquilateralHingeCollisions.lean` (plan:2830-2834) and every named 07-14 scratch artifact I checked exist on disk (TetrahedronBankAdapter.lean, verify_total_css_completion.py, BiapexContinuationGrid.lean, biapex current-bank-refresh checkpoint JSON).
9. Card-11 discipline post-AUDIT-1 is consistently correct throughout (plan:78-80, 164-170, 876-878, 1668-1670, 2627-2631, 3047-3049): the producer obligation is stated uniformly from card 11, with A11-CONSUME the named dependency of any CARD-GE-12 producer.
10. Weasel scan otherwise clean: the only "should" hits (:901, :1127, :1313) are procedural planning verbs, not proof claims.

## Spot-checks performed (per the tasking, ≥5)

(a) `proof-blueprint symbols --with-sorry`; (b) grep of U1LargeCapRouteBTail.lean sorries and the K-A-PAIR hole (:2562); (c) `capProfile_eq_554_of_card_eq_eleven` line position (:2214 vs plan's :2158); (d) rows-from-Hcritical construction at U1LargeCapRouteBTail.lean:9537-9585; (e) `u1TwoLargeCapObstruction` absence from lean/ plus its sibling-repo registry entry; (f) CriticalPairFrontier existence, sorry-freedom, and importer; (g) CapFiveApexRigidity two-radii kernel; (h) `exists_card11SelectedCube_cubeOk`; (i) EquilateralHingeCollisions production module; (j) exact-pair census totals across all three planning docs.

The auditing agent was dispatched read-only and edited no files; this file is the persisted copy of its report.
