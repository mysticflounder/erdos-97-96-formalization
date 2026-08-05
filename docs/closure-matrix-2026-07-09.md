<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Problem 97/96 closure matrix (2026-07-09)
> **Structural note (2026-08-05, `9feb86f6`):** `ATail/FrontierLiveClosure.lean`
> was sharded into 15 files under `ATail/FrontierLiveClosure/` with the original
> path kept as an umbrella import; namespaces and FQNs are unchanged. Monolith
> line references predating the split are stale; shard-file references are
> current.


This is the executable task register for
`docs/closure-plan-full-spec-2026-07-09.md`. It includes every current
source-level proof hole and every non-`sorry` prerequisite on a selected
closure route, including non-UNSAT census outcomes and final publication
gates. “All” does not promote every speculative research idea into an
obligation: OPTIONAL rows are included only where the existing plan names a
concrete artifact and possible consumer. A row is DONE only when its named
consumer and gate pass.

## Snapshot and status vocabulary

Cardinality names are semantic: `CARD-GE-12` means a theorem uniform under
`12 ≤ D.A.card`; `CARD-EQ-12` means an exact-cardinality finite census or
saved profile under `D.A.card = 12`. Bare “card-12 producer” is retired from
current-status rows. Historical file names and immutable artifact identifiers
are not silently renamed.

Last fully reconciled source inventory (live-rechecked 2026-07-26, retained as
a dated snapshot): the exact-four branch has since undergone further
on-spine decompositions, so its current leaf count must be read from the
regenerated `docs/live-blueprint.md`, not from the fixed counts below.

**Live reconciliation (2026-08-03, `proof-blueprint spine`).** The 2026-07-26
snapshot below is superseded in its counts and retained only as a dated
record of the branch shape at that time. Current authoritative state:

- 29 open obligations — 28 `sorry` theorems plus the induced `sorryAx`; all
  28 sit inside `ATailFrontierLiveClosure`;
- open nodes 93/36005; spine source 283943 lines across 36005 declarations;
- axiom posture core + `Lean.trustCompiler`, with 20 trusted certificate
  leaves covered by `#print axioms`;
- open-leaf families: Rigid221 / exact-four mutual-omission cluster (13),
  `retainedOmission` triApexAllLarge core (8), FreshThird
  `TwoSourceExactCollisionRowsTerminal` (5), `firstApexUniqueRadius` exactFive
  residuals (2). Family-level analysis and ranked recommendations are in
  `docs/p97-spine-closure-audit-2026-08-03.md`.

The 2026-07-26 snapshot follows.

- 6 direct source declarations with `sorry`, all in
  `ATail/FrontierLiveClosure.lean`;
- the unique-radius parent is source-clean and dispatches to the closed
  card-11 exact-four certificate plus four open leaves: the card-at-least-12
  exact-four arm now splits through a checked physical-second-apex producer
  into a checked robust post-card-eleven surface terminal and a swapped
  protected-exact-four terminal, followed by exact five with distinct
  obstruction centers and exact five with a common obstruction center;
- the all-large-caps tri-apex parent is source-clean and dispatches through the
  low-hit coordinator to two leaves: equal blockers with a concrete localized
  collision/exact-two packet, or distinct blockers with a concrete directed
  omission packet;
- the coordinator-interface frontier is therefore the same six load-bearing
  leaves as the direct kernel frontier; the former two parent obligations and
  the former undifferentiated card-at-least-12 exact-four obligation were
  narrowed by checked, exhaustive, acyclic splits rather than proved
  independently; and
- `sorryAx` is the kernel marker reached through the six direct leaves, not an
  additional source obligation.

The ERASE lane is permanent at pushed commit `652fdfcb` on
`four-point-subpacket-reduction`; this is still not a repository-wide
publication snapshot. All 128 P2 native leaves, `P2Closure`, `ErasedPinRowResiduals`, and
`Continuation` build; the P2/P4 downstream exact-pin theorem is kernel-complete
with 0/1376 open nodes, and its target-specific `verify-publish` gate passes.
A final cached rerun of `scripts/build-p2-certificates.sh` completed all 16
batches and the 8410-job aggregate `P2Closure` target with exit code 0.
Global publication remains open because the five Front-A leaves remain
unproved. The former shared-radius/LIVE-Q/C surface is bypassed and retired,
not individually proved; the production caller now dispatches through
`CriticalPairFrontier`.

Historical snapshot (2026-07-09, build fingerprint `002b0247c64e`,
6024/6024 mined symbols fresh): 5 declarations / 87 holes, P97 spine
23/1827 open, P96 spine 27/1835 open. The route-(b) split added the sixth
declaration `Problem97.isM44EndpointGeneralMResidualsExcluded` (the
general-m endpoint leaf) with one hole.
Inventories in this file are dated evidence, not dispatch truth. Before
taking a row, run `CTRL-GRAPH` and record
the source-index state, current build/mining fingerprint, open theorem names,
and source artifact. Publication remains blocked by the live spine, not a
historical snapshot.

Statuses:

| Status | Meaning |
|---|---|
| DONE | Deliverable exists and its stated gate passed. |
| RUNNING | A live process is producing the artifact; no terminal verdict yet. |
| PAUSED | A resumable process has no live owner and no terminal verdict. |
| OPEN-ENG | Mechanism is known; implementation or finite verification remains. |
| OPEN-PROOF | Exact theorem is known; mathematical proof remains. |
| OPEN-RESEARCH | Exact terminal theorem is known, but no complete mechanism is known. |
| DECISION | Mutually exclusive route choice; do not dispatch dependent rows yet. |
| OPTIONAL | Diagnostic/off-spine work; does not close a current `sorry` by itself. |
| PARTIAL | Some stated deliverables exist, but the row's acceptance gate is open. |
| DONE-CODE | Code and its local tests exist; a stated live or integration gate remains. |
| DONE-CORE | A reusable formal kernel is proved and audited, but its route-specific adapter is not complete. |
| OPEN-ADAPTER | The remaining work is a proved transport from the route packet to an existing formal kernel. |
| RESTART-PENDING | A completed code path is not yet active in the legacy live process. |
| LIVE-GATE-PENDING | Code and local tests exist, but a required live terminal or publication gate has not yet run. |
| ACTIVE-PRELEASE | A live process is running, but its terminal evidence has not been accepted. |
| ACTIVE-RESUMABLE | Durable state is advancing or can resume, but the dated log/process state must be rechecked before action. |
| STOPPED-BOUNDED | The process reached an explicit resource/time/iteration stop and published a durable nonterminal result. |
| DONE-BOUNDED | The stated finite or saved-artifact scope is complete; no broader theorem is claimed. |
| LIVE-EXERCISED | The implementation has run successfully in production, but another stated gate keeps the row partial. |
| PARTIAL-PRODUCER | A formal kernel exists, but the route-specific geometric producer is still open. |
| OPEN-PRODUCER | The remaining obligation is the exact producer feeding an existing proved consumer. |
| DONE-REDUCTION | A checked exhaustive producer or case split is complete; this does not imply that its leaves are proved. |
| PROMOTION-PENDING | A stable checked decomposition is staged, but the preflight, production import, or post-promotion gates remain open. |
| OPEN-INTERMEDIATE | A load-bearing on-spine theorem is deliberately selected at coordinator granularity and may still have a checked finer split beneath it. |
| OPEN-TERMINAL | A load-bearing on-spine theorem is selected as a direct proof target, with no deferred checked case split beneath it. |
| COMPAT-ONLY | An adapter or exported wrapper retained for migration; it receives no proof-progress credit. |
| PARKED-SPEC | An off-spine exploratory proposition or prose target; it is not a current proof obligation. |
| IMPLEMENTED-ON-UNSAT | The implementation is ready but activates only after a checked UNSAT result. |
| OPTIONAL-PARTIAL | Optional research has partial infrastructure or evidence but no closure claim. |

Semicolon-separated statuses describe independently auditable components; the
row is not complete until its stated acceptance gate passes.

Before taking a row, run `proof-blueprint anchor list`, inspect the current
diff in every affected file, and avoid any row owned by an active session.

### Live robust ingress correction (2026-07-20)

**PROVEN PRODUCER; OPEN TERMINALS.** `ATail/BiApexRobustCapBounds.lean`
kernel-checks `first_oppCap_card_ge_six R`,
`second_oppCap_card_ge_five B.secondApex_robust`, and
`carrier_card_ge_thirteen B`. These use complete ambient radius classes, the
retained first-apex double deletion, second-apex robustness, and endpoint
one-hit geometry. Thus cards 10--12 cannot realize the live robust parent;
this is a cap-cardinality result, not `False`.

The checked dispatcher `biApexRobust_exactFiveSecond_or_largeOppositeCaps`
gives the only admissible follow-up:
`S.oppCap2.card = 5 ∨ 6 ≤ S.oppCap2.card`.  The large branch constructs the
existing `FrontierLargeOppositeCapsBiApexRobustResidual B`; the exact-five-cap
branch remains a new named robust residual.  Existing exact-five-radius,
exact-six, and exact-seven modules do not close that branch: their interfaces
require the cap-six `L` packet and additional radius/all-reverse data.  This
producer would exclude cards 10--12 on the robust arm, but it closes no source
`sorry` until both split branches reach terminal consumers.

**DONE-SOURCE BY CAP REDESIGNATION.** The exact-five residual is closed directly
by `false_of_frontierBiApexRobustExactFiveSecondCapResidual`. It redesignates
the first opposite cap as surplus; a fresh common-deletion parent would force
the old exact-five cap to contain at least six points, while the other branch
enters the protected unique-radius theorem. The retired profile and
global-cover-star wrappers carried no proof information and have been removed.
`ATail/ParentExactFiveSecondCap.lean` remains a theorem bank for the retained-row
bridge, exact three-point physical set, impossibility of the global all-reverse
arm, and sharp mutual-endpoint row dichotomy. The historical finer surface was
the both-one-hit or asymmetric one-hit mutual-row case. A closer must use global
K4 coupled to those named rows, `R.minimal`, or a complete alternative
`IsM44` packet; the now-archived `ParentExactFiveAssembler` route was
inapplicable because it required the cap-six `L` branch.

## Kernel obligations

> **Current fixed-card override.** K-A-UNIQUE-POST11 supersedes the
> fixed-card-11 P4/P5 ingress and “no production closure” clauses retained as
> dated evidence in K-A-UNIQUE-DISPATCH. Only its arbitrary-card exact-four
> work, now scoped to card at least 12, and its general global-terminal
> research remain open.

| ID | Status | Source declaration | Direct consumer | Completion gate |
|---|---|---|---|---|
| K-A-UNIQUE-POST11 | DONE-PRODUCTION-WIRING; PUBLISHED-SPINE; APPROVED NATIVE TRUST BOUNDARY | `P97/ATail/CardElevenUniqueFourCertificate/`; `P97/ATail/CardElevenUniqueFourCertificateIngress.lean`; `false_of_firstApexUniqueRadiusExactFourResidual_of_card_eq_eleven` | `FrontierLiveClosure.lean` imports the ingress and closes the card-11 wrapper by `Problem97.ATailCardElevenUniqueFourCertificate.false_of_firstApexUniqueRadiusExactFourResidual`. | The production graph contains all 2,061 source modules, including both checkpointed replay trees (922 compact and 742 windowed modules), and all 1,656 directly referenced replay assets in the main `Erdos9796Proof` library. It is on both published spines and has no `sorryAx`; its axiom closure includes approved `Lean.ofReduceBool` and `Lean.trustCompiler`. A clean checkout has no historical-tree path, vendor-package, or external replay-bundle prerequisite. The checked-in manifest's `--check` reads only production-tree files; `--check-source` is a provenance-only reconstruction audit. |
| K-A-N11-EXACT5-G3 | DONE (2026-08-01, commit 553206dc); THEOREM-LEVEL CLOSURE UNDER THE APPROVED NATIVE TRUST BOUNDARY | `P97/ATail/CardElevenUniqueFourCertificate/Support/ExactFiveCommonShellV7/`; `G3Checkpoint0ClauseBank`; `S2O0TextIngress`; `S2O0RetainedCoreClauseBank`; `FiniteN11Frontier.lean` | The card-11 common-center coordinator dispatches `.s2_o9`, `.s3_o0`, and `.s3_o9` through `CanonicalPacket.false_of_g3Checkpoint0_clause_bank`; the direct `.s2_o0` source branch calls `CanonicalPacket.false_of_s2O0RetainedCore`. Both are reached from `false_of_firstApexUniqueRadiusExactFiveCommonObstructionCenterResidual_of_card_eq_eleven` after the four-way `ShellCase` split, whose packet ingress is the source-constructive `ExactFiveCommonShellV7.exists_livePrefixPacket`. | The source bank declares 21 retained families over the frozen 81,253-clause `s2_o0` core and supplies the source-clause permutation plus direct valuation bridge; the G3 side satisfies the 273,017-clause authenticated core plus one fresh padding unit and discharges it through the compact windowed RUP replay. Gate met and re-measured on 2026-08-01: `#print axioms Problem97.FiniteN11Closure` is exactly `{propext, Classical.choice, Lean.ofReduceBool, Lean.trustCompiler, Quot.sound}` — no `sorryAx`, no custom axiom — and the same closure holds for `false_of_twoLargeCaps_commonCriticalMap_of_card_eq_eleven`, the common-center residual consumer, `false_of_g3Checkpoint0_clause_bank`, `false_of_s2O0RetainedCore`, and both source-clause satisfaction lemmas. `proof-blueprint spine Problem97.FiniteN11Closure` reports `0/35304` open under core + approved `Lean.trustCompiler`. Scope: this closes the fixed-`card = 11` branch only. The general arbitrary-card `false_of_firstApexUniqueRadiusExactFiveCommonObstructionCenterResidual` (`FrontierLiveClosure/Rigid221Closure.lean:1035`) is untouched and remains open on the `erdos97_rhs` spine. |
| K-A-PAIR | SUPERSEDED AS ACTIVE GRANULARITY; OLD COMPATIBILITY ENDPOINT ARCHIVED; SIX-LEAF FRONTIER RECORDED IN K-A-LIVE | `false_of_originalFrontierUniqueRadiusArm`; `false_of_frontierAllLargeCapsTriApexRobustResidual` | Preserve the two source-clean parent coordinators and close their six immediate open production leaves recorded in K-A-LIVE. | The legacy shared-radius theorem and LIVE Q/C implementation were removed from production comments and preserved under `docs/archive/2026-07-25-u1-route-b-tail-retired/`. The live parent dispatches through `CriticalPairFrontier`. Checked exhaustive case splits now leave four open unique-radius leaves and two tri-apex low-hit leaves; the card-11 exact-four branch is closed, while the card-at-least-12 exact-four branch has been narrowed to the robust post-card-eleven surface and swapped protected-exact-four terminals. |
| K-A-UNIQUE-PHYSICAL-SPLIT | DONE-PRODUCTION-PRODUCER AND ROBUST-SURFACE REFINEMENT; PUBLISHED-SPINE; TWO DIRECT TERMINALS OPEN | `P97/ATail/ExactFourPhysicalConsumer.lean`; `P97/ATail/ExactFourRobustCapExpansion.lean`; `false_of_exactFourPostCardElevenRobustSurface`; `false_of_exactFourPhysicalConsumerSwappedUniqueFourOutcome`; `false_of_firstApexUniqueRadiusExactFourResidual_of_carrierCard_ge_twelve` | Close the two direct terminals. The robust leaf retains the original exact-four residual and `12 ≤ D.A.card` through `ExactFourPostCardElevenRobustSurface`: the source-faithful ingress, physical-second-apex deletion robustness, opposite-cap bounds `4` and `5`, the complete deletion-robust radius classification, and an exhaustive cap-growth witness. The swapped leaf retains the original residual, bound, ingress, and protected swapped exact-four frontier. | First frontier change: one undifferentiated card-at-least-12 exact-four `sorry` became the two immediate `robust | swappedUniqueFour` constructors of `ExactFourPhysicalConsumerOutcome`. Second frontier change: the former robust direct `sorry` became a source-clean one-constructor wrapper over `false_of_exactFourPostCardElevenRobustSurface`; direct-`sorry` count stayed six, while the robust hypothesis package strictly strengthened by checked consequences. Both producers build under Lean 4.27.0. `nonempty_exactFourPhysicalConsumerOutcome` and `nonempty_postCardElevenRobustSurface_of_robust` each have axioms exactly `propext`, `Classical.choice`, and `Quot.sound`. The splits are acyclic and source-clean. A scratch-wide exact-signature and package-consumer audit found no checked `False` theorem for the robust surface: the robust-plus-swapped theorem cannot fire on the robust-only constructor, and the post-card-eleven coordinators only assume the missing contradiction. The five-way large-radius continuation remains an intermediate normalization, not promoted terminal fan-out. |
| K-A-UNIQUE-DISPATCH | ARBITRARY-CARD SOURCE REDUCTION DONE-SCRATCH; ENRICHED ROBUST-O2 / SWAPPED-EXACT4 GLOBAL TERMINALS OPEN; ALIGNED-P5 FIXED-N11 CONSTRUCTOR SOURCE-CLOSED; P4/P5 EXACT-TWO LEAN INGRESS OPEN; NO PRODUCTION SORRY CLOSED | `scratch/atail-force/unique-arm-route-audit/{UniqueArmDeletionNormalForm,OriginalUniqueResidualDispatch}.lean`; `scratch/atail-force/unique4-{class-cap-distribution,complete-radius-spine-bridge,corrected-curvature-schema,star-producer,source-field-audit,kalmanson-occurrence,occurrence-feasibility,occurrence-metric-audit,p4-full-linear-certificate,p5-v3-full-linear-certificate,n11-source-lift,aligned-p5-terminal,aligned-p5-occurrence,source-closer,escape-localization,robust-o2-terminal,robust-global-terminal,swapped-terminal,swapped-global-terminal,robust-provenance-curvature,singleton-core-terminal,singleton-repeat-producer}/`; `false_of_originalFrontierUniqueRadiusArm` | Prove `false_of_exactFourPhysicalConsumerOutcome`: close (1) the original exact-four residual plus physical common-deletion ingress plus robust physical second apex, and (2) the original residual plus the same ingress plus the protected swapped exact-four frontier. The second arm must couple the original and swapped packets or prove strict descent, not recursively invoke the same dispatcher after erasing data. For the fixed card-eleven fallback, prove source-valid direct/mirror occurrence ingress for the p4 and p5 exact-two constructors. The aligned-p5 constructor is closed by the native schema 1/4/6/9 occurrence theorem. Use global K4/minimality, full critical-fiber provenance, MEC, or `noM44`; do not resume unbounded local literal CEGAR or add another nonterminal continuation adapter. | The source-clean closer rebases to the late system, proves at least seven sources outside the exact four-source first-apex fiber, bounds sources bad for both retained deletions by two, obtains at least five good sources, and constructs a `CommonDeletionTwoCenterPacket` using the physical second apex. The swapped arm now source-cleanly couples both complete exact-four classes and retained pairs; the existing two-by-two continuation bank yields four nonterminal outcomes. A corrected endpoint-one-hit/full-Kalmanson QF_LRA fixture survives that local surface. On the robust arm, every nonalternating two-point row overlap is already killed by the production two-center parity terminals; the honest overlap is at most one or exactly two with cyclic alternation. Exact QF_LRA witnesses survive the exact-five large-class local subarm, while the two-distinct-radii subarm remains separate. These are finite linear abstractions, not Problem 97 counterexamples; both arms still require a global terminal. Separately, the p4 and p5 exact-two fixed-`n = 11` projections are exact DRAT-verified. P4: 12,672 variables, 2,765,403 clauses, CNF SHA-256 `d1ff6359442edebbafa2ea9a01aa77c439a681b62a186e73cdbf528028fdb536`, proof SHA-256 `8460ec3f078691772de38bf2d47e5a973917cb4290cb9e8aea3adfe30f881f62`. P5 exact-two: 12,672 variables, 2,768,417 clauses, CNF SHA-256 `cbfd6ad9559dce5c9da5874a15da0ba7b5c876dfbaa056fc6eb009fc107119a1`, proof SHA-256 `21d83f574691d268aabe24badc7d4cb2a836a4a0b80a851845334096293d0841`. Warning-clean `CardElevenUniqueFourCoverage.lean` proves the exact source split p4 exact-two | p5 exact-two | aligned p5. The formerly uncovered aligned-p5 projection is now source-audited and exact DRAT-verified: 15,192 variables, 2,791,032 clauses, CNF SHA-256 `50a8062cb9b089cc6f3a47497face0a46ceacb5e86152ec04fc5f3c6557b9c7f`, proof SHA-256 `6a58c8c26732122f53f1d883c44fcd9a0ddee34f501d61e24dd94605abe127f4`, literal `s VERIFIED`, 18,821-clause checker core. A 32,203-clause stripped UNSAT removes U5, planar, critical-system, both minimality, curvature, seeded, and pair-identification families; greedy bank reduction retains only four locally kernel-checked Kalmanson schemas (`1,4,6,9`). The 27,781-clause compact formula is also exact DRAT-verified (CNF `081ba956b308c643fa9e845e0340017647de405aea42e6d0601679a1267f12f4`; proof `f7008bc65433436329029c0b2f041847f5464d3a68046e6377f5a2d1a7511c72`) with a fully mapped 6,350-clause checker core. That core uses no strong-connectivity, retained-pair, second-apex-row, critical-map, minimality, curvature, planar, or U5 clause. The p4 and p5 exact-two formulas still need Lean source-to-occurrence ingress; the aligned-p5 formula now has a warning-clean direct/mirror source bridge. None covers arbitrary cardinality. The swapped and robust global-terminal audits also show that one universal-minimality escape or one preselected extra K4 row remains locally SAT; frozen named-role all-center fixtures can be UNSAT, but arbitrary ambient rows may use unenumerated points. A stronger re-search with K4 at every center of the protected set is already exact QF_LRA SAT on `common_delete_5`, so local collective row availability alone is not the missing implication. The sharper protected set is the two displayed apex supports plus the two apices, with card at most ten; minimality puts an escape center in the support union, but the exact incidence regression still avoids every one-row terminal. The live target is therefore a collective arbitrary-card occurrence/localization into an existing Kalmanson, two-center, `CriticalFiberClosingCore`, or complete `IsM44` terminal. The aligned-p5 source theorem closes that fixed constructor, but no production source hole. |
| K-A-EXACT5-GLOBAL-COVER | DONE-SOURCE 2026-07-22; EXACT-FIVE TEXTUAL `sorry` REMOVED BY CAP REDESIGNATION; AXIOM CLOSURE STILL INHERITS UNIQUE-ARM `sorryAx`; EXACT CARD 13 SOURCE-FRESH VALIDATION IN PROGRESS | `ATail/FrontierLiveClosure/`; `false_of_frontierBiApexRobustExactFiveSecondCapResidual`; `false_of_originalFrontierUniqueRadiusArm`; `first_oppCap_card_ge_six`; `scratch/atail-force/cardge14-global-occurrence/ExactFiveCapRedesignation.lean`; `scratch/atail-force/exact5-card13-distinct-radius-source-ingress/coordinator/` | Close `false_of_originalFrontierUniqueRadiusArm`; the exact-five path then becomes `sorryAx`-free automatically. Finish the independent card-13 generated-module rebuild and axiom audit, but do not make it a live dependency. Do not resume card-at-least-14 exact-five occurrence mining. | Redesignate the old `S.oppCap1` as surplus. The checked identities are `T.surplusCap = S.oppCap1`, `T.oppCap1 = S.oppCap2`, and `T.oppCap2 = S.surplusCap`; hence `T` is a valid surplus packet and `T.oppCap1.card = 5`. A fresh frontier for `T` either enters the existing unique-radius terminal or supplies a common parent, but the latter contradicts source-clean `first_oppCap_card_ge_six`. The proof uses no exact-five profile/outcome, no card split, no large-opposite theorem, and no recursive exact-five call. Separately, all 512 direct and 512 mirror card-13 cubes and complete source maps exist; representative source callbacks pass, while the full source-fresh callback rebuild and final axiom audit are still running. That certificate is no longer load-bearing for the live source declaration. |
| K-A-ALL-REVERSE-OCCURRENCE | RETIRED TO ATTIC 2026-07-26; NEVER PUBLISHED; NOT A CURRENT OBLIGATION | `attic/atail-exact-five-parent-assembler-2026-07-26/README.md`; historical `ParentExactFiveAssembler.lean` | None. The live exact-five branch is closed by cap redesignation in K-A-EXACT5-GLOBAL-COVER. | The 13-module import-closed component was unreachable from both library roots and the executable root. One component root lost its last spine import in `b6b15763`; the other three roots were never wired. The choice-free co-radial occurrence was never proved, so the former helper typechecks never justified `DONE-PRODUCTION`. Revival requires an explicit on-spine promotion with a loud remaining obligation. |
| K-A-P3-QUOTIENT | ARCHIVED DIAGNOSTIC FOR RETIRED ALL-REVERSE ROUTE; NO CURRENT ACTION | `period-three-first-apex-kalmanson/SOURCE_AUDIT.md`; `period-three-full-role-identity-quotient/`; `period-three-named-source-alias-decision/` | None. Preserve only as regression evidence for any future explicitly promoted route. | A source-faithful fully disjoint 25-role cell satisfied the linear row, triangle, Kalmanson, order, and alternation constraints. This showed that linear or alias coverage could not prove the historical occurrence leaf; it closed no `sorry`. |
| K-A-P3-ORDER | RETIRED TO ATTIC; CHECKED OFF-SPINE HELPER, NEVER PUBLISHED | `attic/atail-exact-five-parent-assembler-2026-07-26/LargeCapUniqueFivePhysicalOmissionSharedCapOrder.lean` | None. | The helper focused-typechecked and had only the three core axioms, but no publish target ever consumed it. It moved with the 13-module component and receives no production closure credit. |
| K-A-P3-FIRST-APEX | RETIRED TO ATTIC; CHECKED OFF-SPINE HELPER, NEVER PUBLISHED | `attic/atail-exact-five-parent-assembler-2026-07-26/FirstApexShellRole.lean`; `FirstApexShellRoleExtractor.lean` | None. | The packet and extractor focused-typechecked and had only the three core axioms, but no publish target ever consumed them. They moved with the 13-module component and receive no production closure credit. |
| K-A-P3-DIAG | ARCHIVED DIAGNOSTIC FOR RETIRED ROUTE; BOUNDED EXACT UNSAT WAS AN ENCODING ARTIFACT | `period-three-first-apex-kalmanson/{REPORT.md,RESULT.json,decide_quotient.py}`; `period-three-kalmanson-core-schema/common_schema_census.json` | None. | All 10,368 historical cells died from one unsupported three-constraint core. This diagnosed the encoding; it did not establish the occurrence leaf or close a `sorry`. |
| K-A-P3-LINEAR | ARCHIVED DIAGNOSTIC FOR RETIRED ROUTE; EXACT QF_LRA SAT | `period-three-full-role-identity-quotient/` | None. | The source-faithful linear relaxation was feasible. It was not a planar/MEC realization or counterexample, and it closed no `sorry`. |
| K-A-P3-RANK2 | ARCHIVED DIAGNOSTIC FOR RETIRED ROUTE; BOUNDED QF_NRA UNKNOWN | `period-three-rank2-coordinate-probe/`; `period-three-rank2-encoding-audit/` | None. | Z3 and cvc5 timed out on the fixed projection and its prefixes. `unknown` remains unresolved evidence, not infeasibility or closure. |
| K-A-P3-NUM | ARCHIVED DIAGNOSTIC FOR RETIRED ROUTE; 480 BOUNDED STARTS, NO VERIFIED HIT | `period-three-rank2-numerical-seed/`; `period-three-exact-seed-lift/`; `period-three-seed-compatible-cell/`; `period-three-rank2-interior-point/` | None. | The campaigns produced no substitution-verified hit. This is bounded numerical no-hit evidence, not infeasibility, and closed no `sorry`. |
| K-A-P3-PROSE | ARCHIVED NONTERMINAL DOMAIN REFINEMENT FOR RETIRED ROUTE | `prose-backup-period3-match/REPORT.md` | None. | The prose candidates lacked required positive source fields and closed no source obligation. |
| K-A-LIVE | CARD-11 EXACT-FOUR CLOSED; PARENT AND CAP-SOURCE COORDINATORS SOURCE-CLEAN; SIX TRANSITIVE TERMINALS OPEN PENDING GENERATED REFRESH | `Problem97.u1_largeCap_routeB_tail_liveData_false`; `ATail/FrontierLiveClosure/` | `u1_largeCap_routeB_tail_false` | The live caller extracts one concrete `CriticalShellSystem` and dispatches through `CriticalPairFrontier`. The all-large tri-apex directed-omission terminal and the exact-collision sibling `false_of_crossBlockerCoincidence` remain open. `false_of_capSourceThirdCanonicalRowSurface` is a source-clean exhaustive coordinator. Its former mixed descendant `false_of_capSource_firstFiber_collisionFiveCenterDeletion` is source-clean and dispatches to two stronger on-spine leaves: `false_of_capSource_firstFiber_outsidePairDeletionExactRows` and `false_of_capSource_firstFiber_crossedThreeRowExactSupports`. The before/after coordinator frontier is one implicit four-constructor mixed obligation versus two explicit constructor obligations with immediate fan-out two; the parent proves every orientation and both leaves retain the independent four-way collision-endpoint exact-row residual. The deletion leaf has exact U5 q-deleted rows but no positive cross-row occurrence. The crossed leaf has three exact supports plus both complementary omissions, and production support-locking proves that neither anonymous fourth point has the first collision blocker and that either relevant cross-blocker equality forces equality of the anonymous fourth points. Schema-v8 forced-shared-fourth CEGAR remains finite `SAT` after 188 candidates; its full 204-row metric replay survives the prior production bank. The surviving witness is refuted by an exact fourteen-role core of sixteen radius equalities, eight main Kalmanson inequalities, and two complementary inequalities. `CapCrossingKalmansonBridge.false_of_fourteen_ccw_sixteen_shell_equalities_global_core` is a source-clean Lean 4.27 theorem covering both the direct increasing and reflected decreasing boundary chains after cyclic recut, with transitive axioms exactly `propext`, `Classical.choice`, and `Quot.sound`; `global_kalmanson_14role_16eq` registers the matching guarded schema-v9/v7 family, whose targeted replay kills that witness. The first v9 resume reconstructed the actual 203,687-cut v8/v6 checkpoint, processed 378 more connected candidates, and banked 285 structural plus 10,054 theorem cuts before `UNKNOWN_TIMEOUT`; it emitted no uncaught witness but did not establish `UNSAT`. The second source-at-common tranche processed 947 further candidates, added 484 structural and 23,470 theorem cuts, and ended `UNKNOWN_FAIL_CLOSED` at its exact 1,800-second deadline; the checkpoint now contains 9,082 structural and 228,898 theorem cuts. Exact restore-local formula caching reconstructs that learned-cut checkpoint in 79.027 seconds after base-audit construction, versus the earlier roughly four-minute learned-cut phase, with cached/uncached `sexpr` and roundtrip regressions passing. Its required global indexed-Lean/theorem-bank pass found no credible new general-cardinality candidate: every fresh key belongs to an existing family, the fourteen-role family matched zero times, and 712 selected-row cuts are exactly subsumed by their corresponding raw-equality families. The two CEGAR orientations are genuinely distinct: only `source` carries the first-source blocker equality, and the existing row swap preserves source/other roles, so both `source-at-common` and `other-at-common` require exhaustion and checked materialization unless a new blocker-equality lemma for `otherOutsidePoint` is first proved. All 22 registered theorem-cut families have mathematical producers; six stale producer interfaces were repaired by four namespace metadata corrections, an orientation-complete convex-five wrapper, and a production cardinality-generic six-point two-`K2` theorem. Base-CNF and structural-clause semantic bridges remain open. The declaration is production-import-reachable but is not yet a transitive publish dependency. The next step is continued exhaustive v9 CEGAR followed, only if exhausted, by a checked materializer feeding the crossed leaf. The focused coordinator check passes; the ordinary Lake target is currently blocked earlier by the independent `WitnessPacketInterface`/`PinnedMultiplicity` import cycle. No production terminal was closed: one mixed `sorry` was replaced by two strictly narrower transitive `sorry`s. Compatibility-only adapters, fixed-witness elimination, and timed-out CEGAR tranches receive no closure credit. `docs/live-blueprint.md` remains autogenerated and becomes authoritative after the next successful refresh. |
| K-B-PIN | DONE (2026-07-12, spine-verified post build refresh) | `Problem97.isM44PinnedSurplusGeneralMResidualsExcluded` in `PinnedSurplusGeneralM.lean` | `isM44PinnedSurplusResidualsExcluded` | The open `5 < m` branch is forced to `m = 6`, `A.card = 11`, with exact `(6,4,4)` cap-selected hit counts; all six incidence fields and native placement soundness are proved. `CapSelectedPinnedShellBridge` consumes every right aligned residual packet through all twelve certified core cases. The new `U2NonSurplusSqueeze.NonSurplusSwap.pinnedLeft_to_right` field proves the left-to-right reflection for all three surplus-index cases, preserving minimality, `(m,4,4)`, and surplus-cap cardinality; the terminal relabels the swapped packet and reuses the right producer and closure contradiction. `PinnedSurplusGeneralM.lean` has no source `sorry`, and direct Lean elaboration passed. Build refreshed 2026-07-12 after the U1 owner landed P1b (86149679) + the ERASE-P2 redraft (3d27977c): full library green, 9308 jobs; `PinnedSurplusGeneralM.lean` built clean with zero sorry warnings. `proof-blueprint axioms` on the declaration: core + `Lean.ofReduceBool` + approved `Lean.trustCompiler`, no `sorryAx`; the declaration left the `proof-blueprint spine` open-obligations list (anchor [closed]). |
| K-B-END-LABEL | DONE (2026-07-11) | `Problem97.isM44EndpointResidualsExcluded` (`Base.lean`; both former `hshadow` holes proved) | `removableVertexOfLarge_of_isM44PinnedSurplus_from_residualSplit` | Route (b) implemented (136ebb9b) and the m=5 branch fully proved: `EndpointCertificate/GeometryProducer.lean` (sorry-free) supplies `endpointLeft/Right_residual_false_of_card_five`, each covering both ambient CCW apex orientations (direct + reflected kernels `SurplusCOMPGBankGeometry.lean:1498/:1621`; apex orientation SYMMETRIC not forced per the 2026-07-11 prover verdict; the mirror residual flips the kernel pairing). Gate passed: full library green. Its former general-m dependency later closed under K-B-END-GENERAL; the endpoint cluster is absent from the current open inventory. Commits: 858b7e39, 8a7e6d1b, b2183714, 35bc63aa, f67e7818, e7ee31a2, plus the right-residual closure. |
| K-A-LIVE-E1-SPLIT | ACTIVE 2026-08-02 — FOUR TERMINAL-SPECIFIC LOUD LEAVES; THREE DISPATCHERS PROVED | `ATailFrontierLiveClosure.false_of_retainedOmission_pairedCommonDeletion_triApexAllLarge_core`; `ATailFrontierLiveClosure.false_of_retainedOmission_reverseHitFresh_{endpointCrossHit,endpointCommonDeletion,threeDistinctBlockers}_triApexAllLarge_core`; proved dispatchers `ATailFrontierLiveClosure.false_of_retainedOmission_reverseHitFresh_endpointCriticalFiber_triApexAllLarge_core`, `ATailFrontierLiveClosure.false_of_retainedOmission_reverseHitFresh_triApexAllLarge_core`, and `ATailFrontierLiveClosure.false_of_retainedOmission_triApexAllLarge_core`; producers `ATailFrontierLiveClosure.exists_reverseHitFresh_nonreturnEndpointClassification` and `ATailFrontierLiveClosure.exists_reverseHitFresh_endpointCriticalFiber_continuation`; ordered consumer `ATailFrontierLiveClosure.false_of_endpointFreshCrossHit_of_orderedPlacement`; `ATailSevenSourceCriticalShellMutualOmission.exists_mutualOmission`; `ATailExactFifteenApexProfile.exists_exactSixClass_or_all_exactTwoFourClasses_of_card_eq_fifteen`; `docs/computational-closure-plan-2026-07-28.md` | Existing E1 compatibility wrapper and Route-B publish spine | Stop treating one heterogeneous exact-15 CEGAR master as the uniform proof target. Run in parallel: canonical exact-15 archetypes with checked symmetry/cross-case coverage; general Lean soundness theorems, beginning with the verified seven-source physical-shell mutual-omission producer; a replayable exact-15 Boolean coverage certificate; and a source-faithful general-cardinality lift by bounded obstruction or valid deletion/minimality descent. Exact-15 closure alone does not prove the uniform `15 ≤ A.card` core. The checked exact-15 profile dispatcher is two-way: some apex has an exact six-class, or every apex is exact `4+4`; this is exhaustive but not itself a profile-level child frontier. The normalized retained-omission sum type first splits the former one-`sorry` parent into paired-common-deletion and reverse-hit/fresh branches. The nonreturning two-step producer now proves the reverse-hit/fresh coordinator and splits it into an origin-tagged endpoint critical-fiber collision or three pairwise-distinct actual blockers. The endpoint collision then splits source-faithfully into a positive cross hit or a new common-deletion packet. The terminal frontier is therefore four immediate publish-spine consumers; the raw open count changes one to four, so this is tractability decomposition rather than closure. The endpoint cross-hit branch has a proved `OrderedCrossRowCore` adapter and lacks only its six-role cyclic-order placement producer; the three-distinct branch lacks selected-row ordinal-comparison edges for a strict cycle. The S-profile mutual-class soundness theorem needs only one cap of cardinality exactly six, so exact-15 all-large caps are a corollary; the theorem remains coverage-gated because universal E1 supplies only lower bounds. Its v30 exact-15 cut census removed only 21 of 11,601 completed proposals, all already `UNSAT`, so it is neither a convergence signal nor uniform E1 progress. Every CEGAR terminal requires a global theorem-bank audit; odd rounds additionally require an efficiency/observability audit. |
| K-B-END-GENERAL | DONE (2026-07-12, commit 3114fb1f) | `Problem97.isM44EndpointGeneralMResidualsExcluded` (`Base.lean:9511`, hole `:9513`; stated strictly `5 < S.surplusCap.card`) | `isM44EndpointResidualsExcluded` (`m ≠ 5` branch) | General-m endpoint leaf, routed to the forced `m = 6` / `A.card = 11` machinery (K-B-PIN). Cannot consume K-B-PIN unchanged: endpoint escape forces the Moser apex OUT of the escaped row, failing `PinnedShellOK`. Scoped extension required (see `docs/archive/2026-08-03-doc-sweep/audits/2026-07-11-endpoint-generalm-representability.md`): `EndpointLeft/RightShellOK` seed predicates, classifier extension to the seed union, one (4,2,2) bridge seed-production case, endpoint source consumers. Finite gate PASSED 2026-07-11 — EXACT WITHIN MODEL, not PROVEN: 64-placement sweep (both families, twelve formalized metric cores, enumerate-residuals, complete=true) returned zero residuals (`census/endpoint_confinement/endpoint_direct_metric_core_residuals_n11.json`); no new metric cores needed. STAGING LANDED (5c44d1fc, 6fbde4a8): `EndpointCertificate/GeneralMCardEleven.lean` (sorry-free, no Base import) — card-11 forcing transport, full left+right escape row-shape families (selected classes card-4 interior-pinned, escapee strict-interior + surplus-cap disjointness), and the `EndpointLeft/RightShellOK` seed predicates over the `Fin 11` vocabulary matching the probe encoding. Next: endpoint placement checks against the committed native classifier (gate: `#eval` all 64 before proving — the Lean `hasPrefixCore` core set is not identical to the probe's core granularity), then the soundness transport mirroring `CapSelectedNativeClosureSound` (committed c5fcf286). BRIDGE LANE 2026-07-11 late: transport map `docs/archive/2026-08-03-doc-sweep/audits/2026-07-11-endpoint-classifier-transport-map.md` (58f93ae2 - left family reuses the committed search code verbatim; right family needs a center-2 detector fork with fresh native runs); bridge design `docs/archive/2026-07-16-doc-sweep/endpoint-generalm-bridge-design-2026-07-11.md` (a57c7e71, lemmas L1-L13; L9/L10/L10b done upstream at 9e6b5722 `incidenceOK_patternCode`); `EndpointCertificate/BridgeStaging.lean` landed 41d704f3 (L1a-L5: minimality glue, `labelOf`, Moser-cap class forcing + k4Radius uniqueness, endpoint no-qfree, T1 decomposition, row-0 two-intS-slots chooser - obstruction E1 discharged). ASSEMBLY INPUTS ALL LANDED 2026-07-11: `BridgeCarrier.lean` 9bac7853 (L6 public prescription constructor, L7 `endpointBlocker` + transports, L8 row-1 equation, right L3/L4 mirrors); `OrderedCoreSigns.lean` 2c32e3a1 (L12 branches 11-12, core axioms only); `EndpointClassifierSound.lean` + `EndpointClosureSound.lean` fffff751 (transport items 4-7; finals `closureCoreAlternative_of_incidenceOK_endpointLeft/RightShellOK`, axioms core + ofReduceBool/trustCompiler). Pinned lane 8ebadfa2 supplies `false_of_duplicateCenterCore_patternCode` + `false_of_perpBisectorCore_patternCode` for the branch dispatch. CLOSED 3114fb1f: `EndpointCertificate/BridgeAssembly.lean` (L11 `exactAt_endpointBlocker`, right L7/L8 mirrors, system-exposing blocker assemblies, L12b `false_of_closureCoreAlternative_of_canonical`, L13 `false_of_endpointEscapeLeft/Right_cardEleven`) + minimal Base.lean wiring at `:9513`. Leaf axioms: propext/Classical.choice/Quot.sound + Lean.ofReduceBool/Lean.trustCompiler (allowed set, no sorryAx); full library green (9307 jobs); spine open inventory 5 → 4 declarations. |
| K-B-ERASE | DONE (commit `652fdfcb`, pushed 2026-07-13) | `Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded` consumes all 20 row and 2 P4 `*_cardEleven_residual_excluded` theorems | `isM44NonSurplusContainmentExactPinResidualsExcluded` chain | Card-ten/card-eleven P2/P4, all 128 P2 native leaves, `P2Closure`, all 22 residual consumers, and `Continuation` build. The dispatcher, terminals, ERASE parent, and exact-pin parent have only core plus approved native-decision axioms and no `sorryAx`; exact-pin is 0/1376 open and its target-specific publication gate passes. This remains separate from the global gate, which is blocked by the live A-tail frontier; the card-11 replay trees are committed production Lean sources rather than a separate build prerequisite. |

### K-A-LIVE collision exact-two checkpoint (2026-07-26)

The equal-blocker low-hit arm now has a checked reduction to two source-exact
collision rows at distinct retained radii. The normal form retains four
disjoint strict-cap sources, distinct actual blocker centres, the complete
cross-omission rectangle, two localized mutual-omission cycles, and the
exhaustive `cap-card-at-least-eight | cross-blocker-equality` split. The
checked theorem `selectedFourClass_outside_overlap_card_le_one` additionally
proves that the two actual rows share at most one support point outside the
indexed cap.

An attempted one-child refinement claiming that those rows share at least two
outside points was rejected after a field-compatibility audit: every branch of
the finite split remains compatible with disjoint outside pairs, and neither
the localized cycles nor the all-large-cap packet supplies a positive shared
outside incidence. The import-reachable crossing terminal also needs two
common endpoints and a third common noncollinear point, none of which the
normal form provides. The speculative child was therefore removed rather
than promoted as a load-bearing obligation.

The collision coordinator
`exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows` is
source-clean.  At this 2026-07-26 checkpoint its checked downstream dispatch
reached four
narrower terminal theorems:
`false_of_crossBlockerCoincidence`,
`false_of_capSource_freshThirdBlockerFiber`,
`false_of_capSource_freshOutsideFirstBlockerFiber_alignedSingletonRadius`, and
`false_of_twoCapSources_oneSidedDeletionSurvival`.
These are four live declarations covering the equality, fresh-third-fiber,
aligned singleton-radius cap source, and one-sided row-omission arms.  The
universal aligned-radius theorem is now a source-clean coordinator into the
singleton-radius leaf.  The enlarged
second-fiber orientation is source-clean symmetry wiring into the first-fiber
coordinator.  The former collision-five-center descendants are no longer the
load-bearing interface.
The aligned singleton-radius arm has since been reduced by a source-clean
parent to the strict second-blocker non-bisector child recorded in the v17
checkpoint below; that child remains open.
The canonical shell-cover proof is no longer an input to any of the four leaves
or their coordinator chain: checked consumers reconstruct it directly from
`CriticalShellSystem H`.  The canonical low-hit bound is likewise
reconstructed only at its sole checked contradiction site instead of being
forwarded through the exact-two interfaces.
Post-refactor verification on 2026-07-28 passed the 10,855-job focused
`FrontierLiveClosure` build.  The refreshed kernel graph retains all four
declarations on the published spine and reports 21 open obligations across
the current roots.
Of the 44,112 indexed minable symbols at the preceding full-production
checkpoint, 44,049 were fresh, none was stale, and 63 were never-mined.  Those
63 occurred in 21 unbuilt off-spine WIP files: 51 symbols in
`scratch/` and 12 in `Census554/CapSelectedBVPlacements`.  Neither published
root reaches any of them.
The enlarged first-fiber theorem is a checked one-child coordinator for the
five-center-deletion terminal.  The enlarged second-fiber theorem transports
its packet through the checked second-to-first swap and reuses that same
coordinator; it is not an independent obligation.
`exists_three_hit_of_two_collisionRows_capCross_normalForm` remains its
checked downstream consumer.  A source-clean scratch audit,
`scratch/packet-contradiction-search/TargetConclusionImpossible.lean`, proves
that neither displayed outcome of the coordinator is locally realizable:
the three-hit arm violates the rich-apex two-circle bound, and every cross-hit
arm violates the exact disjoint cap-pair omissions.  The bridge must therefore
derive `False` from its retained global hypotheses and close by elimination;
it must not be described as a positive local three-hit producer.

The concrete global route is now the following sharp decomposition.

1. Convert the three richness fields of
   `FrontierAllLargeCapsTriApexRobustResidual` into deletion robustness.  The
   retained blocker endomap omits all three pairwise-distinct Moser apices.
2. Apply the Lean-4.27-checked finite theorem
   `third_fiber_or_larger_known_fiber_of_three_omissions` from
   `scratch/exact-four-three-omitted-counting/ThreeOmittedMultiplicity.lean`
   to the two named, distinct collision fibers.  It gives exactly three
   exhaustive arms: a third collision fiber with a new blocker value, a
   third source in `P`'s blocker fiber, or a third source in `Pρ`'s blocker
   fiber.  Fixed-point-freeness and additional cardinal bounds are not
   needed, and finite examples show that none of the three arms can be
   dropped.
3. Normalize that finite split with
   `collisionCrossHit_or_geometricMultiplicity` from
   `ATail/BlockerMultiplicityGeometry.lean`.
   This gives either one of the four requested named cross hits, a fresh
   third blocker fiber whose two sources occur in one another's canonical
   rows, or an enlarged known-fiber packet in which the two fresh points are
   exactly that row's shell-minus-first-cap remainder.  In the latter packet
   both remainder points avoid the opposite collision pair.  Thus the
   remaining multiplicity obligation is a positive global
   occurrence/alignment, not another cardinality estimate.
4. Map the already-produced
   `cap-card-at-least-eight | cross-blocker-equality` alternative to
   `TwoCollisionGlobalSplit P Pρ`.  Its two exact interfaces are
   `CapSourceThirdCanonicalRowSurface P Pρ` and
   `CrossBlockerCoincidence P Pρ`.  On the cap-eight arm, the production
   precursor
   `ATail/TwoCollisionGlobalProducer.lean` proves
   `exists_capSource_thirdCanonicalRow_omits_each_collisionPair`, deriving a
   third source
   in the strict first indexed cap, outside both collision pairs.  Its actual
   blocker differs from both collision blockers and both physical apices; its
   canonical row has cardinality four, contains that source, and omits at
   least one endpoint of each collision pair.  The scratch-packaged
   `triApex_patterns_and_exists_capSource_thirdCanonicalRow_connector`
   retains all three rich-cap patterns with this row.  This is the immediate
   cap-eight extraction interface.  The production
   `CapSourceThirdCanonicalRowSurface` now also retains the original bound
   `8 ≤ (S.capByIndex S.oppIndex1).card`; the earlier interface erased the
   cardinal margin needed by any cap-complement minimality argument.
5. Dispatch the checked product of the two splits.  A named cross hit from
   `collisionCrossHit_or_geometricMultiplicity` returns directly.  The
   `CrossBlockerCoincidence` side is sent to
   `false_of_crossBlockerCoincidence`; its immediate fan-out is the four
   equality constructors.  On the cap-source side, split
   `GeometricMultiplicityResidual P Pρ`.  Send the fresh-third constructor to
   its terminal, the enlarged first fiber through its checked retained-data
   descent, and the enlarged second fiber through the checked swap into the
   same first-fiber coordinator.
6. Prove the three leaves.  The equality leaf must use global minimality and
   `noM44` to rule out the equality or force a terminal surface.  The local
   packet cannot do this: blocker equality reorients to a cross omission, not
   a target cross hit, and
   `scratch/hard-branch-math/equality-arm-model.lean` realizes the relevant
   local metric/incidence fields exactly.  These arms therefore require a
   genuinely global argument rather than another local row rewrite.
   The fresh-third leaf still requires one positive global alignment: place
   its mutually incident pair into a second selected row or a rich strict-cap
   radius slice.  The remaining enlarged-known-fiber leaf is the explicit
   five-center-deletion residual produced by the checked first-fiber descent;
   the second-side case is already covered by symmetry.

The first enlarged-known-fiber leaf has since been narrowed by retaining the
first-apex radius of the two extracted cap sources.  The source-proved
`exists_two_capSources_thirdBlocker_crossPairDeletionSurvivals_of_commonRadius`
and its local witness adapter lift any two strict first-cap points on one
radius without erasing that common-radius membership.  Consequently
`false_of_twoCapSources_mutualCrossMembership_distinctBlockers` is now a
kernel-checked blocker-rigidity terminal: mutual row membership and the shared
first-apex radius force the two blocker centers to agree.  A Lean 4.27 focused
build and direct axiom checks give exactly
`[propext, Classical.choice, Quot.sound]` for both declarations, with no
`sorryAx`.

The source-proved coordinator
`false_of_capSource_freshOutsideFirstBlockerFiber` now splits on
`FirstCapMultiPointRadiiRetained`.  If that predicate fails, it extracts a
fresh multi-point first-apex radius distinct from both retained collision
radii, preserves the radius through the two cap-source witnesses, and reaches
the checked blocker-rigidity terminal on the mutual-cross-membership arm.  If
the predicate holds, every
first-apex radius with at least two strict first-cap points is one of `radius`
or `ρ`.  The checked lemma
`firstFiberCapSource_firstApexRadius_eq_singleton_of_aligned` then proves that
the named cap source is the unique strict first-cap point on its own
first-apex radius: a second point would align that radius with one of the two
retained collision radii, contradicting the source's checked exclusion from
both collision pairs.  The aligned-radii theorem and its singleton-radius
wrapper are therefore source-clean.  At this 2026-07-28 checkpoint,
`false_of_capSource_alignedSingletonRadius_of_secondBlocker_nonbisector`
was the exact remaining load-bearing leaf.  It retained the named cap-source
witness, its exact singleton-radius equation, one concrete fresh
enlarged-fiber witness, the universal alignment packet, and the strict
second-blocker non-bisection proved by the wrapper.  The 2026-07-30
canonical-row override/rebase checkpoint below supersedes that frontier:
this declaration is now a source-clean compatibility theorem reducing to
the already-open fresh-third-blocker leaf.  The 10,855-job Lean 4.27 focused
build passed after the original narrowing; the singleton normalization has
axioms exactly `[propext, Classical.choice, Quot.sound]`.  That reduction
description is itself historical: the final cap-source consolidation bypasses
the override/fresh-third detour, and this compatibility theorem now delegates
directly to the common `false_of_capSourceThirdCanonicalRowSurface`
obligation.

The ordered-cap branch split is now production Lean.  Let `e` and `o` be
`Q.source` and `Q.otherOutsidePoint`, and let `b` and `bρ` be the first and
second collision blockers.  Both blockers lie in the first indexed cap,
`b ≠ bρ`, and the explicit first row gives
`dist b e = dist b o`.  If `dist bρ e = dist bρ o`, then
`ATailUniqueRowProducerScratch.false_of_two_cap_centers_equidistant_outside_pair`
contradicts ordered-cap uniqueness because `e,o` are distinct carrier points
outside that cap.  Thus the only live branch has
`dist bρ e ≠ dist bρ o`.

The 2026-07-28 F3 audit also proves that the five-center residual contributes
only negative incidence: `F3cRedundancyBank.f3c_joint_sharp` derives it from
the cap-source witness, and the four arms merely omit a collision endpoint
from the cap-source and opposite-blocker rows.  The cardinal/counting shadow
in `scratch/f3-unbounded-counting-audit/REPORT.md` realizes the remaining
abstract incidence constraints already at the forced minimum `|A| = 17` and
extends by arbitrary four-point blocks.  This is not a Euclidean
`CounterexampleData` model, but it rules out another finite-slot or pure
incidence closure.  At that checkpoint the concrete route was therefore to
use the retained global geometry/minimality data to contradict the displayed
strict non-bisector inequality.  The 2026-07-30 override/rebase route bypasses
that positive producer and instead reduces the branch to the fresh-third
terminal.  This is also a historical intermediate route: the final
consolidation delegates the aligned/nonbisector theorem directly to the common
cap-source obligation.

The induced-metric CEGAR continuation has now supplied one stronger Euclidean
cut.  Its v12 survivor contains six cyclically ordered quotient points
`A < B < C < D < E < F` with
`AB = AF`, `AD = AF`, `DA = DB`, `CB = CE`, and `CD = CE`.
`ATail/SixPointEuclideanObstruction.lean` proves this configuration impossible
over `ℝ²`, exposes both boundary-order and three-selected-row consumers, and
is imported by `FrontierLiveClosure`; Lean 4.27 reports exactly
`[propext, Classical.choice, Quot.sound]`, with no `sorryAx`.
The v13 detector was separately replayed against the serialized v12 survivor:
it finds the intended ten-literal core, recognizes it as a six-point cut, and
makes that frozen assignment UNSAT.  This closes one exact Euclidean survivor,
not the live leaf.  A fresh v13 run banked 2,203 cuts and returned `ALIVE` with
a different 19-class survivor before using the new six-point schema.  Exact
subset mining on that survivor excludes every four-point obstruction.  It
fully enumerates the five-point subsets; the 15 cases initially left
`UNKNOWN` were subsequently resolved SAT with exact rational coordinate
witnesses, independently replayed by Z3 and cvc5.  Thus no four- or five-point
Euclidean cut exists in this survivor.  The full 19-point problem and the
partially explored six-point layer still stop fail-closed.  A structural
priority pass ranked all 27,132 six-class subsets and resolved its top 16:
fourteen have exact rational SAT witnesses, while ranks 14 and 15 share one
exact UNSAT schema.  For ordered points `P0 < P1 < P2 < P3 < P4 < P5`, that
schema has the two selected rows
`P0 : {P1,P3,P5}` and `P2 : {P1,P3,P4}`.  Z3 and cvc5 independently report
UNSAT, and Singular checks the two polynomial identities used in the
elimination.  `ATail/SixPointSparseEuclideanObstruction.lean` now proves the
schema over `ℝ²` from exactly four independent distance equalities and six
strict orientation signs; its public theorems have axioms exactly
`[propext, Classical.choice, Quot.sound]`, with no `sorryAx`, and the module is
imported by `FrontierLiveClosure`.

The v14 CEGAR detector uses exactly five order literals and four positive
row-equality literals for this sparse schema.  Its self-test passes, replay
makes the saved v13 survivor UNSAT, and a fresh local/critical/reuse-second run
banked 3,376 cuts, including eight sparse-six cuts.  That run is still
`ALIVE`.  Exact mining of all 2,380 four-class subsets and all 6,188
five-class subsets of its 17 quotient classes found one minimal five-class
UNSAT core.  In increasing order its classes are
`{bs,r3,e3} < {z,be} < {escape} < {source} < {a2,s3,e4}`, with rows
`P1 : {P0,P2,P4}` and `P0 : {P3,P4}`.  This is the point-reversed form of the
existing second five-point obstruction, not a new scalar identity.
`FivePointEuclideanObstruction.false_of_second_three_rows_of_four_orientations_pos`
kernel-checks the necessary reflection step, and
`...false_of_five_ccw_reversed_second_two_selected_rows` is the direct
selected-row consumer.  Both use only
`[propext, Classical.choice, Quot.sound]`.

The v15 detector encodes exactly the four successor-order and three
row-equality literals of that core.  Its self-test passes; replay validates
each literal against the frozen v14 survivor and makes that assignment UNSAT.
A fresh local/critical/reuse-second run used the new cut 19 times in six
batches, banked 3,785 cuts, and still returned `ALIVE` with a new survivor.
Exact mining of all 3,060 four-class subsets and all 8,568 five-class subsets
of its 18 quotient classes again found one minimal five-class UNSAT core.  In
increasing order it is
`W={a0} < F={r1,z4,y,e3} < P={source} < X={r2,b1,s3,z2} < Z={bs,r4}`,
with `WF=WX=WZ` and `PZ=XZ`.  This exactly matches the registered 555/654
consumer
`Census554.FivePointCircleIsoscelesOrderBridge.false_of_core_of_ccw`.
The new direct selected-row adapter
`...false_of_two_selected_rows_of_ccw` consumes precisely a row at `W`
containing `F,X,Z` and a row at `Z` containing `P,X`; it kernel-checks with
only `[propext, Classical.choice, Quot.sound]`.  No new scalar theorem was
needed.

The resulting v16 local/critical/reuse-second survivor has 19 quotient
classes.  Exact full-Euclidean analysis found a six-class
mirror-interleaving obstruction at
`a0 < p2 < r1 < b2 < r2 < p1`, with rows
`a0:{p2,p1}`, `a0:{r1,r2}`, `b2:{a0,r1,r2}`, and `r2:{p2,p1}`.
`ATail/SixPointEuclideanObstruction.lean` now proves exactly this schema over
`ℝ²`; its public terminal has axioms
`[propext, Classical.choice, Quot.sound]`, no `sorryAx`, and is imported by
`FrontierLiveClosure`.  The v17 detector's frozen-survivor regression proves
that its ten-literal direct cut is entailed and refutes that exact v16
assignment.

The completed 100,000-cut v16 custom ledger was migrated non-destructively and
revalidated under v17: 99,911 four-point Kalmanson, 39 five-point Euclidean,
18 reversed-second five-point, 22 circle-isosceles five-point, and 10 sparse
six-point cuts.  The first resumed one-cut probe returned
`UNKNOWN_FAIL_CLOSED` after 615.16 seconds because the outer solver timed out;
it retained 100,000 cuts, found no survivor, and banked no mirror-interleaving
cut.  This is a solver frontier, not exhaustion, certificate replay, or Lean
closure.

The smaller local/critical/reuse-second replay is now complete.  Its v16
checkpoint had 4,086 cuts; the generalized migration retained and revalidated
4,078 universal theorem-shaped cuts and dropped eight old quotient-specific
relation cuts for rediscovery.  The v17 resume banked another 1,855 cuts and
returned `ALIVE` in 16.42 seconds with 5,933 total cuts and an 18-class
survivor.  Thus this finite local projection has an 18-class induced
order/metric survivor; this is neither Euclidean consistency nor exhaustion
of the live hypotheses.

The survivor records 35 positive quotient-row equations.  An exact-coordinate
full 18-class `QF_NRA` probe ended `UNKNOWN_FAIL_CLOSED` at its hard 600-second
subprocess limit.  Exact induced-subset mining exhausted all 3,060 four-class
and 8,568 five-class subsets with no UNSAT core.  The six-class pass visited
all 18,564 subsets, but 205 cases retained solver-`UNKNOWN` status and the run
ended `UNKNOWN_NO_VALIDATED_CORE` after 324.564392 seconds.  These are
fail-closed search frontiers, not contradiction certificates or Lean closure.

The guarded v18 rebase and resume with both `--global-k4-center q` and
`--cover-point q` completed before the CEGAR pause.  It returned `ALIVE` at
iteration 3 after 1714.299807 seconds with 14,740 cuts and a 23-class exact
strict-Kalmanson quotient survivor.  Its epistemic status is
`INDUCED_NECESSARY_CONDITION_ONLY`; it is not a Euclidean-coordinate model or
Lean closure.  The iteration-1 quotient core is `VALIDATED_AND_BANKED`, with
five shrunk relations and fourteen translated outer literals.  No new solver
process was started at the subsequent source checkpoint.

The source-faithful ingress for both custom flags is production Lean.
`exists_globalK4Row_and_sourceFaithfulCriticalCover`, instantiated at
`Q.source`, simultaneously exposes an arbitrary selected four-row centered at
`q` and the canonical exact critical cover row through `q`.  The checked
`firstFiber_sourceFaithfulCriticalCover_eq_firstShell` now proves that this
cover center is exactly the first collision blocker, its support is both the
first collision shell and the explicit first row, and that blocker lies in an
indexed strict cap.  The saved v18 survivor instead keeps `cover_q` and `b1`
in distinct quotient classes, so it is source-incompatible.  A future resumed
projection must identify those roles rather than merely add the weaker cap
order constraint.  The Lean 4.27 build and live kernel audit give the new
theorem exactly `[propext, Classical.choice, Quot.sound]`, with no `sorryAx`;
reference mining confirms its direct use by the live leaf and its path to the
configured publish target.

Moreover,
`exists_criticalRow_escape_or_fullyDeletionRobust_criticalTripleShellSeed`
retains the escaping point and its deletion-blocked critical row in the
non-robust arm.  Using
`CriticalShellSystem.selectedFourClass_support_eq_shell`, the live leaf now
proves unconditionally that the escape center differs from the first, second,
and cap-source blockers, and hence from the `q`-cover center.  This historical
checkpoint closed no `sorry`.
`false_of_capSource_alignedSingletonRadius_of_secondBlocker_nonbisector`
was then the single load-bearing leaf.  Its coordinator-interface frontier
was unchanged before and after: one direct leaf, with the same two-way
second-row continuation and two-way robust-versus-critical escape
continuation (constructor fan-out `2 × 2`); no new obligation was introduced.
The 2026-07-30 checkpoint below supersedes this status.
In particular, the stronger robust-versus-critical escape packet is not
consumed by the current live route, and no checked terminal was found for
either of its discarded arms.

The local two-selected-row order route is now classified as a no-go rather
than the first missing bridge.  The deterministic common-boundary audit
implemented by
`scratch/atail-force/aligned-singleton-second-nonbisector-induced/audit_six_point_order_coverage.py`
shows that the imported sparse six-point consumer covers 11 of 16
complementary-arc words.  The residual words are exactly `CCFEE`, `CFCEE`,
`ECCFE`, `ECFCE`, and `EECCF`.  The exact normalized two-circle diagnostic
`probe_two_circle_convexity.py` finds deterministic strictly convex numerical
witnesses for all five.  This is empirical route falsification, not
kernel-level closure, but it demonstrates that the two rows and their shared
chord do not imply another local cyclic-order contradiction.  Independent
Lean-bank search found no imported theorem eliminating those five words.

The live leaf now extracts genuinely global incidence instead.  The
source-clean theorem
`firstFiber_globalRow_inter_firstShell_card_le_two` proves that the arbitrary
global K4 row centered at `Q.source` meets the source-faithful first-blocker
shell in at most two points: `Q.source` lies on the shell, while the shell
omits its own center, so the two circle centers are distinct.  Exact row
cardinality then gives
`firstFiber_globalRow_sdiff_firstShell_card_ge_two`, namely at least two
global-row points outside the explicit first shell.  The theorem
`exists_two_firstFiber_globalRow_points_outside_firstShell` names two distinct
such points, and the live leaf consumes that witness packet.  All three proof
bodies and their exact live-leaf call shapes pass an isolated Lean 4.27 check.
The isolated declarations have exactly
`[propext, Classical.choice, Quot.sound]`, with no `sorryAx`.  The serialized
full-module build was still running at this checkpoint, so a refreshed
module-level axiom audit remains pending.

Before the override/rebase extraction, the nearest existing clean terminal for
the escape row was
`false_of_centerAt_selectedFourClass_inter_card_ge_three`.  After rewriting
the source-faithful `q` cover to the first shell, the smallest direct missing
producer is

```text
3 ≤
  ({P.source₁, P.source₂, Q.source.1, Q.otherOutsidePoint} ∩
    escapeRow.support).card.
```

The arbitrary global row is not yet identified with the escape row, so the
new two-point outside-shell result does not supply this lower bound by itself.
Two further source audits make that boundary precise.  First, the apparent
downstream three-hit producer
`exists_three_hit_of_two_exactFourInteriorTwo_distinctRadiusBlockerCollisions`
is circular for this purpose: its body reaches the current aligned-singleton
leaf (or one of the other three open `TwoSourceExactCollisionRowsTerminal`
leaves) before eliminating the non-three-hit arms.  It cannot be mined as a
source-clean positive producer.

Second, cap arithmetic does strengthen the carrier count without any solver:
the cap-source witness gives first-cap cardinality at least eight, the other
two caps have cardinality at least six, and `S.capSum` therefore gives
`17 ≤ D.A.card`.  Since the critical triple-shell seed has cardinality at most
twelve, its union with any selected four-row has cardinality at most sixteen.
Thus a carrier point exists outside both.  This is a valid source-level
strengthening, but it yields another negative incidence and another anonymous
critical cover; it does not force the displayed three-point overlap or feed a
pre-leaf terminal.

The two escape-continuation arms have now been traced separately.  In the
fully deletion-robust arm,
`FullyDeletionRobustAt.exists_distinct_sources_same_blocker` produces an
arbitrary duplicate blocker fiber.  It reduces to the open fresh-third-fiber
terminal only if its common blocker is distinct from both named collision
blockers; without that condition it may simply return the already-known `P`
or `Pρ` collision pair.  It implies neither cross-blocker coincidence nor a
second cap-source packet.

In the critical-row arm, the row itself does contain at least two points
outside the four named collision sources.  The source-clean scratch theorem
`criticalSelectedFourClass_center_eq_commonBlocker_of_no_qfree` in
`lean/scratch/trace-critical-row-pair-localizer/Main.lean` proves that a
critical row containing both endpoints of either collision pair would have
that pair's common blocker as its center, contradicting the three established
escape-center inequalities.  The remaining obstruction is source
faithfulness: `CriticalSelectedFourClass D.A z escapeCenter` and deletion
failure at `escapeCenter` do not imply that the original arbitrary
`CriticalShellSystem H` chose `escapeCenter` as the blocker of either fresh
support point.  An `overrideAt` construction can make that choice, but at
this checkpoint the coordinator had no whole-packet rebase transporting both
frontiers, residuals, collisions, localized cycles, and cap-source data to
the overridden system.  The 2026-07-30 checkpoint below supplies exactly that
rebase.

At this historical checkpoint the remaining bridge was expected to couple
those global points to the escape continuation, minimal-deletion core, cap
localization, or full deletion filters.  It closed no `sorry`; the
coordinator-interface frontier remained one direct load-bearing leaf with the
same `2 × 2` continuation fan-out, and it introduced no new obligation.  No
new CEGAR process was started.  Any finite UNSAT result would still require
independent certificate validation and a checked source-to-certificate
adapter.

The v19 finite projection now reflects the two source equalities that made the
saved v18 survivor inadmissible.  If the minimal critical cover through `q` is
materialized, its center is identified with `b1`; existing same-center
unique-row coherence consequently identifies its support with the canonical
first shell.  The escape center is also constrained, in both continuation
arms, to differ from `b1`, `b2`, and `bs`.  The schema bump makes every v18
checkpoint fail closed rather than resume under these stronger constraints.
The bounded self-test and replay-metadata unit tests pass.  The subsequent v19
resume returned `ALIVE`, with epistemic status
`INDUCED_NECESSARY_CONDITION_ONLY`, after 20 outer calls, 14,740 resumed cuts,
2,434 newly banked cuts, and 17,174 total cuts.  The survivor carries an exact
strict-Kalmanson metric on its induced quotient; it is not a Euclidean
countermodel and it is not an UNSAT certificate.  At the v19 checkpoint this
improved source fidelity but closed no `sorry`.  The source extraction below
supersedes the old positive-three-hit frontier independently of the CEGAR
result.

Two additional candidate shortcuts were rejected at source level.  The
card-at-least-fourteen SurvivalCover producer requires
`SelectedClass D.A S.oppApex1 r` to have cardinality different from four;
both natural collision radii in this leaf instead have cardinality exactly
four.  Separately, the cap partition plus the fact that no center covers all
three apices still permits the non-apex points of a selected four-row to split
between different cap interiors.  It therefore does not force three points
of that row into any cap or into the escape row.

The reusable restoration/cardinality part of the earlier extraction is
retained in
`ATailGlobalMinimalDeletion.five_le_selectedClass_of_restoration_and_sharedRadius`:
restoration of one deleted point together with a distinct co-radial deleted
point forces the corresponding ambient selected class to have cardinality at
least five.  This rules out a unique-four center on the co-radial arm, but the
current live child is sharper: it already assumes one collision-source
deletion preserves K4 at the cap-source blocker, the first apex, the opposite
collision blocker, and the other two Moser apices.

Steps 1--5 are now production and kernel-spine wiring.  Both producers are
acyclic: the cap-eight producer takes second-apex robustness explicitly
instead of importing the later live residual, while the multiplicity
normalizer imports only the blocker-multiplicity, retained-pair, and
survival-cover layers.  A focused Lean 4.27 build and refreshed
`proof-blueprint` mine completed successfully.  The parent now calls both
producers and the checked three-leaf dispatch; it no longer has a direct
`sorry`.  The
producers have axiom profile `[propext, Classical.choice, Quot.sound]`, with
no placeholder or additional trust mechanism.

The coordinator-interface frontier changed from one broad admitted parent to
three explicit on-spine leaves.  Every child is strictly narrower:
`false_of_crossBlockerCoincidence` assumes the exact four-constructor equality
packet; the fresh-third leaf assumes the exact cap-source row surface and the
fresh mutually incident fiber; and the five-center-deletion leaf assumes the
cap-source witness, enlarged first fiber, and explicit deletion residual.
The checked global split, geometric normalizer, first-fiber descent, and swap
transport jointly cover all branches, the named cross-hit arm closes in the
parent, and no leaf calls the parent.

The nine-role theorem
`exists_fresh_namedRole_sharedRadiusPair_or_minimalDeletionCore` remains
source-clean, but its generic role-heavy output is not imported as a closure
step.  Instantiating global minimality on the first-cap complement does
localize a center to the cap, but the canonical singleton constructed from
the first-fiber source already realizes its minimal-core outcome.  Hence this
generic packet supplies no smaller live descendant.  Its extracted
restoration/co-radial card-five lemma is retained as a terminal for any
future parent-proved non-singleton arm; the current branch must instead prove
the named positive row coupling, `IsM44`, or a removable descent directly.

The tempting cap-redesignation shortcut is unavailable.  The only matching
upper bound,
`SurplusCapPacket.surplus_card_le_six_of_convexIndep_K4`, requires
`S.IsM44`, while this live residual carries
`¬ ∃ T : SurplusCapPacket D.A, T.IsM44`; it also bounds the designated surplus
cap rather than the indexed opposite cap.  The U5 sibling-bank theorem remains
neither import-reachable nor hypothesis-compatible with this packet.

#### K-A-LIVE canonical-row override/rebase checkpoint (2026-07-30)

> Historical checkpoint, superseded by the cap-source consolidation below.
> The override remains checked compatibility material but is no longer on the
> live coordinator interface.

The aligned/nonbisector leaf is now source-clean.  The universal
selected-row escape supplies a carrier point `q` outside the two retained
collision rows and the cap-source row.  Its selected row is used only to prove
`q ∈ D.A`; let `K` be the independent canonical selected four-class
`H.selectedAt q` used by the override.  If `K` contained both sources of either
retained collision,
`retainedRadiusCollisionOfInteriorCollision` would identify its center with
that collision blocker; same-center selected-support coherence would then put
`q` back in the corresponding excluded row.  Hence `K` contains neither
collision pair in full.  Since `K` has four points and contains `q`,
`exists_second_outside_two_pairs` chooses a second point `v ≠ q` outside all
four named collision sources.

`not_hasNEquidistantPointsAt_erase_of_mem_uniqueFourClass` proves that deleting
`v` destroys every four-point equidistant witness at the center of `K`.
The proof installs a copy of `K` at `v` with
`CriticalShellSystem.overrideAt`.  The overridden system therefore has the
fresh mutually incident fiber `(q,v)` at a blocker distinct from both retained
collision blockers.  The checked rebase layer transports the two frontiers,
their residual packets, retained blocker collisions, localized common-deletion
packets, mutual-omission cycles, and both cap-source cross-pair deletion views.
The resulting packet is exactly
`false_of_capSource_freshThirdBlockerFiber`.

This route is exposed by the public theorem
`TwoSourceExactCollisionRowsTerminal.false_of_freshCanonicalRowOverride`.
Keeping it public is part of the trust profile: when it was private, the
kernel-mined graph collapsed the reduction and incorrectly presented the
compatibility theorem as terminal.  The public edge makes the remaining
dependency loud:

```text
false_of_capSource_alignedSingletonRadius_of_secondBlocker_nonbisector
  -> false_of_freshCanonicalRowOverride
  -> false_of_capSource_freshThirdBlockerFiber [sorry]
  -> sorryAx
```

The former aligned/nonbisector declaration retains its enlarged-fiber,
singleton-radius, alignment, and nonbisector parameters for downstream
compatibility, but no longer has a direct `sorry`.  Its immediate
coordinator-interface fan-out changes from one load-bearing aligned leaf with
the internal `2 × 2` continuation to one checked reduction and then the single
pre-existing fresh-third leaf; no new obligation is introduced.  Accordingly
the direct F-Γ frontier decreases from four leaves to three, and the global
direct source-`sorry` total decreases from 20 to 19.

A focused Lean 4.27 build of
`Erdos9796Proof.P97.ATail.FrontierLiveClosure` completed successfully and
refreshed the kernel graph.  Direct verification of the compatibility theorem
reports `[propext, sorryAx, Classical.choice, Quot.sound]`: this checkpoint
closes one direct source `sorry`, but it is not unconditional or
kernel-complete.  The remaining mathematical terminal on this path is
`false_of_capSource_freshThirdBlockerFiber`.

#### K-A-LIVE fresh-third fixed-row same-cap checkpoint (2026-07-30)

> Historical checkpoint, superseded by the cap-source consolidation below.
> The positive terminal remains useful, but the fresh-third split supplied no
> narrowing beyond the common cap-source/blocker-multiplicity packet.

The fresh-third leaf now exposes the actual cap-source row instead of
discarding its witness behind an existential surface.  For that fixed source
and fresh fiber, `FreshThirdSameCapCrossRowAlignment` says that some indexed
cap contains both blocker centers, contains neither collision source, and that
both collision sources occur in the fixed cap-source selected row.

The positive branch is discharged by
`TwoSourceExactCollisionRowsTerminal.false_of_freshThird_sameCapCrossRowAlignment`.
The common-blocker selected row and cap-source selected row then have two
distinct points in their outside-cap overlap.  This contradicts
`selectedFourClass_outside_overlap_card_le_one`, since their distinct centers
lie in the same ordered cap.  The original
`false_of_capSource_freshThirdBlockerFiber` is consequently a source-clean
two-way coordinator:

```text
false_of_capSource_freshThirdBlockerFiber
  +-- FreshThirdSameCapCrossRowAlignment
  |     -> false_of_freshThird_sameCapCrossRowAlignment [checked terminal]
  `-- not FreshThirdSameCapCrossRowAlignment
        -> false_of_capSource_freshThirdBlockerFiber_without_sameCapCrossRow [sorry]
        -> sorryAx
```

The coordinator-interface frontier changes from one opaque fresh-third leaf
to one checked positive terminal and one strictly narrower residual retaining
the concrete source, its canonical-row witness, the concrete fresh fiber, and
the failed same-cap alignment.  Immediate constructor fan-out is two; the
direct F-Γ leaf count remains three and the global direct source-`sorry` count
is unchanged.  This is not unconditional closure: the new negative residual
is the load-bearing obligation.

The alternative deletion split at the three points consisting of both
collision sources and their common blocker was not promoted.  It yields the
two old-blocker cases plus a fresh-center/failed-deletion case, but none of
those three arms currently has a checked terminal, so it would increase the
frontier without improving aggregate tractability.

Verification at this checkpoint is production-wide: the 2026-07-30 full
Lean 4.27 build completed successfully and regenerated the live blueprint.
`#print axioms` for
`false_of_freshThird_sameCapCrossRowAlignment` reports only `propext`,
`Classical.choice`, and `Quot.sound`; the coordinator and its negative
residual additionally report `sorryAx`.  The refreshed spine therefore
reaches exactly one `sorry` through this coordinator, namely
`false_of_capSource_freshThirdBlockerFiber_without_sameCapCrossRow`.  The
positive arm is unconditional within the ordinary three-axiom trust profile;
the parent is not yet kernel-closed.

#### K-A-LIVE F-Γ six-center and finite-search checkpoint (2026-07-30)

> Historical checkpoint, superseded by the cap-source consolidation below.
> The six-center and fixed-17 results remain valid diagnostics.

At this checkpoint the direct F-Γ coordinator frontier consisted of three
load-bearing declarations:

```text
false_of_crossBlockerCoincidence
false_of_capSource_freshThirdBlockerFiber_without_sameCapCrossRow
false_of_twoCapSources_oneSidedDeletionSurvival
```

The former aligned/singleton/nonbisector declaration is not a fourth leaf: its
checked compatibility reduction reaches the second declaration through
`false_of_freshCanonicalRowOverride` and the source-clean fresh-third
coordinator.

For the one-sided leaf,
`sixCenterDeletionSurvivalPacket_of_oneSided` now proves the exact common
deletion payload available in each arm.  After deleting one cap source, K4
survives at the two collision blockers, the three robust Moser apices, and the
other cap-source blocker, and those six centers are pairwise distinct.
The current theorem banks can turn each survival fact into a selected
four-row on the deleted carrier: each component directly instantiates
`U5QDeletedK4Class.exists_card_four_of_hasNEquidistantPointsAt_skeleton`.
That extraction is therefore mechanical, not the remaining mathematical
bridge.  The closest checked terminal,
`U3FixedTripleAuditFrame.false_of_rowwiseConfinedQDeletedClasses`, requires a
fixed U3 audit frame and confinement of all six rows to one common eight-point
`U5BoundedSupport` (and hence its label/overlap data).  The registry audit found
no source-reachable theorem deriving that confinement from the six-center
packet.

The cardinal floor for this anchored cap-source leaf is `17`, not `15`: its
named first cap has at least eight points, the other two all-large caps have at
least six each, and the cap-sum identity subtracts the three shared triangle
vertices.  Equality has cap sizes `(8, 6, 6)` and strict-cap interior sizes
`(6, 4, 4)`.  The `(6, 6, 6)` / `n = 15` floor remains correct for the parent
all-large-caps residual before the cap-eight source is introduced.  A
fixed-17 calculation therefore checks only the first stratum, not the
arbitrary-cardinality leaf; the abstract incidence audit still permits a
`17 + k` extension family.

The source-faithful v19 induced CEGAR run returned `ALIVE` after 17,174 total
cuts with an exact strict-Kalmanson quotient survivor and the explicit
epistemic status `INDUCED_NECESSARY_CONDITION_ONLY`.  Separately, the fixed-17
Boolean lane now has dynamic unordered-edge equality closure and
duplicate-center nogoods.  Its five focused tests and smoke SAT/UNSAT gates
pass, and the smoke UNSAT proof has a successful DRAT replay.  The exact
fixed-17 QF_FD-to-CNF lowering took 9.34 seconds and produced 116,393
variables and 1,435,449 clauses (31.4 MB).  CaDiCaL timed out/UNKNOWN after
600 seconds in its default mode and after 300 seconds with `--sat -n`; the
567 MB interrupted production DRAT stream is incomplete and non-certifying.
There is therefore still no fixed-17 certificate or Lean ingress.  At this
historical checkpoint neither the three-leaf coordinator frontier nor the
global direct source-`sorry` count changed.

The exact-coordinate follow-up does not strengthen that status.  Replaying
the v19 survivor produced a 22-class SMT instance with 37 positive
quotient-distance equations and 440 strict-convexity assertions; Z3 timed out
and the probe reported `UNKNOWN_FAIL_CLOSED`.  The survivor's 62 recorded
true row equalities also contain no direct `DuplicateCenterCore` motif.
Neither observation is a proof of realizability or nonrealizability.

For the cross-blocker leaf, the four coincidence aliases do not by themselves
complete a reciprocal cross-row pair: an alias of the first blocker with a
second source gives the first direction, while an alias of the second blocker
with a first source gives the reverse direction, and the remaining live packet
fields add only omissions.  The exact named-coordinate audit in
`scratch/atail-force/cross-blocker-euclidean-audit/` realizes all twelve
`4 aliases × 3 residuals` branches with rational coordinates and verifies every
encoded equality and disequality by exact substitution.  This is deliberately
not a full `CounterexampleData` model: cap order, full carrier K4, minimality,
no-`(m,4,4)`, and the complete support system are omitted.  Its valid
conclusion is therefore that the named local Euclidean/incidence packet cannot
close `false_of_crossBlockerCoincidence`; a global support, cap, or
carrier-wide bridge is required.

For the fresh-third leaf, the existing actual-blocker classifier only places
each blocker independently in some strict indexed cap.  The residual packet
does not establish that the fresh blocker differs from the cap-source blocker,
that the fresh sources are outside the blocker's cap, or that they lie in the
cap-source row.  Accordingly, independent cap classification—and even joint
same-cap localization by itself—does not construct the input of
`false_of_freshThird_sameCapCrossRowAlignment`.  The missing producer must
jointly supply the center distinction and cross-row incidence/localization
data; this is the current exact ingress for that leaf.

The sorry-free scratch theorem
`scratch/atail-force/fresh-third-no-alignment-lean-split/SevenBranchClassifier.lean`
now typechecks an exhaustive seven-way split: equal blockers; a cap-source-row
miss; one cross-row hit; two hits with different cap indices; same-cap with the
first source inside; same-cap with only the second source inside; or the
already-closed positive alignment branch.  The v5 necessary-condition probe
finds exact SAT witnesses in the equal-blocker, different-index, first-inside,
and second-inside branches.  Strict SAT-witness subcases also lift to the
row-miss and one-hit parent branches, although their cold unrefined probes are
timeout/UNKNOWN.  Only positive alignment is UNSAT in this projection, and
that branch is already closed in Lean.  These are necessary-condition
relaxation models only, not carrier models and not a theorem-level
independence result.  The classifier sharpens the Lean frontier but closes no
additional branch.

The equal-blocker mutual-cross-membership caller now performs the already
proved
`commonCollisionEndpointOmission_or_complementaryMembership` split.  Its
complementary-membership arm is source-closed by
`false_of_equalBlockers_complementaryMembership`: equality of actual blockers
identifies the two selected supports, after which the two distinct cap sources
and all four pairwise-disjoint collision endpoints would be six distinct
members of one four-point support.  The common-endpoint-omission arm still
reached the generic fresh-third leaf at this checkpoint.  This is a checked
terminal subbranch of the historical route, not current frontier closure.

#### K-A-LIVE cap-source consolidation checkpoint (2026-07-30)

The live collision coordinator first produces
`GeometricMultiplicityResidual P Pρ` from blocker multiplicity and then runs
the checked `TwoCollisionGlobalSplit`.  In the cap-source arm it now passes
both that residual and `CapSourceThirdCanonicalRowSurface P Pρ` to the common
terminal.  The former fresh-third and one-sided declarations merely selected
or refined concrete arms of the same residual; their compatibility adapters
now supply those arms explicitly, so the consolidation does not discard the
finite blocker-fiber data.

The common missing mathematics is now loud as
`TwoSourceExactCollisionRowsTerminal.false_of_capSourceThirdCanonicalRowSurface`.
The former negative fresh-third and one-sided-deletion declarations are
source-clean compatibility adapters to it.  The aligned/nonbisector theorem
also delegates directly; the canonical-row override and all later fiber
classifiers remain checked compatibility material rather than live
obligations.

The coordinator-interface frontier is therefore:

```text
BlockerMultiplicity + TwoCollisionGlobalSplit
  +-- CapSourceThirdCanonicalRowSurface
  |     + GeometricMultiplicityResidual
  |     -> false_of_capSourceThirdCanonicalRowSurface [sorry]
  `-- CrossBlockerCoincidence
        + GeometricMultiplicityResidual
        -> false_of_crossBlockerCoincidence [sorry]
```

Before this consolidation, F-Γ exposed three direct leaves and the file had
19 direct source `sorry`s.  After it, F-Γ exposes two and the file has 18.
The immediate global constructor fan-out is two, acyclic, and both leaves are
directly consumed by the publish spine.  The exact-collision contribution to
the tri-apex frontier therefore drops from three leaves to two; together with
the independent directed-omission leaf, that parent now has three.

The newly landed algebraic collision banks do not close the common
cap-source/blocker-multiplicity packet directly.  A six-row
`EqualityCore.AlgebraicRowCollisionAlternative` remains a possible
all-arms bridge, but it is not the smallest bridge on the concrete enlarged
first-fiber arm.

On that arm,
`ATailFirstFiberOverlapDescent.firstFiber_cycleAlignedHits_or_collisionFiveCenterDeletion`
is the checked exact decomposition obtained from the cap-source witness.  Its
five-center deletion disjunct must **not** be promoted as a narrowed
obligation: `F3cRedundancyBank.f3c_joint_sharp` proves stronger simultaneous
deletion data from the cap-source packet alone.  The genuine missing content
is the positive incidence excluded by the cycle-aligned packet.  With
`Ksource` denoting the cap-source selected support, the smallest direct
producer is

```text
FirstFiberCycleAlignedResidual P Pρ Q source LPρ MPρ LP MP
  -> Q.source.1 ∈ Ksource ∧ Q.otherOutsidePoint ∈ Ksource.
```

Those two hits, together with the already-retained
`P.source₁ ∈ Ksource`, feed the existing kernel-checked terminal
`ATailFirstFiberOverlapDescent.false_of_firstFiber_bothOutsideHits_and_firstPairHit`
immediately.  Thus this two-hit statement, or an equivalent case-split
producer proving whichever outside hit the cycle packet omits, is the first
arm-sensitive mathematical target.  Producing an
`EqualityCore.AlgebraicRowCollisionAlternative` remains the broader fallback
for a proof intended to cover all three blocker-fiber constructors at once;
constructing its `FaithfulCarrierPattern` adapter is bookkeeping, while the
additional positive rows/equalities are the gap.  Bounded SAT/CEGAR strata
cannot by themselves prove the arbitrary-cardinality theorem.

The completed producer audit (2026-07-31) confirms that production contains
only the definitions, conversions, and consumer for
`Census554.GeneralCarrierBridge.ShellMetricCoreAlternative`; no production
theorem constructs that alternative from the live cap-source packet.  The
sole concrete producer found is the scratch theorem
`shellMetricCoreAlternative_of_orderedFrontSchemaEmbedding` in
`scratch/atail-force/uniform-live-metric-core-producer/UniformProducerBoundary.lean`.
It assumes `OrderedFrontSchemaEmbedding`, whose fields require five-role
cyclic order and positive row incidences.  No production theorem constructs
that antecedent, and the cap-source packet supplies omission data rather than
those positive facts.  Thus constructing `FaithfulCarrierPattern` alone would
still be bookkeeping: the missing mathematics is an ordered-schema occurrence
theorem, or a direct `ShellMetricCoreAlternative` producer.

This paragraph records the consolidated source frontier only.  No focused Lean
4.27 elaboration or generated-blueprint refresh is claimed for this
consolidation; kernel-complete status requires those fresh checks.

#### K-A-LIVE all-endpoint to five-center bridge checkpoint (2026-08-01)

The later two-source refactor replaces the former opaque common cap-source
leaf by a checked constructor-level residual split. The cap-source subtree is
now

```text
GeometricMultiplicityResidual + TwoCapSourceThirdCanonicalRowSurface
  +-- FreshOutsideFirstBlockerFiber
  |     -> false_of_twoCapSources_freshOutsideFirstBlockerFiber [sorry]
  +-- FreshOutsideSecondBlockerFiber
  |     -> source-clean swap to the first-fiber leaf
  `-- FreshThirdBlockerFiber
        -> source-clean fresh-third/core/residual coordinators
        +-- FreshThirdNormalizedResidualCase
        |     -> false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual
        |        [sorry]
        `-- sameBlockerAllEndpointOmission
              + FirstFiberOutsidePairFiveCenterExactRowsOrCrossedResidual
              + FirstFiberCollisionFiveCenterExactRowsResidual
              -> false_of_capSource_firstFiber_collisionFiveCenterDeletion
                 [sorry]
```

The equal-blocker constructor retains `Q`, two complete cap-source witnesses,
mutual cross-membership, actual-blocker equality, simultaneous omission of
all four collision endpoints by both rows, and the exact two-point shell/cap
intersection. The new source-clean theorem
`collisionFiveCenterDeletion_of_allCollisionEndpointsOmitted` maps that
packet to the existing `FirstFiberCollisionFiveCenterDeletionResidual`: the
checked first-fiber descent either returns the deletion residual or its
cycle-aligned arm asserts the forbidden hit at `P.source₁`. Thus the
checked `collisionFiveCenterExactRows_of_deletionResidual` producer exposes
`FirstFiberCollisionFiveCenterExactRowsResidual`. Independently,
`firstFiberOutsidePair_fiveCenter_or_crossed` and
`firstFiberOutsidePair_exactRows_or_crossed` expose either a common outside-
point deletion at five named centers or one of two crossed positive-incidence
patterns as `FirstFiberOutsidePairFiveCenterExactRowsOrCrossedResidual`.
`false_of_twoCapSources_sameBlockerAllEndpointOmission` is now source-clean and
wires both positive packets into the single remaining equal-blocker terminal.
The normalized leaf remains independent.

This bridge adds no `sorry` and closes no terminal. A direct Lean 4.27 source
check of `FrontierLiveClosure.lean`, including the exact-row normalizations and
parent wiring, passed on 2026-08-01. A subsequent guarded Lean 4.27 build of
`FivePointEuclideanObstruction` and `FrontierLiveClosure` also passed. The
transitive blueprint and axiom audit remain required after the terminal is
proved.

The earlier ten-row deletion/deletion SAT artifact is not a model of the full
live interface: it omitted the seventeen unconditional canonical K4 rows.
Composing those rows with the packet rows exposes several already-proved
production contradictions, including shared-pair, two-triple six-point, and
five-point circle-isosceles instances. The corrected full-row dual-deletion
CEGAR remains `UNKNOWN_TIMEOUT` after 271 candidates, 730 structural cuts, and
11,378 theorem cuts.

For the crossed constructor, the raw Lean producer already proved both
positive memberships and both complementary omissions, but an intermediate
residual had discarded the omissions. The live residual and fixed-role exact-
support packet now preserve all four polarities. Source-clean shell and packet
lemmas turn the omissions into two strict cross-row distance non-equalities;
the affected Lean 4.27 modules pass direct source checks. The bank-complete
schema-v3 run's 48,978 cuts remain universally reconstructible, but its
1,000-candidate verdict is retired because that run omitted the complementary
polarities. The corrected schema-v4 source-at-common run returned a replay-
PASS finite SAT shadow after 889 candidates and 43,556 theorem cuts. Importing
and reconstructing the 48,978 legacy cuts produced a stronger replay-PASS SAT
shadow after 905 candidates and 85,003 total theorem cuts. These are historical
schema-v4 incidence/order shadows, not current Euclidean or Lean closure. The
schema-v4 fixed-role QF_NRA metric-only `UNSAT` after 50,143 ms on 2,180 atoms
is likewise an uncertified external result for a different historical shadow.
The later full-radius and lazy-v5 QF_NRA attempts both returned `UNKNOWN`
at about 123 seconds, so neither supplies SAT, UNSAT, or a certificate.

The corrected schema-v5 `raw_btw_sep` run returned finite `SAT` after 435,815
ms, with 767 candidates, 3,149 structural raw-betweenness cuts, and 112,601
theorem cuts. Its order is
`a1,t2,t3,t4,t1,a2,q1,r1,p2,r2,p1,q2,a3,s1,s4,s3,s2`, but the witness violates
an existing production Lean route: `E(a1,p2,p1)` and `E(p1,p2,a1)` imply
`E(p2,a1,p1)` by `Problem97.dist_eq_dist_of_mutual_bisector`, while
`E(t3,a1,p1)` and `a1 < t3 < p2 < p1` contradict
`Problem97.false_of_two_centers_equidistant_pair_enclosed`. The two declaration-
level axiom reports list only `propext`, `Classical.choice`, and `Quot.sound`,
with no `sorryAx` or custom axiom; this does not claim global import closure.

Schema v6 adds the canonical Horn family `mutual_bisector_transport`,
`not E(c1,q,c2) or not E(c2,q,c1) or E(q,c1,c2)`. There are exactly 2,040
canonical `(q,{c1,c2})` instances at `n = 17`, and the v6 run will import the
validated v5 result. Its first 900-second tranche ended
`UNKNOWN_FAIL_CLOSED`: 1,443 candidates eliminated, 6,382 structural cuts
(5,411 raw-`btw_sep`, 971 mutual-bisector transport), and 153,894 theorem
cuts. The terminal solver check was canceled by the exhausted total budget;
there is no v6 `SAT` survivor or `UNSAT` result, and the next step is a strict
resume from this validated v6 cut checkpoint. This route eliminates the
displayed finite abstract witness only;
it does not close the universal Lean anchor.

#### K-A-LIVE crossed-arm compact/materialization checkpoint (2026-08-01)

The first `other-at-common` v9 tranche imported the normalized source-arm
checkpoint and ran for 1,800 seconds. It processed 871 connected candidates,
added 346 `raw_btw_sep` structural cuts and 18,418 existing-family theorem
cuts, and ended `UNKNOWN_FAIL_CLOSED` after the deadline canceled the final
solver check. Its totals are 9,428 structural and 241,121 theorem keys. The
required global indexed-Lean/theorem-bank audit found no new universal or
general-cardinality candidate, no newly activated family, and zero matches for
the fourteen-role global Kalmanson family. Therefore both crossed orientations
remain open; this tranche is neither exhaustion, `UNSAT`, nor Lean closure.

Two exact representation changes materially reduce the live solver without
weakening it. The 371,280 `critical_no_K4_after_source_deletion` triple clauses
are exactly 3,264 guarded unit-weight at-most-two constraints; all 32,760
assignments for tail sizes 3 through 14 agree. In addition,
`reversed_second(q0,q1,q2,q3,q4)` canonicalizes to
`first(q4,q0,q1,q2,q3)`, removing 38,707 source-checkpoint assertions, while
6,195 selected-row keys are suppressed by present stronger raw-equality keys.
A live one-candidate source benchmark restored all cuts into the compact model,
reduced total assertions from roughly 765,214 to 352,325, and returned `sat`
in 8.220 seconds before adding only registered-family cuts. Its mandatory
post-wave audit found no new theorem candidate. `compact-pb` is now the
new-run default; omission in historical v9/v7 metadata permanently means the
legacy triple representation, and conflicting explicit metadata rejects.

The completed compact source-arm continuation supersedes the earlier
"continue exhaustive v9" next step.  It reached a replay-checked `SAT` fixed
point with 1,197 connected candidates, 9,488 structural keys, and 205,225
canonical theorem-key instances.  Those instances belong to only 22 registered
theorem families, and the final survivor matched none of them.  The mandatory
global theorem-bank audit found no additional sound Boolean family to add, so
another longer run over the same inventory is not a closure route.

The current next gate is instead a new exact Euclidean obstruction mined from
that survivor.  On seven distinct points, eleven squared-distance equalities
force two designated anchors to coincide.  Singular and two independent msolve
variable orders reduce the gauge-fixed ideal to the unit ideal, while Z3 and
cvc5 return `UNKNOWN`; therefore this is exact external algebraic evidence, not
yet Lean closure.  No indexed production theorem matches the pattern.  The
required route is to prove the generic seven-point lemma in Lean, register an
injective occurrence matcher for its six edge-equivalence classes, rerun the
source arm, and perform the mandatory global theorem audit before starting any
further CEGAR tranche.

The deterministic crossed-arm exporter now materializes a direct Boolean CNF
and complete variable/clause/key provenance without using Z3 tactic CNF. It
models cyclic order and global edge-length equality explicitly and regenerates
the complete ledger during verification. Coordinated CNF, provenance, learned-
key, source-digest, and authentication-label tampering reject in 22 tests; an
independent audit accepts the boundary. The authenticated legacy source input
has 89,152 variables, 1,224,020 clauses, and CNF SHA-256
`6a6257624904869b908980f6548825418efa71a2e67ec62b8878a383ab73cc88`.
This is only a verified `INPUT_FORMULA_ONLY` package. The crossed leaf and its
production `sorry` remain open until both arms exhaust, pure-RUP certificates
are generated and replayed by the production checkpointed checker, and the
Lean packet-to-clause semantic boundary plus two arm contradictions are wired
to `false_of_capSource_firstFiber_crossedThreeRowExactSupports`.

Generic two-shard and bounded-window pure-RUP materializers plus a compact
windowed replay-package emitter now exist and pass 18 focused tests.  They
enforce dense clause IDs, positive earlier RUP hints, exactly two authenticated
shards, and a terminal empty clause.  No crossed-arm LRAT has yet been produced,
so this infrastructure changes neither the terminal status nor the trust
classification above.

### K-A-UNIQUE-PHYSICAL-SPLIT radius-normal-form checkpoint (2026-07-26)

`ExactFourRobustCapExpansion.lean` now proves, under Lean 4.27, that all
outside sources blocking both source-valid strict first-cap deletions share
one actual late blocker and that each positive second-apex radius contains at
most one such bad strict-cap source.  Consequently
`exists_interiorPairGoodOutsideSource_mem_secondClassInterior` extracts, from
a five-point radius class, a strict second-cap source for which deleting
`R.interior_q` or `R.interior_w` preserves K4 at its actual late blocker.
The exhaustive
`interiorPairGood_or_twoDistinctExactFourInteriorRows` normal form retains
that source, its positive radius, and the five-point class lower bound in the
five-point arm; its only other arm has two disjoint exact four-point rows, no
positive class of cardinality five, and at least two strict second-cap
members in each row.  `FrontierLiveClosure.lean` now consumes the normal form
with a checked two-way coordinator.  Its robust-surface `sorry` has therefore
been decomposed into exactly two stronger, directly wired load-bearing leaves:
`false_of_exactFourPostCardElevenInteriorDeletionBranch` and
`false_of_exactFourPostCardElevenTwoRadiusBranch`.  Immediate fan-out is two,
there are no orphan obligations, and the active next gate is the
interior-deletion leaf.  This decomposition closes no mathematical branch;
closing that first leaf will reduce the coordinator frontier from two to one.

### K-A-UNIQUE-PHYSICAL-SPLIT bounded-cross-incidence checkpoint (2026-07-26)

`actualLateRow_secondClassInterior_card_le_two` now eliminates the
three-physical-hit subcase of the five-point interior-deletion branch.  It
uses the active source and one further strict-second-cap radius-class hit to
localize the actual late blocker to the second cap, then applies the
ordered-cap two-point row bound.  The former
`false_of_exactFourPostCardElevenInteriorDeletionBranch` obligation is now a
checked one-child coordinator whose sole load-bearing child is
`false_of_exactFourPostCardElevenInteriorDeletionLowCrossBranch`.  That child
adds the proved bound
`lateRow.support ∩ (physicalRadiusClass ∩ strictSecondCap) ≤ 2` while
retaining the named positive radius, five-point class lower bound, source,
outside-fiber membership, and surviving deletion.

The robust-surface coordinator-interface frontier is still exactly two
leaves: the bounded-cross-incidence leaf and
`false_of_exactFourPostCardElevenTwoRadiusBranch`.  Immediate fan-out at the
interior-deletion subcoordinator is one; direct `sorry` count is unchanged;
there are no orphan obligations.  This checkpoint closes the three-hit
subcase, not the entire five-point branch.  The active gate is the
bounded-cross-incidence leaf, whose remaining occurrence must use another
row or blocker fiber.

### K-A-UNIQUE-PHYSICAL-SPLIT omitted-peer checkpoint (2026-07-26)

`exists_omittedSecondClassInteriorPeer` now consumes the five-point class
lower bound and the checked two-hit late-row bound.  The physical class has
at least three strict-second-cap members, so it produces a distinct peer in
that class and cap which is omitted from the active source's late row.
Canonical-support equality for equal actual blockers then proves that the
source and peer actual blockers are distinct.

The former
`false_of_exactFourPostCardElevenInteriorDeletionLowCrossBranch` obligation
is now a checked one-child coordinator.  Its sole load-bearing child is
`false_of_exactFourPostCardElevenInteriorDeletionOmittedPeerBranch`, which
retains all prior source/deletion data and additionally names the peer, its
physical-class and strict-cap memberships, its omission from the source row,
and the blocker-separation fact.

The robust-surface coordinator-interface frontier remains exactly two leaves:
the omitted-peer leaf and
`false_of_exactFourPostCardElevenTwoRadiusBranch`.  Immediate fan-out at both
interior-deletion subcoordinators is one; direct `sorry` count is unchanged;
there are no orphan obligations.  This checkpoint closes the unnamed-peer
extraction step, not the entire five-point branch.  The active gate is the
omitted-peer leaf, whose next occurrence must exploit the peer's own row,
distinct blockers, or a compatible terminal.

### K-A-UNIQUE-PHYSICAL-SPLIT mutual-omission checkpoint (2026-07-26)

`actualLateRow_secondClass_card_le_two` now bounds the intersection of every
actual late row with the whole physical second-apex radius class by two.
Deletion robustness keeps the physical apex distinct from the row blocker,
so this is a direct application of the checked two-circle intersection bound.

`exists_mutuallyOmittedSecondClassPair` combines that bound with the
five-point class lower bound.  The active source row omits at least three
class points; choosing two of them and applying the same two-hit bound to
their rows yields two distinct class sources mutually omitted from one
another's actual late supports.  Both reciprocal cross deletions therefore
preserve K4, and canonical-support equality rules out equal actual blockers.

The former
`false_of_exactFourPostCardElevenInteriorDeletionOmittedPeerBranch`
obligation is now a checked one-child coordinator.  Its sole load-bearing
child is
`false_of_exactFourPostCardElevenInteriorDeletionMutualOmissionBranch`,
which retains every preceding source, strict-cap peer, and surviving-deletion
field and additionally carries the mutually omitted pair, both omissions,
blocker separation, and both cross-deletion survivals.

The robust-surface coordinator-interface frontier remains exactly two leaves:
the mutual-omission leaf and
`false_of_exactFourPostCardElevenTwoRadiusBranch`.  Immediate fan-out at each
nested interior-deletion subcoordinator is one; direct `sorry` count is
unchanged; there are no orphan obligations.  This checkpoint closes the
whole-class mutual-pair extraction, not the entire five-point branch.  The
active gate is the mutual-omission leaf, whose remaining occurrence must feed
the reciprocal survivals into a compatible ordered-row, common-deletion, or
geometric terminal.

### K-A-UNIQUE-PHYSICAL-SPLIT contextual rigid-deletion checkpoint (2026-07-26)

The five-point mutual-omission branch now retains its original strict-cap
source and omitted peer through
`ExactFourMutualOmissionSourceContext`.  In particular, the rigid terminal
knows the source and peer are distinct class-interior points, the peer is
absent from the source row, the source survives one of the two original
interior deletions, the source belongs to the `u` row, and the source row
omits `v`.  In the genuinely third-row arm `u ≠ source`,
`exactFourRigid221_context_u_ne_source_normalForm` proves that the `u` block
is exactly `{source,u}`, its intersection with the source row is exactly
`{source}`, and the source, `u`, and `v` actual blockers are pairwise
distinct.  The checked placement coordinator further confines the retained
peer to `u`, the `v` block, or the distinguished singleton deletion.

`false_of_exactFourMutualOmissionRigid221_globalDeletion` is now source-clean.
It splits the globally card-minimal deletion exhaustively by its actual
geometry: physical apex, nonphysical equal-radius collision, or nonphysical
pairwise-distinct-radius `MinimalDeletionCore`.  Thus the coordinator-interface
frontier at that declaration changed from one opaque terminal to three
strictly narrower immediate children.  The latter two remain direct leaves:
`false_of_exactFourMutualOmissionRigid221_nonphysicalCollision`, and
`false_of_exactFourMutualOmissionRigid221_minimalCore`.

The former physical-apex leaf is also source-clean.  It first splits on
whether the retained contextual source's actual blocker belongs to the
physical five-class.  The outside-class arm constructs the explicit
cardinality-one deletion `{source}` and feeds its checked
`MinimalDeletionCore` directly to the existing minimal-core leaf.  In the
inside-class arm, the checked rigid-cover placement theorem removes the
source row itself and leaves exactly two source identities:
`false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU`, where the
blocker is the distinguished deletion or belongs to the disjoint two-point
`v` block, and
`false_of_exactFourMutualOmissionRigid221_physicalApex_sourceNeU`, where the
blocker is the distinguished deletion, `u`, or belongs to that `v` block.
Every prior source, omission, physical-apex, and global-deletion hypothesis is
retained.

The coordinator-interface frontier before this second split had three direct
leaves.  Afterwards it has four transitive leaves: the two finite
source-placement terminals, the nonphysical-collision terminal, and the
shared minimal-core terminal.  Immediate constructor fan-out is two at the
physical class-membership split and two at the in-class source-identity
split.  Each new terminal has a strictly stronger, parent-produced placement
hypothesis; the split is exhaustive and acyclic, creates no orphan, and does
not restore the retired first-apex exact-five dependency.

### K-A-UNIQUE-PHYSICAL-SPLIT source-`u` cross-row checkpoint (2026-07-26)

The non-`v` member of the rigid `v`-row branch is no longer one opaque
obligation.  Production defines the source- and opposite-row strict-interior
counts by intersecting each rigid two-point class row with the physical
second-cap interior.  Two sequential decidable equality splits give exactly
three exhaustive children:

1. the source-row count is two;
2. the source-row count is not two and the opposite-row count is two; or
3. both row counts are not two.

The old
`false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerVRowOther`
`sorry` is closed by this coordinator.  Its three on-spine children are the
corresponding `..._sourceRowHeavy`, `..._oppositeRowHeavy`, and
`..._sparseRows` theorems.  Each child retains the complete context packet,
the actual blocker-in-`v`-row fact, and blocker inequality; its added count
equalities or inequalities are produced by the parent.  Since each rigid
class row has cardinality two, these constraints strictly narrow the cap
shape.  The split is exhaustive, acyclic, and has immediate fan-out three;
the local direct frontier changes from one leaf to three, so the raw direct
`sorry` count increases by two.  This is a kernel-checked decomposition, not
closure of the cross-row branch.

The focused Lean 4.27 build and generated proof-blueprint resync completed at
build `8aeaf16b2d2d`.  The anchor now reaches exactly these three leaves; no
scratch import or retired first-apex exact-five dependency was introduced.

### K-A-UNIQUE-PHYSICAL-SPLIT source-heavy placement checkpoint (2026-07-26)

The source-row-heavy child is now a checked coordinator rather than an opaque
leaf.  Production constructs the two named points in each rigid row, proves
the exact four-point physical class cover, identifies the source blocker with
the non-`v` point `xv` of the opposite row, and proves that both source-row
points lie in the strict physical-cap interior.

The retained contextual peer lies in the physical class and outside the
source row.  Splitting the exact class cover therefore leaves exactly three
placements: the singleton deletion, `v`, or `xv`; the `u` and `xu` placements
contradict the retained peer's source-row omission.  The old
`..._sourceRowHeavy` `sorry` is closed by this exhaustive coordinator.  Its
three on-spine children are `..._sourceRowHeavy_otherDeleted`,
`..._sourceRowHeavy_otherV`, and `..._sourceRowHeavy_otherXv`.

At this coordinator the interface frontier changes from one leaf to three
immediate leaves, with raw direct-`sorry` delta `+2`.  Across the enclosing
cross-row coordinator the transitive frontier changes from three leaves to
five.  Every child retains the full parent context and receives a strictly
stronger parent-produced placement equality.  The split is acyclic and
introduces no scratch import or first-apex exact-five dependency.  It is a
kernel-checked narrowing, not mathematical closure of the source-heavy
branch.

The focused Lean 4.27 build and generated proof-blueprint resync completed at
build `57ab73e8bc7e`.  Proof-blueprint confirms all three placement leaves on
the publish spine.  The active anchor is the `other = xv` leaf, where the
retained peer is the actual source blocker.

### K-A-UNIQUE-PHYSICAL-SPLIT first-growth row-incidence checkpoint (2026-07-26)

The anchored
`false_of_exactFourRigid221_sourceHeavyOtherXv_firstGrowth_uXvMutualOmission`
`sorry` is now proved on the production spine.  Its checked coordinator tests
membership of `xu`, `v`, and the distinguished deleted point in the selected
`xv` row, yielding four exhaustive branches:

1. `xu` lies in the row, where blocker localization produces the existing
   strict-convexity contradiction;
2. `xu` is absent and `v` lies in the row, where the exact row trace is
   `{xv,v}` and reindexing makes `xv` the opposite source while preserving the
   old distinguished deletion;
3. `xu` is absent and the distinguished deleted point lies in the row, where
   the exact row trace is `{xv,deleted}` and reindexing makes the old `v` the
   new distinguished deletion; or
4. neither `v` nor the distinguished deleted point lies in the row, so those
   two points are the existing distinct prescribed joint deletions.

The two reindexing branches construct complete rigid `2+2+1`, global-deletion,
and source-context packets and feed the pre-existing
`false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV`
terminal.  The last branch feeds
`false_of_twoDistinctExactFourMutualOmissionJointDeletions`.  Thus this change
removes one direct source `sorry` and introduces no new obligation, orphan, or
scratch dependency.  Its immediate case fan-out is four, but its transitive
open frontier is consolidated into those already-existing blocker-`v` and
two-deletion terminals; this checkpoint does not prove either terminal.
The focused Lean 4.27 target build passed and the edited module was freshly
kernel-mined at build `7ebe91bbe100`; proof-blueprint marks the session anchor
`[closed]` at the source/call-graph surface.  A live
`#print axioms` audit still reports `sorryAx`, inherited through the reused
blocker-`v` and two-deletion terminals, so this is dependency consolidation
and removal of the named source `sorry`, not trust-profile closure of the
anchored proposition.  The separate project-wide `refs --check` also reports
four stale and thirteen never-mined symbols outside this focused claim.

### K-A-UNIQUE-PHYSICAL-SPLIT blocker-`v` cap-shape checkpoint (2026-07-26)

The direct `sorry` in
`false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV`
has been replaced by a checked three-way coordinator.  Production now names
the source- and opposite-row strict-interior counts and splits exhaustively
into:

1. source-row count equal to two;
2. source-row count not equal to two and opposite-row count equal to two; or
3. both row counts not equal to two.

The three direct on-spine leaves are respectively
`..._blockerV_sourceRowHeavy`, `..._blockerV_oppositeRowHeavy`, and
`..._blockerV_neitherRowHeavy`.  Each retains the complete original context,
receives strictly stronger count constraints proved by the parent, and is
immediately consumed by that parent.  The split is exhaustive and acyclic,
with fan-out three and raw direct-`sorry` delta `+2`.  It introduces no
scratch import, historical-tree dependency, compatibility interface, or
retired first-apex exact-five route.

The source-row-heavy arm is narrowed one step further in production:
`blockerV_sourceRowHeavy_v_mem_secondCapInterior` proves that the blocker `v`
lies in the strict physical second-cap interior and the coordinator passes
that fact into the child.  Its live axiom audit contains only `propext`,
`Classical.choice`, and `Quot.sound`; no scratch theorem is imported.

This closes the parent declaration's source-level `sorry`, but it does not
prove the blocker-`v` proposition under the required trust profile: the
refreshed spine reaches all three child `sorry`s, and live `#print axioms`
reports `sorryAx`.  The focused Lean 4.27 build and generated graph resync
passed at build `10e9a911642a`.  The active anchor is the source-row-heavy
child.  Project-wide `refs --check` remains at four stale and thirteen
never-mined symbols outside this focused module.

The remaining geometric mismatch is now explicit.  The inherited omission
and global-deletion packets produce four-point classes at `centerAt P.v` and
`S.oppApex2`, whereas the blocker contradiction needs a class centered at
`P.v`; the packet proves the first center differs from `P.v`.  A kernel-tested
sufficient bridge is
`dist P.v.1 P.other.1 = dist P.v.1 P.source.1`, because the retained peer is
already outside the source row.  No current field derives this equality, and
the three new cap-count hypotheses do not alone repair the center mismatch.
Even the newly proved strict-cap membership of `v` does not yet give the
equality.  The anchored source-row-heavy leaf must combine that membership
with the rigid physical-class geometry to force this co-radial relation or
an equivalent `P.v`-centered four-point terminal.

### K-A-UNIQUE-PHYSICAL-SPLIT source-heavy placement-fold checkpoint (2026-07-27)

The three source-heavy placement children of the 2026-07-26 placement
checkpoint are folded, and the exact-five profile arms are closed.  Two new
kernel-checked lemmas carry the fold:

1. `exactFourRigid221_sourceHeavy_xv_mem_secondCapInterior` — the source
   blocker `xv` lies in the strict physical second-cap interior,
   profile-free, by `commonPhysicalPair_center_mem_secondCapInterior`
   applied to the co-radial strict-interior pair `{u, xu}`; and
2. `exactFourRigid221_sourceHeavy_exactFive_other_eq_xv` — under either
   exact-five profile arm the three-point strict interior is exhausted by
   `{u, xu, xv}`, so the retained peer, an interior class point omitted
   from the source row, equals `xv`.

The former first-growth packet consumed no growth-profile data: a
field-usage audit showed its consumers use only `secondInterior_eq_named`
and `other_point_eq_xv`.  It is renamed
`ExactFourRigid221SourceHeavyOtherXvExactFivePlacementPacket`, its two
unconsumed profile fields are removed, its producer takes only the
`other = xv`, cap-five, and interior-three inputs, and the incidence
dispatcher with its four sub-arms is renamed from `_firstGrowth_` to
`_exactFivePlacement_`.  The former exact-five surplus-growth leaf `sorry`
is closed through this shared dispatcher with no new geometry.

The source-row-heavy coordinator now dispatches on the robust-cap-growth
trichotomy first.  Both exact-five arms close outright through the forced
`other = xv` placement.  Retired: the `otherDeleted` and `otherV` placement
leaves, the `otherXv` dispatcher, and the `other = xv`-constrained
`secondOppositeLarge` leaf.  The single surviving leaf is
`false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge`: second cap at
least six, strict interior at least four containing the named triple
`{u, xu, xv}` (passed as the checked `xv`-interior fact), retained peer
unconstrained.

Coordinator-interface frontier for the source-heavy subtree: before, four
direct `sorry` leaves (`otherDeleted`, `otherV`, `secondOppositeLarge` with
`other = xv`, `exactFiveSurplusGrowth`); after, one
(`sourceHeavy_secondOppositeLarge`).  Raw direct-`sorry` delta `−3`.
Immediate constructor fan-out at the coordinator is three cap-profile arms,
two of them closed.  Narrowing record: the surviving leaf strictly
strengthens the retired large leaf by the recorded `xv`-interior membership
and drops only the `other = xv` equality, which is not derivable in the
at-least-six arm; the retired placement leaves are covered by the
kernel-checked trichotomy plus the forcing lemma.  This is a fold and two
arm closures, not closure of the source-heavy branch: the residual large-cap
leaf still requires the missing global input identified in the 2026-07-26
audit.

Correction note for the preceding blocker-`v` checkpoint: the proposed
co-radial bridge `dist P.v.1 P.other.1 = dist P.v.1 P.source.1` is not
derivable in the exact-five arms of that branch — there the same
three-point interior count forces `other = v`, where the bridge equality is
false outright (`dist v v = 0 < dist v source`).  Sufficiency of the bridge
stands; derivability is refuted for exactly the arms it targeted.

## Control and publication gates

| ID | Status | Dependencies | Exact deliverable | Consumer and acceptance |
|---|---|---|---|---|
| CTRL-RESOURCE | RECORDED ATAIL CVC5 PILOT COMPLETE; FRESH HOST CHECK REQUIRED 2026-07-13 | Before any new heavy Lean/CAS/SAT lane | Adam reported Census554 stopped and compute available to this lane. Fresh checks found no Census554/ATAIL/solver/Lean worker or discoverable Census554 lock; load 2.18--2.71, free RAM 234 GiB, free disk 1.7 TiB. V1 was aborted after its live audit caught sandbox `setpriority` denial and effective nice 0; it wrote no result and carries no verdict. V2 then passed a fail-closed effective-nice-10 preflight and SAT/UNSAT smoke gate and ran exactly one sequential cvc5 1.3.3 `QF_NRA --nl-cov` process, 30 s/case, under the 240 s wall. All seven frozen systems reached the exact statusless cvc5 timeout diagnostic in 219.217 s; no SAT or UNSAT status. The raw parser mislabeled those signal exits `ERROR`; the solver-free checkpoint binds the V2 manifest, raw result, nice/smoke gates, all system/SMT2 digests, constraint ledgers, return code, elapsed bounds, and diagnostic, then normalizes exactly that shape to 7/7 `TIMEOUT`. V2 manifest self-digest `fe1a96612510e03d1e0033a47446fcf6c0ef5b049d06cda6d72a69487fa6b4f9`; manifest file SHA-256 `2a220139df51e3542c970c12ef221d107ad439ff16bc5c01a4ed9408ce9b695a`; raw result SHA-256 `1c6b9c7d5862244821dbd0d5614c2d59aa8cbf18079c6f0382871287e03c0ff0`; checkpoint self-digest `f640592ebff648f67c03a41f00ba4d2e84266ba404c2cc9422306046a1004e2b`; checkpoint file SHA-256 `10de256402536c91c2c2f80535d1525f0ea538fde847e685de393f1658ae9a7d`. | Lease exhausted and process released. Before reassignment, recheck processes/locks/load/memory/disk and record a new manifest. The normalized timeout histogram is no mathematical claim and authorizes no budget extension, cross-engine retry, AHEAD run, Census554 resume, or bulk 30,997/167,782-system sweep. The stored Z3 manifest differs from its current rebuild only in the pinned `surface_checkpoint.json` hash; all seven system-input digests replay exactly. |
| CTRL-GRAPH | PARTIAL (ERASE fresh; project publication open) | Generated rewrite reaches a checkpoint; no same-project build/miner active | ERASE target builds refreshed the index and call graph at build `bb54a66383df`; `index --check` was clean and `refs --check` reported 0 stale plus 19 never-mined symbols in then-unbuilt WIP modules. At this checkpoint the tracked Lean tree is unchanged; two unimported ATAIL scratch modules are being committed and directly elaborate, but are not part of the mined project graph. | The ERASE exact-pin subtree is kernel-complete. Project-wide publication still requires serialized target builds, fresh index/refs, axiom audits, zero Front-A sorries, and verify-publish. |
| CTRL-OWN | OPEN-ENG | CTRL-GRAPH | Refresh `proof-blueprint anchor list`; assign one owner per active source file; each session owner clears or moves its own stale anchor. | No two sessions edit the same proof declaration or run same-project builds concurrently. One agent does not clear another session's anchor or overwrite its file. |
| CTRL-BANK-PREFLIGHT | OPEN-ENG | CTRL-GRAPH | Before any new finite-pattern, row-slot, incidence, or local-metric contradiction, inspect every registry listed in `AGENTS.md` and run `nthdegree docs search --lean`. Record normalized candidate statement, source/import reachability, closure status, field-by-field live-packet map, first missing antecedent, circularity check, and immediate spine consumer. | The record either identifies a directly usable theorem and its producer map or gives a bounded negative result. A consumer without its producer does not authorize a new `sorry` or certificate hunt. |
| CTRL-PROMOTE-PREFLIGHT | REQUIRED BEFORE SOURCE PROMOTION | Staged candidate decomposition and intended production consumer | Verify a kernel-checked exhaustive producer/case split; record the narrowing measure for every proposed leaf; audit circularity, complete transitive dependencies, import cost, namespace migration, and superseded interfaces; record direct and coordinator-interface frontier deltas. | This gate is evaluated on the staged candidate and import plan. It does not require an unimported candidate already to appear on the publish spine. |
| CTRL-PROMOTE-POST | REQUIRED AFTER SOURCE PROMOTION | Promoted decomposition and publish target | Verify every new leaf is imported and visible on refreshed publish spines; run focused and root builds, both publish-root axiom audits, and publication verification. | Promotion may increase the direct `sorry` count. It fails if any intended active leaf remains represented only as a `def`, function parameter, `...Closers` field, prose step, or unimported theorem. |
| CTRL-GIT | DONE for ERASE (`652fdfcb`); OPEN-ENG project-wide | Concurrent generated-certificate work finished | ERASE's 444-file source/certificate/doc checkpoint is committed and pushed with `scripts/build-p2-certificates.sh` as the bounded P2 rebuild driver. Other owners must adjudicate the remaining shared-tree changes. | The ERASE lane is reproducible from git; repository-wide publication still requires a clean, explained tree. |
| PUB-BUILD | OPEN-ENG | All kernel rows DONE; CTRL-GIT DONE | Run one serialized full `lake-build`, then `proof-blueprint index --refresh` and `proof-blueprint refs --refresh`. | Build succeeds; source index and mined graph are fresh against the same HEAD. |
| PUB-AXIOMS | OPEN-ENG | PUB-BUILD | Query both target axiom closures and every new certificate terminal theorem. | Only Lean core axioms (including `Lean.ofReduceBool`/`Lean.ofReduceNat` when present) plus approved `Lean.trustCompiler` where audited `native_decide` is used; no unsafe/extern/implemented-by decision procedure in that closure. A new `native_decide` lane receives no trust-set approval from source text alone: approval requires an exact/full green build plus a fresh transitive axiom and evaluated-code audit. |
| PUB-SORRY | OPEN-ENG | PUB-BUILD | Run `proof-blueprint symbols --with-sorry` and textual `rg` scan. | Zero source declarations with code `sorry`; prose mentions only. |
| PUB-GATE | OPEN-ENG | PUB-AXIOMS, PUB-SORRY | Run `proof-blueprint verify-publish` for both configured targets. | Exit 0; both target spines kernel-complete; no off-spine sorries. |

## Superseded Census554 card-11 alternative

At the original checkpoint, Front-B/ERASE card 11 was closed but the Front-A
two-large-cap card-11 slice was not. That status is historical. The current
production tree imports the promoted non-Census card-eleven certificate through
`ATail/CardElevenUniqueFourCertificateIngress.lean`; the source-clean exact-four
parent splits `D.A.card = 11` from `12 ≤ D.A.card` and closes the former branch.
The rows below describe a parked historical Census554 alternative, not a live
closure dependency. Current production status is recorded in
K-A-UNIQUE-POST11 and K-A-LIVE.

### Operations and terminal artifact

| ID | Status | Dependencies | Exact deliverable | Consumer and acceptance |
|---|---|---|---|---|
| A11-OPS-HOME | PARTIAL; PAUSED OFF-PATH | Census process stopped for final data move | Move the provisional code, state, bank, schemas, and deterministic fixtures from `scratch/census-554/` to `census/census_554/`. Keep bulk certificates/run outputs in a documented ignored artifact directory; copy before deleting and verify the bank digest. | Permanent package now contains combinatorics, locking/transactions, terminal publication, structural bank audit, and self-contained smoke/tests. Driver/miner/verifier/generator/state and the changing bank remain under `scratch/`; the lane is paused at the 5,939-row checkpoint rather than advancing. `uv run python -m census.census_554.cover_probe_smoke` passes from repo root. |
| A11-OPS-LOCK | DONE-CODE; LIVE-EXERCISED; CURRENTLY QUIESCENT | A11-OPS-HOME only for final path cleanup | Use one lifetime driver lease for `frontier_loop`, direct/broad CEGAR, and direct banking. Under a separate transaction lock, allocate after the maximum PID suffix, canonical-dedupe, exactly revalidate, journal the transaction, atomically publish fsynced certs, and atomically replace the fsynced bank. | Infrastructure tests cover cross-process lease exclusion, max-suffix allocation, canonical dedupe, and post-certificate fault cleanup. The pause audit found no local Census process, tmux session, or bank transaction journal. Substantive shared-queue jobs were moved to `paused/20260713T180000Z-off-critical-path/jobs`; AppleDouble `._*` metadata may remain in the active directory but is not dispatchable work. Remote mining, greedy shrink, and speculative-generator artifacts retain no bank-writer authority. Recheck processes, locks, queue contents, and the bank digest before any resume. |
| A11-OPS-CNF | OPEN-ENG | A11-OPS-HOME | Preserve the implemented per-process temporary CNF ownership in the permanent package. Terminal mode copies a named final CNF into its staging directory. | Two concurrent smoke solvers use distinct paths; fresh-checkout smoke passes with the historical `/private/tmp/claude-501` directory absent. Working-tree prototype exists; permanent gate remains. |
| A11-OPS-TEST | PARTIAL (OPTIONAL) | A11-OPS-HOME, A11-OPS-LOCK, A11-OPS-CNF | Commit self-contained fixtures and deterministic tests for SAT gates, `unlabeled_key` relabel invariance, non-isomorphic separation, AUTOS containment, and `embed_into_cube` validity. Do not require ignored certificate payloads or cwd-relative imports. | Permanent self-contained motif smoke and infrastructure/audit tests pass from repo root. Role-filtered queue tests, direct one-hot equivalence tests for speculative bank-pattern exclusions, broad-isomorph/AUTOS-distinct pending-store collision, cumulative process-plus-child CPU accounting, exact-outcome cache reuse, durable certification backlog, first-result queue stop, restart-safe orphan recovery, shared-CNF/copy-on-write materialization, and learned-exclusion carry-forward all pass; the current Census-554 suite reports 144 tests OK. The SAT encoder's five solver gates still live in scratch and must move before this optional row is DONE. |
| A11-OPS-TERM | DONE-CODE; LIVE-GATE-PENDING | A11-OPS-LOCK, A11-OPS-CNF | Stage final CNF, checked DRAT, extracted core CNF, LRAT, lock-consistent bank snapshot, and exact instance provenance. Record hashes/versions and publish `COVERAGE_COMPLETE.json` last only after re-solve and `drat-trim` verification. | Unit tests prove failed checking emits no marker; a real CaDiCaL 3.0.0 + `drat-trim` integration emits and re-verifies core/LRAT. `verify_completion` rejects the legacy marker schema and rechecks every digest and DRAT. Any marker from the pre-restart process fails this mandatory gate. |
| A11-BANK-AUDIT | PARTIAL; CURRENT STRUCTURAL PASS | A11-OPS-HOME | Produce an immutable normalized bank audit: every line valid JSON; unique canonical PID/motif; cert exists; cert PID/pattern matches row; exact verifier passes; orphan certs reported. Preserve the known proof-identical `pat_00003` duplicate only in raw provenance. | The immutable 5,934-row snapshot at `bank-audits/bank-audit-20260713T1634Z-bank5934.json` passed `STRUCTURAL_PASS`: raw SHA-256 `4b5579aad55b6f43c43022680fb5ad914556243654ed451c03ccf7a2f90c2fa3`, 5,933 normalized rows with SHA-256 `e7a0514d95adc33f23fc91fd01d39df1d53c950f4918a6d0039f98ce2f1924c9`, 5,933 referenced certificate files, no missing/orphan files, and no unexplained ID or canonical duplicates beyond the preserved proof-identical `pat_00003`. Admission validates each new certificate exactly, but the audit's full 141,467,112,677-byte exact replay is `NOT_RUN`; final freeze remains open. |
| A11-STRUCTURAL-SEED | DONE-CODE; EXERCISED; OPEN-PROOF | CTRL-BANK-PREFLIGHT; the thirteen `GeneralCarrierBridge` metric-core alternatives | Keep structural exclusions separate from the Nullstellensatz bank. Preserve the 36-instance `FourRowPerpBisectorCore` seed and run a theorem-provenance CEGAR oracle for every branch detectable from a raw equality cube. Validate finite row/flip paths, boundary-order scope, source/build/axiom evidence, and complete profile orbits; snapshot all inputs before replay. | The completed oracle-13 catalog records all thirteen formalized alternatives; twelve are raw-cube eligible and exact-off-circle is explicitly disabled without `ExactAt`. Ten unordered families and two ordered families (each checked in direct and reverse orientation) emit replayable records. The six-point two-pair core is PROVEN, its exact recovered motif replays nine closure paths and a complete 12-image orbit, and the eleven-source aggregate has `GeneralCarrierBridge.olean` SHA-256 `b4a37e979bc93b843d5f3c5d8822c6563e924b0252b73910f085ed2b610958fb`; focused builds pass and axioms are exactly `propext`, `Classical.choice`, and `Quot.sound`. Contract `5040043d196154501086163699026d48a2d9be64083fbec8c059b38656471b5d` is bound into the terminal successor artifacts. Final Lean publication still needs checked structural-record and order/orientation replay. |
| A11-SEED-SUBSUME | TRANSITIONED; LIVE-EXERCISED | A11-STRUCTURAL-SEED; frozen 5,836-row bank; A11-ORACLE-TRANSITION | Replace only bank motifs already containing the proved unordered perpendicular-bisector core by their minimized structural cores. Measure process-plus-child CPU, not wall time. | The uncached v1 wrapper remains rejected (+2.36% total CPU). The digest-pinned v2 cache passed two order-swapped 100-iteration repeats: solver CPU -5.32%, total worker CPU -2.73%, byte-identical CNF versus uncached replacement, exact inventories/databases, and zero unsafe counters. Cache SHA-256 `bbd7b6aa6942b0f1b2c2c8da2365aa8a63d69a5f32edbbef7e07ddac9dbd4db0` is snapshotted in oracle-13 and bound to exact resume metadata; its first 48 live refinements were structural with zero algebra fallback. Any changed bank requires regeneration and a fresh audit. See `docs/audits/2026-07-12-census-554-perpendicular-core-replacement-experiment.md`. |
| A11-RUN | TERMINAL-COMBINED-FRONTIER (2026-07-13 00:54 PDT) | A11-OPS-LOCK, A11-OPS-TEST, A11-OPS-TERM, A11-STRUCTURAL-SEED, A11-SEED-SUBSUME | Reach exactly one recorded result: solver UNSAT, genuine ALIVE candidate, zero-certified/certify failure, explicit bounded stop, or a surviving combined frontier routed to mining. | Oracle-13 successor `run-20260713T054559Z-oracle13-from-iter813` exited cleanly at iteration 316 with 2,464,637 exclusions and `status=combined-frontier`. Its three terminal JSON aliases are byte-identical (SHA-256 `63f69c20f5c166493a8bdd194c62d51b399d893d35fadb8341b74b8c7b918cad`); independent cube/order, frozen-bank, SQLite integrity, and released-lock checks passed. This is the bounded oracle's terminal residual, not UNSAT or Lean closure. The stopped iteration-813 source and byte-exact clone remain rollback. |
| A11-OUTCOME | RESIDUAL MOTIFS CERTIFIED AND BANKED; PAUSED OFF-PATH | A11-RUN reaches a terminal result; CTRL-RESOURCE | Route the exact frozen-generation residual to bounded mining and exact certification. Only checked UNSAT authorizes A11-FREEZE; a combined frontier, SAT progress, or bounded stop does not. | The authoritative bank is paused at 5,939 rows, SHA-256 `02fbefc4f290458895e9ad9afbb5f7f3401f428747010ed6a47aa8479ff477b2`. Every admitted post-5,898 row passed the guarded exact-admission path, but no checked coverage result was reached and the immutable 5,934-row structural audit's full 141 GB exact replay remains `NOT_RUN`. No downstream UNSAT row is dispatched. |
| A11-LEGACY-FRONTIER | PAUSED-RECOVERABLE ON 5,939 ROWS (2026-07-13 11:00 PDT) | A11-OPS-LOCK; separate from A11-RUN | Keep mutable-bank mining and merge work isolated from the frozen oracle workdir. | The sole driver was interrupted outside a bank transaction after replaying through iteration 173 (350,209 instances in 501 s); no transaction journal remains. The latest bounded producer `run-20260713T161108Z-iter690-bank5934-rebase` reached its natural `frontier-limit`: 2,428 attempts, 2,113,600 learned exclusions in 499 durable batches, and nine preserved frontier candidates. Its state SHA-256 is `c846a3c919d0a1573ce0900abd6e2336d4f045602f59547f9eead2eb0905fc62`. Flux and the idle-gated MacBook have zero substantive dispatchable jobs because the queue was quarantined; no speculative lane can write the bank or claim closure. |
| A11-RETRY-STORE | PAUSED-RECOVERABLE; DEDUP FIXED (2026-07-13 11:00 PDT) | A11-OPS-LOCK; CTRL-RESOURCE for any new worker wave | Maintain the sharded pending-certificate store and drain confirmed-dead retries without reconstructing the legacy monolith in the long-lived process. | The former pass began from 105 failures, 87 retry candidates, and 79 reconfirmed dead. All 16 preserved records (41,004,168,111 bytes) were proved current-bank AUTOS duplicates of `pat_05868`-`pat_05883`, so no publication is required. Audit found two exact candidates incorrectly suppressed by the old broader unlabeled digest; both rechecked dead. The store now preserves broad-isomorphic/AUTOS-distinct collisions, fresh scans use the bank's exact AUTOS key, and the expanded 144-test Census suite passes. No retry drainer is live; durable stores and results are preserved for an explicit future resume. |
| A11-ORACLE-TRANSITION | DONE-ORACLE13; TERMINAL-EXERCISED | A11-OUTCOME selected cached successor; A11-BANK-AUDIT; CTRL-RESOURCE | Preserve the stopped 5,836-row source as rollback, migrate every source exclusion into a private digest-bound cached successor, and require integrity/reopen/provenance checks before activation. | The transition imported all 2,304,034 dynamic source records with zero seed collisions, retargeted 88,350 structural records, and rebuilt 143,500 static seeds for 2,447,534 initial exclusions. Bank/cache/contract hashes match metadata, SQLite integrity and reopen passed, source hashes rechecked after atomic publication, and no staging spool remains. Oracle-13 later exited with the validated combined frontier recorded in A11-RUN; rollback details remain at `scratch/census-554/transition_snapshots/20260713T050037Z-oracle12-stopped-iter813/README.md`. |
| A11-FREEZE | OPEN-ENG | A11-OUTCOME selects UNSAT; A11-OPS-TERM, A11-BANK-AUDIT | Immutable manifest containing normalized bank digest, cert digests, exact motif-instance provenance, final CNF/proof digests, script commit, command, versions, full `y`-layer allocation, clause/variable IDs, and LRAT input digest. Independently run `verify_certs.py` over every source pattern referenced by the manifest. | Clean-checkout verifier reproduces all digests, checks the SAT proof and final-manifest/CNF correspondence, validates all referenced certs, and fails when one mapped motif or `y` clause is corrupted. A stdout-only UNSAT does not pass. |
| A11-COVER-FMT | OPEN-ENG | A11-FREEZE, or a representative frozen prefix for measurement | Compare direct Lean `decide`/DFS certificate, generated search trace, and checked DRAT/LRAT route. Record source size, build wall time, peak memory, and number of pattern IDs used. | Select the first format whose targeted `lake-build` remains below the 30-minute hard ceiling and the wrapper's 16,384 MB per-Lean-worker cap. If none qualifies, return measured blocker; do not claim coverage. |
| A11-CORE | IMPLEMENTED-ON-UNSAT | A11-OPS-TERM reaches checked UNSAT | Use `drat-trim -c/-L` to emit an UNSAT core CNF and LRAT, map core exclusion clauses back to manifest rows, and emit source-row digests/PIDs with cert sizes. | Integration test maps the needed exclusion into the extracted core. The live cover has not reached UNSAT, so no real core exists yet; later replay consumes the core, not the fleet. |

### Certificate replay

| ID | Status | Dependencies | Exact deliverable | Consumer and acceptance |
|---|---|---|---|---|
| A11-GEN | OPEN-ENG | A11-OPS-HOME, A11-CORE | Integrate the tracked certificate generator in the permanent package; generated files have project headers and deterministic output. Preserve the committed disjoint batch namespace and absence of duplicate global declarations. | Generate one base, pair, and multi-pair module twice byte-identically; import batch and individual compatibility probe together; targeted `lake-build` and proof-blueprint index both succeed. Twenty-one representative replay modules are committed; core-specific generation remains open. |
| A11-CERT-BENCH | PARTIAL | A11-GEN, real A11-CORE | Build representative smallest/median/p90/largest cover-core certs serially and record source bytes, coefficient terms, wall time, and peak memory. Set the naive-replay threshold from core measurements, targeting 10 minutes and never exceeding 30 minutes or 16,384 MB per Lean worker. | Fleet scan records 78.16 GB total, p50 54,787 B, p90 7,193,804 B, p99 365,247,505 B, max 2,281,208,887 B, and 157 certs over 100 MiB. Core-specific builds/classification remain open. |
| A11-EQUALITY-CORE | OPTIONAL | A11-CORE, A11-GEN | For frozen core IDs with checked `DuplicateCenterCore`, `EqualK4Core`, `EquilateralBisectorCollisionCore`, or `ThreeTriadCollisionCore` witnesses, generate/validate the finite witness data and use the Census554 equality-core modules to emit `IsDead`. | Targeted adapter builds and axiom audit pass; manifest IDs match exactly; the measured certificate-core reduction is recorded. This is neither bank coverage nor a closure theorem, and unmatched patterns continue through A11-CERT-*. |
| A11-SEPARATION-CORE | PARTIAL | A11-CORE, A11-GEN, A11-GEO-CLASS | `Census554/SeparationCore.lean` and `SeparationMirror.lean` provide the shared-pair theorem and two 72-order surfaces; `SeparationCertificate.lean` executably checks proof-free row/flip paths over all 144 orders and proves checker soundness. `SeparationGeometry.lean` now derives the direct-or-mirror labeling from the cap geometry, and `SeparationBridge.lean` composes it with the checked-certificate contradiction. Generate concrete checked certificates for frozen core IDs. | The generic checker, geometry adapter, bridge, and consumers build and have core-only axiom closures. Remaining acceptance is row-specific: both direct and mirrored finite witnesses must check for every claimed core ID. Neither a one-orientation assumption, a Python-only row rejection, nor a checker with no concrete row certificate passes. |
| A11-CERT-LIGHT | OPEN-ENG | A11-CERT-BENCH | Generate and build every LIGHT cover-core certificate. Export one `IsDead` theorem per core pattern. | Targeted modules build serially; generator's exact re-derivation passes; theorem axioms are core plus approved native-decision boundary; each evaluated closure is audited for unsafe/extern/implemented-by redirection. |
| A11-CERT-HEAVY | OPEN-ENG | A11-CERT-BENCH | For each HEAVY core certificate, choose in order: re-lift with alternative order, split the `multi_pair` Rabinowitsch set, re-mine a smaller covering motif, then optimize `SPoly.normalize`. Record old/new terms and build time. | Every heavy core ID obtains a buildable `IsDead` theorem within the same limits and receives the same native-decision audit. A proof change for the same motif refreshes only its certificate; a changed motif, cover, or manifest invalidates A11-FREEZE, A11-CORE, A11-COVER-CHECK, and the LRAT replay. Fleet-wide heavy certificates outside the core are not blockers. |
| A11-CERT-INDEX | OPEN-ENG | A11-CERT-LIGHT, A11-CERT-HEAVY | Generated `CoverCoreBank.lean` lists core patterns and maps every entry to its `IsDead` theorem without duplicate declarations. | One target imports the full core bank within build budget; no missing or extra pattern IDs versus A11-CORE. |

### Geometry bridge

| ID | Status | Dependencies | Exact deliverable | Consumer and acceptance |
|---|---|---|---|---|
| A11-GEO-CARD | DONE | Existing cap-sum and lower-bound lemmas | `Census554.card_ge_eleven_of_twoLargeCaps`: surplus cap `>4`, distinct second cap `>=5`, third cap `>=4` imply `11 <= A.card`. | `lake-build Erdos9796Proof.P97.Census554.GeometryBridge` succeeds; axioms are only `propext`, `Classical.choice`, and `Quot.sound`. This is the exact lower bound on the live Front-A declaration; it does not close equality at 11. |
| A11-GEO-LABEL | DONE | A11-GEO-CARD; `capProfile_eq_554_of_card_eq_eleven`; `MultiCenter/CapProfile.lean` | `Card11Labeling` and the stronger `Card11CapLabeling`: `pointOf : Fin 11 → ℝ²` is injective with range exactly `D.A`; labels 0/1/2 are U/V/W; blocks 3--5, 6--8, and 9--10 map exactly to the three strict cap interiors. | `Card11CapLabeling.nonempty_of_card_eq_eleven` constructs the labeling from the leaf hypotheses and `D.A.card = 11`; `labelsOf_surplusCap_eq_capS`, `labelsOf_secondCap_eq_capO1`, and `labelsOf_restCap_eq_capO2` identify the closed caps exactly. |
| A11-GEO-CLASS | DONE | A11-GEO-LABEL; `exists_selectedFourClass_of_globalK4` | `Card11SelectedCube.ofGlobalK4` chooses one proved-nonempty `SelectedFourClass` at every `pointOf p`; `cube` is its exact support preimage; `image_cube_eq_support` and `equidist_of_mem_cube` provide the schema-neutral geometric realization facts. | Support cardinality, exact support image, and equidistance transport compile. `Card11SelectedCube.realizesCube` packages them through the now-complete A11-COVER-REL interface. |
| A11-GEO-C1C2 | DONE | A11-GEO-CLASS | C1 and C2 fields: mask card 4, center absent, pairwise class intersections at most 2 via `SelectedFourClass.inter_card_le_two`. | `cube_card`, `center_not_mem_cube`, and `cube_inter_card_le_two` supply the corresponding `CubeOk` conjuncts. |
| A11-GEO-C4 | DONE | A11-GEO-LABEL, A11-GEO-CLASS | C4: every point pair occurs in at most two selected classes, using `Dumitrescu.perpBisector_apex_bound` and injectivity of `pointOf`. | `pair_hit_centers_card_le_two` proves the C4 `CubeOk` conjunct for every distinct pair. |
| A11-GEO-H1 | DONE | A11-GEO-LABEL, cap frame | One-hit at census labels V=1 and W=2, transported from `leftAdjacentCap_at_opposite_card_le_one_of_convexIndep` and its right sibling for the selected class radii. | `onehitOk_of_capProfile` proves exactly the two conditional clauses in `OnehitOk`; it makes no stronger all-center claim. |
| A11-GEO-CUBE | DONE | A11-GEO-C1C2, A11-GEO-C4, A11-GEO-H1 | `Card11SelectedCube.cubeOk : CubeOk selected.cube` and `exists_card11SelectedCube_cubeOk` from the geometric card-11 leaf hypotheses. | `lake-build Erdos9796Proof.P97.Census554.GeometryBridge` succeeds; source has no `sorry`/`admit`/declared axiom; live axiom queries for both terminal theorems report only `propext`, `Classical.choice`, and `Quot.sound`. |

### Motif cover and geometric contradiction

| ID | Status | Dependencies | Exact deliverable | Consumer and acceptance |
|---|---|---|---|---|
| A11-MOTIF | DONE | None | `Problem97.Census554.motif_transfer`. | Sorry-free; core axioms only. |
| A11-EMBED | DONE | None | `Problem97.Census554.exists_injective_extension` and `motif_transfer_of_supportInjOn`. | Compiled 2026-07-09; source sorry-free; live axiom query for the terminal theorem reports only `propext`, `Classical.choice`, and `Quot.sound`. |
| A11-COVER-REL | DONE | A11-EMBED, A11-GEO-CLASS | `CoverRow`/`CoverRow.Certified`, `PatternEmbedsUnder`, and `RealizesCube`; `RealizesCube.equidist_of_patternEmbedsUnder`; the row-oriented deadness implication; and `Card11SelectedCube.realizesCube`. | `lake-build Erdos9796Proof.P97.Census554.CoverRelations` succeeds; a hand-written two-row nonidentity relabeling exercises the intended direction; source is sorry-free; live axiom queries for all three public endpoints report only `propext`, `Classical.choice`, and `Quot.sound`. `CubeOk` alone is never used to derive `False`. |
| A11-COVER-CHECK | PARKED-SPEC; NON-PRODUCTION | A11-FREEZE, A11-COVER-FMT, A11-CORE | Historical target: `coverCore_covers : CubeOk kappa -> exists row in coverCore, exists f, PatternEmbedsUnder row.pattern f kappa`, where the relation includes `Set.InjOn f (support row.pattern)`. | The selected finite checker builds and checks the frozen manifest; changing one known-needed cover witness makes its regression fixture fail. The promoted non-Census certificate closes the production card-11 branch, so this remains historical alternate work. |
| A11-COVER-DEAD | PARKED-SPEC; NON-PRODUCTION | A11-CERT-INDEX, A11-COVER-REL, A11-COVER-CHECK | Historical target: `not_realizesCube_of_coverCore : CubeOk kappa -> not (RealizesCube x kappa)`. | The proposed proof chooses a covered row and embedding, obtains `row.Certified` from the generated certificate index, and applies `CoverRow.not_realizesCube_of_embeds`. It is not a current production obligation. |
| A11-CONSUME | SUPERSEDED; NON-PRODUCTION | Historical A11-GEO-CUBE and A11-COVER-DEAD route | Historical target: `Census554.false_of_cardEleven_twoLargeCaps`. | This Census554 consumer was not needed. The promoted non-Census certificate now closes the production card-11 exact-four residual through `ATailCardElevenUniqueFourCertificate.false_of_firstApexUniqueRadiusExactFourResidual`. |
| A11-WIRE-PARENT | DONE-PRODUCTION VIA NON-CENSUS INGRESS; OLD CENSUS WIRE SUPERSEDED | K-A-UNIQUE-POST11 | `false_of_firstApexUniqueRadiusExactFourResidual` splits at `D.A.card = 11`, uses `false_of_firstApexUniqueRadiusExactFourResidual_of_card_eq_eleven`, and sends the other branch to the `12 ≤ D.A.card` leaf. | The checked split is in `ATail/FrontierLiveClosure/Rigid221Closure.lean`; no Census554 consumer or legacy pair/LIVE helper wiring is on the production path. |

## Front-A card-at-least-11 and liveData rows

**Historical priority decision, 2026-07-13; superseded for card 11.**
ATAIL-FORCE was then the proof-critical lane, Census554 the paused conditional
card-11 alternate, and AHEAD a bounded cards-12--14 fallback. The promoted
non-Census certificate and checked card-11/card-at-least-12 split have since
removed A11-CONSUME from the production path. The remaining finite banks and
SAT progress are theorem-discovery evidence, not closure.

**Parallel-research authorization, 2026-07-13.** Adam explicitly authorized
ATAIL/AHEAD work as genuine parallel closure research and authorized the
proof-local analysis files, scratch Lean/Python artifacts, bounded
computations, theorem-bank searches, and closure-document synchronization
needed to pursue the producer without per-artifact permission. This preserves
the recorded ownership of the shared Route-B/LIVE-T1 source and does not
extend to destructive or unrelated external actions.

### Route decisions and Candidate D

| ID | Status | Dependencies | Exact deliverable | Consumer and acceptance |
|---|---|---|---|---|
| AHEAD-DEC | DONE 2026-07-13 (Adam-authorized parallel head research) | None | Decision: authorize head-only card 12-14 narrowing as genuine parallel closure research, independent of Census554/A11. AHEAD-SPEC and lightweight deterministic preflights may proceed immediately. Heavy AHEAD-N12/N13/N14 runs require both the permanent worker gate and a fresh CTRL-RESOURCE assignment: one labeled profile at a time, at most four workers, long processes niced, and an immutable pre-run manifest declaring wall, bank-growth, and shape-staleness stops. | Authorization is research-only: use PROVEN cuts in the proof tier and label finite/SAT evidence by scope. Census554 is stopped and no longer owns the compute pool, but no AHEAD run starts merely from resource availability. Do not introduce a named >=15 residual now; that becomes permissible only after AHEAD-COVER is proved and AHEAD-CONSUME introduces it with its immediate spine consumer. |
| AHEAD-SPEC | OPTIONAL-PARTIAL (candidate surface + SAT base + durable stop/certificate-bank boundary landed 2026-07-13; parallel research authorized) | AHEAD-DEC DONE | Keep tooling in `census/card_head/`; exclude CONJECTURED cuts from the proof tier; prove every retained geometric cut. Enumerate the listed 3/6/10 labeled profiles at n=12/13/14. | Python enumeration/tests and Lean `labeled_cap_profile_card{12,13,14}_iff` prove arithmetic exhaustiveness. `run_manifest.py` freezes the post-SUB2 PROVEN cut contract (SHA-256 `8e067c226a9e5fec0825d0f7461d84af3aca19baaba52d6faafcbd7d8be505cf`), pins the niced permanent entrypoint, and enforces source digests, safe paths, worker/nice bounds, all three stop caps, and exclusive creation. `candidate_surface.py` and the committed fixture exhaust all 19 profiles, 254 profile/center instances, and 106,755 per-center candidates; card-12 matches all three historical `all` profiles exactly and every count matches an independent closed form. `sat_encoding.py` ports C1/C2/C4 plus raw-pattern exclusion: (6,5,4) reproduces the historical 37,310-variable/297,119-clause base exactly; representative n=13/n=14 base sizes are pinned; five card-12 smoke gates pass, with SAT models rechecked by `cube_ok` and all three forced-UNSAT gates DRAT-verified. `historical_bank.py` structurally replays all 256 `654_all` rows, 20,610 profile-orbit instances, and 159 shape labels against the permanent surface; the 9.23 GB certificate identities are explicitly NOT rerun. `run_protocol.py` publishes immutable manifest/hash-bound events and derives the wall, new-bank, and consecutive-shape-staleness stops; a reached stop is terminal, while engine exhaustion remains explicitly UNVERIFIED. `pattern_certificate.py` reconstructs the exact gauge-fixed equidistance/Rabinowitsch generators and accepts a dead pattern only after generator-fidelity checks and exact `Fraction` replay of a polynomial identity equal to one. `cegar_adapter.py` independently rechecks the source cube, pattern containment, raw-orbit novelty, full-profile candidate compatibility, and every exact certificate before producing a prepared iteration. `bank_store.py` then couples read-only certificate publication, append-only bank rows, and the terminal-aware protocol event through a locked, fsynced recovery journal; crash recovery is tested before the bank append, after the bank append, and after the event append. `runner.py status` reports exact replay and bank publication enabled while the mining/generation worker remains disabled. `execute` remains correctly fail-closed; Census554's released compute removes the external contention gate but does not remove AHEAD-WORKER. All 52 card-head tests pass; no heavy head census has launched. |
| AHEAD-WORKER | OPEN-ENG; EXECUTION DISABLED; RESOURCE POOL AVAILABLE | AHEAD-SPEC; fresh CTRL-RESOURCE preflight before launch | Port a cardinality-generic proposal worker into `census/card_head/`; add a lock-consistent validated bank snapshot and bank-to-CNF adapter; separate witnessed fresh shapes from certified/banked fresh shapes; hold one cross-profile lifetime lease; and orchestrate SAT decode, proposal, exact preparation, transactional commit, policy stops, resume, and honest unverified exhaustion. Bind execute to the canonical manifest path and include every new source in the immutable source-digest set. | Fake-solver/worker tests cover start, resume, commit, every stop, no-certificate SAT witness, UNKNOWN/interrupt, verified-UNSAT-but-unpublished terminal state, crash recovery, and concurrent-profile rejection. Then the full fast suite and card-12 SAT/DRAT smoke pass. Only after those gates may one final (6,5,4) manifest be created and AHEAD-N12 launched. Deleting the current fail-closed exception alone is forbidden. Final finite coverage still needs a separate hash-bound CNF/DRAT/core/LRAT publisher and Lean consumer. |
| AHEAD-N12 | OPTIONAL-AUTHORIZED; SOFTWARE-GATED | AHEAD-WORKER; fresh CTRL-RESOURCE assignment to AHEAD | Run all three n=12 profiles under PROVEN cuts with predeclared wall, bank-growth, and shape-staleness stops. | One immutable manifest and honest terminal state per profile. Historical `654_all` remains nonterminal and is not coverage: its order-free `s <= 2` exclusion is now PROVEN post-SUB2 for dropping `s >= 3`, but it covered only (6,5,4), did not converge, and predates the immutable manifest/source-digest gate. The permanent (6,5,4) candidate surface and empty-bank SAT base match the historical encoding exactly. Structural bank replay passes for all 256 rows (bank SHA-256 `e65e00a1a8ac900a5608061d135fb3b46c77f79b0c78533c775119816eeb8c04`), but the 9,233,993,303-byte certificate payload has not received a fresh identity replay; no old terminal or coverage claim is upgraded. |
| AHEAD-N13 | OPTIONAL-AUTHORIZED; SOFTWARE-GATED | AHEAD-WORKER; fresh CTRL-RESOURCE assignment to AHEAD | Run all six labeled n=13 profiles under the same proved interface and stops. | One immutable manifest and honest terminal state per profile; the existing 300/300 dead sample is not coverage. |
| AHEAD-N14 | OPTIONAL-AUTHORIZED; SOFTWARE-GATED | AHEAD-WORKER; fresh CTRL-RESOURCE assignment to AHEAD | Run all ten labeled n=14 profiles under the same proved interface and stops. | One immutable manifest and honest terminal state per profile; the existing 160/160 dead sample is not coverage. |
| AHEAD-COVER | OPEN-RESEARCH | AHEAD-N12, AHEAD-N13, AHEAD-N14 all reach checked coverage | For every profile, replay the used deadness-certificate core and kernel-check its finite cover plus the geometric profile-to-cube bridge. | Sorry-free theorem excludes exactly cards 12, 13, and 14 under the actual Front-A hypotheses. Current evidence does not satisfy this row. |
| AHEAD-CONSUME | OPEN-PROOF | AHEAD-COVER | Split both Front-A consumers into card <=14 and `15 <= D.A.card`; eliminate the checked head cases and introduce the exact named >=15 residual only with its immediate spine consumer. | Cards 12-14 disappear from both leaves; no off-spine placeholder or sample-based split. |
| ATAIL-SUB2 | DONE 2026-07-12 (math PROVEN + audited; Lean certificate landed) | Candidate-D probe | DECIDED: SUB2-H UNSAT (both chains, closed-disk form, and the ω-carrying 8-variable SUB2 artifacts as they stand), by bisector-frame hand proof + exact machine-checked polynomial certificate (46d4d056; report e87f7607; `scratch/atail-sub2/`). PROVEN flavor: pen-and-paper + exact-rational certificate (sympy division AND independent Fraction division; `ring`+`positivity`-shaped, no QE, no `native_decide`). Adversarial skeptic audit PASS 2026-07-12 (`scratch/atail-sub2-audit/`): statement fidelity, all 11 conversion lemmas symbolically re-verified, identity independently re-derived from scratch + 2000 exact configs, smoke suite re-run ALL PASS (stale `smoke_results.json` regenerated). Downstream (per kill_notes K-D, audit-verified): kills (0,3,0,1), (0,4,0,0), (1,3,0,0) outright; s=2 straddle-only upgraded to PROVEN; (1,2,0,1) k∈{0,2} killed, k=1 stays OPEN; K_plus tier CONJECTURED→PROVEN with no Q2 rerun (scope exact per `q2_token.py:131-132`). | Lean-theorem gate MET 2026-07-12: `Problem97.ATailSub2.sub2H_left_unsat` / `sub2H_right_unsat` + core `chord_chain_incompatibility` (`lean/Erdos9796Proof/P97/ATail/Sub2Certificate.lean`, leaf module, sorry-free; staged `linear_combination` certificate, no QE/`native_decide`; axioms propext/Classical.choice/Quot.sound pinned in-file by `#guard_msgs`; single-file gate exit 0, agent + orchestrator runs; statement fidelity checked atom-by-atom against STATEMENT.md by both). The enlarged PROVEN cut set was fed into ATAIL-Q3; Q3 remained token-SAT and is now a DONE-NEGATIVE decider. |
| ATAIL-Q3 | DONE-NEGATIVE 2026-07-13 (selected-four/two-center surface exhausted) | Existing proved per-type cuts + the ATAIL-SUB2 kill set (MATH-PROVEN 2026-07-12) | The historical Q3 sweep classifies all 87 mirror-reduced joint classes: 68 exact-rational realizations, 4 exact `Q(sqrt(3))` realizations, and 15 reported proved kills. The Q3 kills applied simultaneously to all three Moser pairs leave a verified token assignment for every one of the 22 unordered profiles at cards 12--16, both before and after the SUB2 proved cuts. | Permanent checkpoint `census/q3_two_center/checkpoint.py` / `checkpoint.json`: exact replay of all 72 realized windows with mutation rejection; exact structural replay of all 44 stored profile/tier assignments; input SHA-256 pinning; repaired falsifier gate passes on 9 banked configurations / 396 nonobtuse triangles. Epistemic boundary: token SAT is not a full-configuration counterexample, the guard-banded falsifier gate is empirical, and the checkpoint does not independently replay the 15 hand/Z3 kill proofs. This row is terminal negative and does not close ATAIL-FORCE. |
| ATAIL-EQ-PILOT | DONE-NEGATIVE-TRACTABILITY 2026-07-13 | ATAIL-FORCE preflight/reduction checkpoint current | The immutable seven-case separator-saturated pilot ran one `msolve` thread for one S3 equality-orbit stratum at each interior-support size 6--12, with 20 seconds per case. Inputs ranged from 56 to 137 augmented variables and 51 to 120 equations. | 7/7 TIMEOUT, empty output, total 141.357 s; no C-empty or dimension verdict and no mathematical claim. The naive one-Rabinowitsch-variable-per-separator encoding is rejected as a follow-on route. Results: `census/atail_force/separator_pilot_results.json`. The exact constructive distinct-witness replay supersedes further time increases. |
| ATAIL-DISTINCT-REPLAY | DONE-NEGATIVE 2026-07-13 (equality-only route) | ATAIL-EQ-PILOT; exact witness constructor and pinned preflight inputs | Construct and exact-replay a separator-satisfying algebraic witness for every raw equality skeleton without assuming the omitted cap/order inequalities. | `census/atail_force/distinct_equality_checkpoint.json` covers all 343 skeletons, verifies 4,802 equalities and 19,978 nonzero pairwise-distinctness/nondegenerate-triangle separators, and proves every coordinate real algebraic in all 343 witnesses. It checks no disk/nonobtuse/cap/global-order inequalities and proves no full configuration, full-filter pair, or Lean statement. Thus bare and separator-saturated equality impossibility are rejected even over real algebraic coordinates; ATAIL-FORCE remains open. |
| ATAIL-INEQ-PILOT | DONE-NEGATIVE-TRACTABILITY 2026-07-13 | ATAIL-DISTINCT-REPLAY; immutable full-system generator current; CTRL-RESOURCE lease recorded | The immutable seven-case pilot selected the same representative in each interior-support stratum 6--12 and included every emitted MEC-disk, nonobtuse, cap-sign, and global-order inequality. It ran one sequential Z3 4.16.0 QF_NRA/NLSAT process with 30 seconds per case and a 240-second aggregate wall. | 7/7 `TIMEOUT`, total 219.901 s, no model, no UNSAT proposal, and no row classification. Every case is bound to its exact generator digest and the result is bound to manifest self-digest `a71976ad2043c0658a46d2c94d21e97c49c7258f1220669c71339df3b6414c31`. This is no mathematical claim and rejects both an immediate budget increase and a blind bulk sweep. Results: `census/atail_force/inequality_pilot_results.json`. |
| ATAIL-CVC5-PILOT | DONE-NEGATIVE-TRACTABILITY 2026-07-13 | ATAIL-INEQ-PILOT frozen seven-case systems; CTRL-RESOURCE V2 lease | Replay exactly the seven frozen full-inequality system digests with a different NRA engine, without increasing the case menu or budget: one sequential effective-nice-10 cvc5 1.3.3 `--nl-cov` process, 30 s/case, 240 s aggregate. | V1 aborted on live priority-fidelity failure and wrote no result. V2 passed nice and SAT/UNSAT smoke gates; all seven queries reached the exact statusless cvc5 timeout diagnostic in 219.217 s. `cvc5_pilot_checkpoint.py` independently validates the immutable manifest/result and normalizes only the exact signal/diagnostic shape to 7/7 `TIMEOUT`; mutation rejection passes. Zero SAT candidates, zero UNSAT proposals, no row classification, and no mathematical claim. Artifacts: `census/atail_force/cvc5_pilot_manifest_v2.json`, `cvc5_pilot_results_v2.json`, `cvc5_pilot_checkpoint.json`. |
| ATAIL-ORDER-FAN-1 | CHECKED-SCRATCH 2026-07-13; NARROW CUT | ATAIL-INEQ-PILOT frozen six-interior-point system; materially smaller forced-subsystem policy | Keep the equality/disk/nonobtuse/cap base and only the first seven cyclic-order inequalities, then minimize the repeatable Z3 UNSAT proposal and replace solver trust with an explicit proof. | Conservative deletion retains a 15-hypothesis six-point scalar kernel; `scratch/atail-force/order_fan_kernel.lean` proves it solver-free. The exact S3 matcher finds the pattern in 39/167,782 selected-four decorations across 21 joint classes. The other six frozen strata are `UNKNOWN` at five seconds. There is no live-leaf inventory bridge, full-filter pair, or on-spine consumer, so this is a theorem-bank seed and extraction template, not ATAIL-FORCE closure. |
| ATAIL-CAP-KERNELS-1 | CHECKED-SCRATCH 2026-07-13; NARROW CUT | ATAIL-ORDER-FAN-1; complete bounded m=6 edge-fan diagnostic | Exhaust the seven S3-representative m=6 class orbits, 25 representative orders, and nine oriented edges per order, then independently prove every order-free UNSAT orbit used as a cut. | The 225-query diagnostic reports base 7 SAT / 12 UNKNOWN / 6 UNSAT and fan 26 SAT / 155 UNKNOWN / 44 UNSAT; these statuses alone make no mathematical claim. The six base proposals are exactly four class-2422 and two class-2472 decorations. `two_circle_cap_kernel.lean` and `bisector_cap_kernel.lean` give explicit solver-free Lean proofs. Their exact S3 matchers reach 24 systems / 6 classes and 66 / 18. Together with the disjoint order-fan cut, the union is 129/167,782 systems across 45 classes, leaving 167,653. No live-leaf inventory bridge, full-filter pair, or on-spine consumer is claimed. Blind selected-four kernel mining is no longer primary without a forcing theorem. |
| ATAIL-SIXTH-ROW-SCOPE | DONE-AUDIT 2026-07-13 | Live Lean signatures and theorem-bank preflight | Replay the actual critical-row inputs before choosing the theorem boundary. | `CriticalSourceRows` contains exactly five abstract rows (`q,t1,t2,t3,u`). The LIVE helper receives a sixth row and comparison maps, while the legacy pair theorem loses that provenance. The current route therefore moves upward: retain the concrete parent `Hcritical` and call the direct-`False` theorem before the LIVE slot split. Audit: `docs/audits/2026-07-13-atail-sixth-row-scope.md`. |
| ATAIL-SIXTH-ROW-COUPLING | CHECKED-SCRATCH 2026-07-13; ON-SPINE CONSUMER PENDING | ATAIL-SIXTH-ROW-SCOPE; exact `CriticalFourShell.support_eq` fields | Prove that equal row centers plus equal selected `l1` identify the complete exact four-shell supports, then apply the live comparison maps whenever `f2 = rows.sourcePoint source`. | `scratch/atail-force/critical_row_coupling.lean` builds sorry-free and proves both the generic support equality and its sixth-row application. This normalizes all named-source collision branches but does not close the surviving T1/T3 slot permutations. No shared Lean source was edited because the pair/live source is concurrently owned; mark DONE only after an immediate spine consumer imports it. |
| ATAIL-LIVE-PROVENANCE | CHECKED-SCRATCH 2026-07-13; POSITIVE FRONTIER, NOT CLOSURE | ATAIL-SIXTH-ROW-SCOPE; wrapper construction from one `CriticalShellSystem`; theorem-bank preflight | Retain constructor-level provenance for all five source rows plus `f2CriticalRow`; recover deletion-blocker facts and exact same-center support transport. | `scratch/atail-force/live_critical_provenance.lean` kernel-checks without `sorry`. It records useful normalization and a one-center off-dangerous pair, but the former request for both opposite-apex radii is compatibility-only. Any successor must feed an existing cap/critical-row/core terminal or the parent robust `False` theorem. LIVE-T1 is source-closed; the parent theorem is intended to bypass the entire LIVE tree. |
| ATAIL-LIVE-INCIDENCE | DONE-NEGATIVE 2026-07-13; EXACT WITHIN FINITE INCIDENCE ABSTRACTION | ATAIL-LIVE-PROVENANCE | Retain the six four-point row supports, source membership, `f := t2[0]` and `f5 := t2[1]` in the `t2` row, center/source separation, equal-center support coupling, all distinct-center two-circle overlap bounds, conditional comparison maps, seven LIVE-C center branches, and the two `t2` subbranches; seek a forced current incidence sink. | `scratch/atail-force/incidence_delta_census.py --check` stores and validates one explicit witness for every family: 7/7 `SAT_INCIDENCE_ONLY`, zero forced second-center collision, zero `q`-plus-two-dangerous support, and zero five-source support. Witness digest `78d6ea82c294e8dd2943f1dec50e9bf51a6de88bbef91c34f649c2f28a115a3e`. The witnesses are not Euclidean/convex realizations and metric consumer fields are not modeled. Incidence-only forcing is terminal at this interface; the next producer must add cap/order/full-filter or metric information. |
| ATAIL-CRITICAL-METRIC | TRUSTED EXACT-CAS 2026-07-13 FOR TWO SAVED SHADOW WITNESSES; NONEXHAUSTIVE | ATAIL-LIVE-INCIDENCE; stronger one-row-per-center finite shadow | Retain support overlap at most two, one common cyclic order with every shared-pair separation, and avoidance of all currently formalized metric cores; ask whether the saved internal block-profile `(4,5,6)` and `(5,5,5)` candidates have any normalized Euclidean equality realization. The first label is not the matrix's labeled-cap tuple order; no orientation bridge is claimed. | `critical_row_metric_discriminator.py --check` returns `UNIT` over `QQ` for contained subsystems of both saved candidates. No Nullstellensatz certificate was independently replayed; this proves no generic core or Lean theorem. The useful successor is a parent-level classifier into `outsidePair_unique_capCenter`, another checked terminal packet, or `False` directly. Opposite-apex radii are only an internal terminal. Audit: `docs/audits/2026-07-13-atail-critical-row-metric-discriminator.md`. |
| ATAIL-JOINT-FIBER-SINK | CHECKED-SCRATCH 2026-07-13; NEGATIVE/COMPATIBILITY BOUNDARY | Existing `oppCap2_escape_gen`, apex one-hit and exact-radius cover theorems, global K4 | Record that the old shared-radius endpoint is already a contradiction and that separate apex marginals do not produce it. | `doubleApexJointFiber_sdiff_surplus_card_le_one` proves every fixed off-surplus joint fiber has cardinality at most one, while distance to the other apex is injective on each three-point marginal. Do not dispatch a correlation/lower-bound producer from this row; the successor is parent robust coupling to an existing terminal or `False`. Audit: `docs/audits/2026-07-13-atail-apex-filter-assessment.md`. |
| ATAIL-BLOCKER-GRAPH-GATE | DONE-NEGATIVE 2026-07-13 AT RELAXED BLOCKER ABSTRACTION | `CriticalShellSystem` blocker API; ATAIL-JOINT-FIBER-SINK | Test whether global K4, deletion criticality, blocker cycles, spanning, and shell-overlap bounds force the fixed two-apex joint pair. | No. `blocker_graph/countermodel.py` exactly checks a 12-vertex symmetric distance-equality witness with a spanning blocker cycle and singleton joint fibers. `blocker_graph/euclidean_countermodel.py` exactly checks a 33-point integer-coordinate Euclidean witness with global K4, every single deletion breaking global K4, genuine blocker cycles, and an injective fixed two-center distance map. The Euclidean witness is non-convex and is not a K-A-PAIR counterexample; it isolates convex/Moser/cap localization as load-bearing. Cycle length, spanning, and blocker surjectivity are terminal here. Audit: `docs/audits/2026-07-13-atail-blocker-graph-assessment.md`. |
| ATAIL-GLOBAL-COUNT-CARD-EQ-12 | DONE-NEGATIVE 2026-07-13; PROVEN COUNT PLUS VALIDATED STRENGTHENED FINITE SHADOWS | Ordered-cap outside-pair count; global K4; common critical blocker cover; `CARD-EQ-12` profiles | Determine whether summing the cap-center outside-pair inequalities, strengthened by common-system blocker fibers and exact abstract rows, forces the joint pair or same-cap second center. | No. The proved per-cap lower is `m+4`, while capacities retain slack: summed 27 versus 63 for `(5,5,5)` and 64 for `(4,5,6)`. `source_mem_selectedFourClass` bounds each blocker fiber by four, but `selectedFourClass_support_eq_shell` identifies the global and critical rows at a blocker center, so they cannot be counted twice. `scratch/atail-force/global_count_boundary/` deterministically validates strengthened 12-point shadows for both profiles with common blocker provenance, one-sided cap injectivity, endpoint bounds, cyclic separation, outside-pair uniqueness, and singleton fixed joint fibers. These are not Euclidean/convex models and are nonexhaustive. Audit: `docs/audits/2026-07-13-atail-global-count-boundary.md`; replay plus 9 tests pass. A new real metric/order-realizability coupling is required. |
| ATAIL-SAME-CAP-BOUNDARY | CHECKED-SCRATCH 2026-07-13; EXACT OPEN FIELD ISOLATED | Exact dangerous `p` row; `selectedFourClass_inter_capByIndex_card_le_two`; `outsidePair_unique_capCenter` | Kernel-check every routine step around the smaller same-cap producer and package its terminal. | `DangerousRowSameCapSecondCenter.false` closes through the ordered-cap sink; a cap-local support-multiplicity field is sufficient but remains CONJECTURED. It is one accepted output of ATAIL-PARENT-CONTENT, not a standalone producer lane. |
| ATAIL-DANGEROUS-BLOCKER-COLLAPSE | CHECKED-NEGATIVE 2026-07-13; EXACT LEAN OBSTRUCTION | `hlocalNoQFree`; `hfixed`; `CriticalShellSystem.overrideExactSelectedClass` | Decide whether blocker-center diversity among the four dangerous sources can be extracted from an arbitrary witness of `hcritical`. | No. `scratch/atail-force/dangerous_blocker_collapse.lean` kernel-checks without `sorry`: the dangerous radius class is exactly `{q,t1,t2,t3}`, every member deletion blocks `p`, and any critical-shell system can be overridden so all four dangerous sources have `centerAt = p`. Endpoint axiom audit: exactly `propext`, `Classical.choice`, `Quot.sound`. This does not refute existence of another useful system; it proves that an arbitrary-system/dangerous-source selection cannot force the needed non-`p` center. A successful producer must use a source outside the dangerous class, independently construct a non-`p` blocker, or thread load-bearing common provenance. |
| ATAIL-OUTSIDE-SOURCE-BOUNDARY | CHECKED-SCRATCH 2026-07-13; TWO EXACT FIELDS OPEN | ATAIL-DANGEROUS-BLOCKER-COLLAPSE; live selected source `u`; `rows.uRow`; ordered-cap intersection bound | Kernel-check everything the honest outside source contributes and isolate the smallest remaining cap-local producer. | `scratch/atail-force/outside_source_cap_multiplicity.lean` builds without `sorry`. It proves `u` is an ambient dangerous-class outsider, any common-system blocker at `u` differs from `p`, and the live `u` row has the expected carrier/card/complement bounds. The exact remaining proposition is `URowCapMultiplicityFields`: one cap must contain both `p` and the `u`-row center, and at least two dangerous support points must lie outside that cap. Existing cap coverage gives two independent cap indices; existing complement bounds do not align the dangerous and cap complements. `URowCommonCapOffDangerousConfinement` is a checked sufficient condition, not a proved live fact. Endpoint axiom audits are exactly `propext`, `Classical.choice`, `Quot.sound`. Common provenance supplies center separation/support locking only, not either open alignment field. |
| ATAIL-UROW-CAP-MULTIPLICITY-AUDIT | DONE-NEGATIVE 2026-07-13 AT CURRENT LOCAL/RELAXED SURFACE; FULL LIVE IMPLICATION CONJECTURED | ATAIL-OUTSIDE-SOURCE-BOUNDARY; exact `(4,5,6)` relaxed residual; theorem-bank and binder audit | Decide whether separate cap coverage and support-complement bounds, even with the strongest saved Euclidean residual, force ALIGN plus MULT; audit whether the pair signature retains common-system provenance. | No. The exact strictly convex Euclidean `(4,5,6)` residual has a common cap and satisfies the generic center-cap support bound, but only one dangerous `u`-row point lies outside that cap. The `(5,5,5)` finite shadow separately fails ALIGN. Neither is a live counterexample: the Euclidean residual's named Moser frame is not MEC, all-center K4 fails at eight centers, and the full no-M44/full-filter coupling is absent. The outer caller constructs all rows from one `Hcritical`, but `DoubleApexOffSurplusSharedRadiusPair` receives `rows` and `Nonempty (CriticalShellSystem D.A)` independently, losing that provenance. Restoring provenance is necessary for a common-system proof but does not supply ALIGN or MULT. Audit: `docs/audits/2026-07-13-atail-urow-cap-multiplicity-geometric-audit.md`; bounded replay: `urow_cap_multiplicity_falsifier.py --check`. URow is parked as a conditional MEC/all-center-coupling route, not promoted as the primary producer. |
| ATAIL-CRITICAL-SYSTEM-FIBER-COUNT | CHECKED-SCRATCH 2026-07-13; GENERAL COUNT PROVED, CARD-12 CAP PLACEMENT NEGATIVE | One retained `CriticalShellSystem`; exact support locking at equal centers | Package the blocker-center map, prove every fiber has card at most four, derive the image lower bound, and test the strongest generic same-cap pigeonhole at card 12. | `scratch/atail-force/critical_system_fiber_count.lean` proves `centerFiber_card_le_four`, `A.card <= 4 * centerImage.card`, at least three centers from `9 < A.card`, and at least four only from `12 < A.card`. The strongest generic same-cap theorem assumes `4 * ((A \ cap).card + 1) < A.card`; the file proves this threshold false at card 12 for cap card at most six. With complement size six, this raw capacity route first becomes numerically capable at card 29. Direct elaboration passes and printed axioms are exactly `propext`, `Classical.choice`, `Quot.sound`, with no `sorryAx`. This is a reusable incidence-design field, not the same-cap producer. |
| ATAIL-CERTIFICATE-BANK-GENERALIZATION | AUDITED 2026-07-13; GENERAL CONSUMER SCHEMA IDENTIFIED, PRODUCER ABSENT | Required sibling/legacy JSON registries; indexed Lean corpus; current ATAIL residual bank | Determine whether the banked certificates expose a reusable theorem rather than another fixed motif, and keep its role separate from live placement production. | The strongest theorem is an arbitrary-finite-row/label Gram-certificate soundness checker abstracting sibling `u5_gram_cert_checker_sound` from fixed `Fin 6` / `Fin 8`. The archived checker discharged 37,278/37,350 targeted U5 residual patterns, showing high compiler leverage. Current ATAIL patterns use five rows/twelve labels and live blocker centers, so the fixed theorem has no direct adapter. More importantly, round 20 has a positive-norm equality realization when cyclic order is omitted, proving that homogeneous Gram facts alone cannot close that residual. The second reusable object is the proven four-uniform critical-shell incidence package; its card-12 counts are slack. No bank supplies the missing live row/placement producer. Audit: `docs/audits/2026-07-13-atail-certificate-bank-generalization-audit.md`. |
| CENSUS554-CURRENT-TAIL-PATTERNS | AUDITED 2026-07-13; NO NEW REPEATED UNORDERED FAMILY | Paused 5,939-row bank; required theorem-bank registries and indexed Lean corpus | Compare rows 5,633--5,939 with the 5,632-row equality-core snapshot and current unordered theorem catalog. | The 307-row tail has 306 arbitrary-relabeling motifs, all 306 new versus the prefix, and zero hits in the original four equality-core families. Thirty-two rows minimize to four already-known perpendicular-bisector cores. Only one other unlabeled motif repeats, twice, and it matches no current unordered detector. This is deterministic read-only census evidence against selecting a new fixed unordered theorem family, not a stabilization or completeness theorem. Bank SHA-256 `02fbefc4f290458895e9ad9afbb5f7f3401f428747010ed6a47aa8479ff477b2`; full exact 142 GB replay remains `NOT_RUN`. Audit: `scratch/census-554/current_tail_pattern_audit_2026-07-13.md`. |
| ATAIL-PAIR-SECOND-CENTER-CARD-EQ-12 | DONE-NEGATIVE 2026-07-13; EXACT WITHIN FINITE INCIDENCE SHADOW ONLY | ATAIL-SAME-CAP-BOUNDARY; `CARD-EQ-12` profiles `(4,5,6)` and `(5,5,5)`; current row/cap inventory | Encode one explicit admitted placement per `CARD-EQ-12` profile with the dangerous exact row, five independent supplied rows, one exact selected row at every center, one source-indexed critical-system row at every point, blocker/no-q-free incidence, cyclic/cap constraints, and the row-witnessed negation of Q-C. | Both profiles have independently validated 29-row witnesses: `(4,5,6)` in 19 nodes, digest `ce24f3818d0b9465ef6afadced8a957065ffb7846cd62d7f1cb52c764850fa47`; `(5,5,5)` in 26 nodes, digest `d1231886198381478c2ae0120c5d444b353e0b003097cc97b10c205c98883a18`. Status is strictly `SAT_FINITE_SHADOW_ONLY`: Euclidean metric equations, strict convexity, MEC geometry, full live fields, arbitrary bisector hits, exhaustive placements, Q-A/Q-E, and card 11 are fail-closed omissions. Thus row/cap/critical-system incidence does not force even row-witnessed Q-C on these placements. Replay: `scratch/atail-force/second_center_query/query.py --check`; 5/5 tests pass. |
| ATAIL-PAIR-SECOND-CENTER-METRIC-CARD-EQ-12 | TRUSTED EXACT-CAS DONE-NEGATIVE 2026-07-13 FOR TWO SAVED SHADOWS; NONEXHAUSTIVE | ATAIL-PAIR-SECOND-CENTER-CARD-EQ-12; normalized squared-distance equality ideals | Decide whether either saved 29-row incidence witness survives even the weaker Euclidean equality equations, before adding convexity or cap inequalities; mine bounded monotone row cores for CEGAR cuts. | No. Each witness deduplicates to 12 circles / 36 quadratic equalities in 20 coordinate variables under `0=(0,0), 1=(1,0)`. Singular 4.4.1 and msolve 0.10.1 in forward and reverse variable orders all return `UNIT` over `QQ` for both profiles, excluding their normalized complex and real varieties. Cross-checked retained unit subsets have 6 rows / 18 equalities for `(4,5,6)` and 7 rows / 21 equalities for `(5,5,5)`; deletion timeouts mean they are not claimed minimal. The original oracle is trusted exact CAS and nonexhaustive; its five-row successor now has both an independently replayed rational identity and a compact kernel proof recorded in the next row. Replay and four tests: `scratch/atail-force/second_center_metric_oracle/`. |
| ATAIL-FIVE-ROW-METRIC-CORE | CHECKED-SCRATCH 2026-07-13; KERNEL CONSUMER CLOSED, PRODUCER OPEN | A `(4,5,6)` round-1 CEGAR five-row cut; theorem-bank preflight | Prove, without trusting the CAS, that the eleven effective equal-radius equations force the two distinguished labels to collide; expose the result both in generic equality-closure form and in the live `SelectedFourClass` vocabulary. | `scratch/atail-force/five_row_metric_core.lean` proves `normalized_fiveRow_metric_core_false`, the point bridge, invariant `fiveRow_metric_core_collision`, `false_of_five_selectedFourClasses`, and `not_realizes_of_fiveRowCollisionCore`. Direct elaboration passes; every printed axiom set is exactly `propext`, `Classical.choice`, `Quot.sound`, with no `sorryAx`. The independent fallback certificate replays `1 = Σ h_i g_i` over `QQ` (11/15 nonzero multipliers; 4,302 terms) and its generated Lean proof also checks. Exact twelve-family EdgeClosure audit finds no existing-bank match for this particular core. This closes the metric consumer only. The round-origin replay shows the core uses one supplied/global alias plus four global-only selected rows, so the five `CriticalSourceRows` do not instantiate it directly. |
| ATAIL-PAIR-SECOND-CENTER-METRIC-CEGAR-CARD-EQ-12 | BOUNDED DONE-NEGATIVE 2026-07-13; FIXED PLACEMENTS, NOT EXHAUSTED | ATAIL-PAIR-SECOND-CENTER-METRIC-CARD-EQ-12; cross-checked exact ideal oracle; monotone unit cuts | Repeatedly request a new incidence shadow at each saved placement, reject a shadow only with a three-engine `UNIT` row subset, and stop honestly at the declared round budget, exhaustion, a nonunit candidate, or oracle uncertainty. | Hash-bound resume reaches 64 rounds per profile. All 128 proposed full ideals and all 128 learned cuts replay as `CROSSCHECKED_UNIT`; `(4,5,6)` uses 5--8-row cuts and at most 4,644 incidence nodes, `(5,5,5)` uses 5--9-row cuts and at most 4,380 nodes. Both stop at `STOPPED_ROUND_BUDGET`, not exhaustion; no nonunit candidate appears. A repeated `(5,5,5)` five-row type at rounds 40/62 matches the existing `SixPointCircleChainCollisionCore` under a unique role assignment, but the exact row-origin audit finds 0/64 cuts in either profile whose every row aliases a supplied source row. Thus theorem consumers are available while selected-K4/global-row incidence production remains open. Checkpoint SHA-256 `e6304b556ec3645c3ca541df0d63313d67f4a4c556f59e420e3ce387737f1e9a`; stable eight-round review checkpoint is preserved. |
| ATAIL-COMMON-SYSTEM-METRIC-CEGAR-CARD-EQ-12 | BOUNDED STRUCTURAL CHECKPOINT 2026-07-13; CONSUMERS ADVANCING, COVERAGE OPEN | One finite common-system row per source; supplied exact rows; Q-C negation; strict cyclic order | Remove the global-row-at-every-center assumption, learn only kernel-backed monotone metric cuts, and stop at the first uncovered equality survivor. | The arc-overtake and five-row circle-intersection matchers rewrite the deterministic `(5,5,5)` history: the clean replay now accepts 6 cuts for `(4,5,6)` and 21 for `(5,5,5)`. Arc-overtake supplies six three-row cuts at rounds 10--15; exact-off-circle closes 16--17, nested equal chords close round 18, and the five-row consumer closes 19--20. The first uncovered survivor is round 21, digest `2854f002...fb82ec`, with rows `0:{1,2,3,4}`, `1:{0,2,6,7}`, `2:{3,8,9,10}`, `3:{1,5,6,8}`, `4:{1,2,9,11}` and fail-closed oracle `[NONUNIT,NONUNIT,NONUNIT]`. The `(4,5,6)` round-6 survivor remains `268f0efa...ba89f9`. Current checkpoint SHA-256 is `1c8c943281998453a17b6063bff59efa19cff4363343b08f9ffe49bb64f873d0`; the pre-arc archive is preserved at `fcb0b93588ad95dac43aa2a1bf1364d5f7a3a24cc5cb5f15739c8541cd11ca09`. These exact-card shadows neither prove production nor raise the `CARD-GE-12` threshold. |
| ATAIL-SEVEN-POINT-SIX-CIRCLE-B-CORE | PROVEN; PRODUCTION TARGET BUILT 2026-07-14; BOUNDED FRONTIER ADVANCE ONLY | `CARD-EQ-12` 46-shard formalized-core frontier; shard-15 three-engine UNIT core; theorem-bank preflight | Turn the next eleven-equality seven-label residual into a kernel-checked no-realization theorem, integrate its monotone detector, and measure its exact effect without claiming coverage. | `Census554/SevenPointSixCircleCollisionB.lean` proves the generic collision and `SevenPointSixCircleCollisionCoreB` consumer from an exact rational UNIT certificate split into 26 buildable summand modules. The focused certificate, wrapper, and `GeneralCarrierBridge` targets build; the aggregate axiom audit is exactly `propext`, `Classical.choice`, and `Quot.sound`. Incremental refresh reuses 45 shards and reruns only stale shard 15: the new family rejects nine branches, but the later survivor remains `SAT_FINITE_SHADOW_ONLY`, so all 46 shards remain open. The refreshed exact oracle classifies 44/46 normalized equality ideals as no complex or real realization; shards 12 and 19 remain fail-closed because Singular times out even though both msolve orders return UNIT. Checkpoint SHA-256 `cbe6dcf835203b930f61223101ed9504653852efde599190a84da9a3460204d9`; oracle SHA-256 `3962fd952661524de566e35cdf7d5659913c5e33bd654c63927653f115c6c4e7`. This banks one reusable consumer, closes no shard, proves no producer/cover theorem, and closes zero named on-spine `sorry` declarations. |
| ATAIL-FIVE-ROW-CIRCLE-INTERSECTION-ORDER-CORE | PROVEN; PRODUCTION TARGET BUILT 2026-07-14; BOUNDED FRONTIER ADVANCE ONLY | Round-19 five-row scalar/geometry proof; theorem-bank preflight; 46-shard `CARD-EQ-12` checkpoint | Move the order obstruction into production modules, expose positive/reflected arbitrary-carrier consumers, register both ordered detector orientations, and remeasure the frontier. | `CircleIntersectionInequalityCore`, `FiveRowCircleIntersectionGeometry`, and `FiveRowCircleIntersectionOrderCore` target-build; `GeneralCarrierBridge` consumes the core in both orientations, and the aggregate axiom audit is exactly `propext`, `Classical.choice`, and `Quot.sound`. The structural oracle now has 23 families, 22 raw-cube-eligible, through 26 detector stages. The matcher invalidates 12 saved first survivors, but every shard has a later survivor; retrying shard index 24 at a one-million-node cap finds `SAT` at 108,537 nodes, leaving all 46 `SAT_FINITE_SHADOW_ONLY`. Trusted exact CAS excludes normalized complex or real equality realizations for 45/46 final survivors; shard index 19 remains `UNDECIDED_FAIL_CLOSED` because Singular times out while both msolve orders return `UNIT`. Frontier SHA-256 `7b5736a36506bf234d87b52b638b6b8c9d32f77985e170255ca52267d6651fec`; oracle SHA-256 `6b2b67726d383b949f8bf6a248fecc5496877a8439d3b9d4bb48483bde4c1acd`. This closes no shard, no producer/cover theorem, and no named on-spine `sorry`. |
| ATAIL-MEC-STRADDLING-ROW-CORE | PROVEN; PRODUCTION TARGET BUILT 2026-07-13 | `(4,5,6)` common-system round-5 residual; Moser circumdisk; nonobtuse triangle; cyclic order | Prove that a circle through one Moser boundary point cannot have two in-disk same-radius points on opposite sides of its center ray under the inherited five equal-distance relations. | `Census554/MECStraddlingRowCore.lean` proves the scalar power-sign contradiction, generic metric theorem and reflection, `Core`, `Geometry`/`NegativeGeometry`, and `false_of_core` consumers. The residual map is `o=0,a=1,p=2,s=3,x=10,y=7`; three rows give `oa=ap=os=sx=sy`, while live MEC/nonobtuse/order supplies the rest. Target build succeeds; public axiom audits are exactly `propext`, `Classical.choice`, and `Quot.sound`, with no `sorryAx`. It closes this metric/MEC consumer, not the universal row/placement producer. |
| ATAIL-SIX-POINT-TWO-CIRCLE-CORE | PROVEN; PRODUCTION TARGET BUILT 2026-07-13 | `(5,5,5)` common-system four-row residual; theorem-bank preflight; cyclic order | Prove the six-label obstruction `AB=AC=AD=BC`, `CD=CP`, `DA=DQ` in cyclic order `A,P,Q,B,D,C`, and expose generic equality-closure consumers. | `Census554/SixPointTwoCircleOrderCore.lean` proves the normalized scalar theorem, generic point theorem, `Core`, `false_of_core`, and reflected `false_of_core_of_neg`. The residual map is `A=0,P=9,Q=11,B=1,D=3,C=2`; five EdgeClosures and seven order signs suffice. No exact-row exclusions or other six labels are used. Target build succeeds; every public axiom set is exactly `propext`, `Classical.choice`, and `Quot.sound`, with no `sorry`/`admit`. The consumer is closed; a producer or deterministic structural matcher must supply the closures/order signs. |
| ATAIL-SIX-POINT-NESTED-CENTER-CORE | PROVEN; PRODUCTION TARGET BUILT 2026-07-13 | `(5,5,5)` common-system round-14 residual; theorem-bank preflight; cyclic order | Prove the six-label nested-center obstruction used by rounds 14--16 and expose generic equality-closure consumers. | `Census554/SixPointNestedCenterOrderCore.lean` uses `(O,A,D,E,X,C)=(0,1,3,4,5,2)`, four rows, and five cyclic signs to derive a normalized determinant contradiction. Its metric theorem, `EdgeClosure` core, reflected consumer, and actual GeneralCarrier adapter target-build with only `propext`, `Classical.choice`, and `Quot.sound`; no `sorry`/`admit`. The integrated matcher closes rounds 14--16. |
| ATAIL-SIX-POINT-CIRCLE-CHAIN-ORDER-CORE | PROVEN; PRODUCTION TARGET BUILT 2026-07-13 | `(5,5,5)` common-system round-17 residual; theorem-bank preflight; cyclic order | Prove the five-row six-label circle-chain obstruction exposed after the nested-center cuts. | `Census554/SixPointCircleChainOrderCore.lean` uses `(O,A,D,E,C,Y)=(0,1,3,4,2,8)`, the closures `OA=OC=AC=OD=OE`, `DA=DE`, `EA=EC=EY`, `CD=CY`, and signs `OAC,OAE,OAD,CYO`. Production and reflected consumers plus the actual GeneralCarrier adapter target-build with only `propext`, `Classical.choice`, and `Quot.sound`; no `sorry`/`admit`. The matcher closes round 17 and exposes the honest round-18 survivor. |
| ATAIL-SIX-POINT-CIRCLE-CHAIN-WRAP-ORDER-CORE | CHECKED-SCRATCH; PROVEN 2026-07-13 | `(5,5,5)` common-system rounds 18--19; theorem-bank preflight; cyclic wrap order | Prove that the same eight circle-chain closures are impossible in cyclic order `O,Y,A,D,E,C`, and expose positive/reflected equality-closure consumers plus an actual carrier adapter. | `scratch/atail-force/six_point_circle_chain_wrap_order_core.lean` derives the scalar polynomial `-4*g^2 + (8*h*t+4*t-4)*g + (12*h*t-8*h+6*t-5)=0`, whose terms are all negative in the normalized sign region. Its generic metric theorem and both `EdgeClosure` consumers elaborate cleanly; `residual_555_round18_general_carrier_adapter.lean` supplies the actual carrier lift. All six audited endpoints have exactly `propext`, `Classical.choice`, `Quot.sound` and no `sorryAx`. The deterministic matcher closes rounds 18 and 19. This is a consumer, not live row production. |
| ATAIL-SEVEN-POINT-SPLIT-BRIDGE-ORDER-CORE | CHECKED-SCRATCH; CERTIFIED / PASS 2026-07-13 | `(5,5,5)` common-system rounds 20--22; cyclic order; theorem-bank preflight | Prove the seven-label split-bridge obstruction, its reflected `EdgeClosure` consumer, carrier adapter, and monotone matcher. | `seven_point_split_bridge_order_core.lean` proves the normalized bounds, generic metric contradiction, equality-closure core, and positive/reflected consumers. `residual_555_round20_general_carrier_adapter.lean` extracts the exact nine closures from fourteen row memberships and the negative orientation from cyclic subsequence `O,A,D,E,C`. All six audited endpoints elaborate with exactly `propext`, `Classical.choice`, `Quot.sound`; source and antecedent audit is `CERTIFIED / PASS`, with no `sorry`, `admit`, named axiom, or `sorryAx`. The matcher closes rounds 20--22 with one spine and `W=8,9,10`. An explicit positive-norm wrong-order realization proves homogeneous equality-only Gram certificates cannot replace the order argument. This closes the bounded consumer/adapter, not live row production. |
| ATAIL-SIX-POINT-ARC-OVERTAKE-ORDER-CORE | CHECKED-SCRATCH; PROVEN 2026-07-13 | Archived `(5,5,5)` rounds 10--28; three selected rows; cyclic order | Prove the general obstruction `OA=OC=AC=OD=OE`, `DA=DE=DF` in cyclic order `O,A,D,E,F,C`, with positive/reflected `EdgeClosure` consumers and an arbitrary-carrier adapter. | `six_point_two_circle_arc_overtake_order_core.lean` and `residual_555_round28_general_carrier_adapter.lean` kernel-check with exactly `propext`, `Classical.choice`, and `Quot.sound`. The adapter uses nine memberships in rows centered at `O,A,D`. The archived checkpoint has exact forward coverage of rounds 10--28, none at 0--9 and no reverse matches; monotone integration compresses that suffix to six new cuts at rounds 10--15. This closes the reusable consumer, not live incidence production. |
| ATAIL-LIVE-ARC-OVERTAKE-PRODUCER | CHECKED-SCRATCH INTERFACE; OPEN FORCING LEMMA | Existing five-row pair surface; dangerous p-row; one critical p-source row; supplied u-row; boundary order | Produce a dangerous permutation `{A,C,D,E}={q,t1,t2,t3}` such that the u-row is centered at `D` and contains `A,E`, a critical p-source row is centered at `A` and contains `C`, and the boundary order is `p,A,D,E,u,C`; or immediately produce an already-consumed alternate. | `live_arc_overtake_producer.lean` proves both the minimal existing-surface theorem and a stronger common-system fiber-collision corollary. They preserve the three rows in one `FaithfulCarrierPattern` and invoke the arc consumer; both have only the standard core axioms and no `sorryAx`. Round 19 avoids the packet exactly by letting the u-row meet the dangerous base in only one point. The remaining theorem must force the aligned second dangerous hit/order from MEC/cap/full-filter/no-M44. More blind rounds are not the closure plan. |
| ATAIL-STAGE1-ALIGNED-INCIDENCE | CHECKED-SCRATCH BOUNDARY; INCIDENCE-ONLY ROUTE DONE-NEGATIVE; LIVE FORCING OPEN | Live/pair hypotheses; common-system provenance; exact-filter incidence; dangerous class | Formalize the exact producer packet before cyclic order and decide whether common provenance plus current incidence consequences force it. | `stage1_aligned_incidence_boundary.lean` defines `LiveArcOvertakeStageOneFields`, proves its u-row intersection with the dangerous base has card exactly two, and reconstructs `LiveArcOvertakeFields` once cyclic order is supplied. `stage1_one_hit_incidence_countermodel.lean` kernel-checks a `Fin 12` common-provenance shadow with support-card-four, source membership, center exclusion, same-center rigidity, distinct-center intersection at most two, p-critical A/C alignment, and u-center D alignment, but exactly one dangerous u-row hit. Thus Stage I must visibly use omitted metric/MEC/cap/no-M44 geometry or a named alternate. Both files are sorry-free with only standard core axioms. Assessment: `scratch/atail-force/stage1_aligned_incidence_assessment_2026-07-13.md`. |
| ATAIL-STAGE1-COMMON-CAP-ALIGN | CHECKED-SCRATCH DICHOTOMY; CURRENT CAP/INCIDENCE ROUTE DONE-NEGATIVE | Actual `leafSurplusPacket`; dangerous center `p`; live `uRow.center`; individual cap coverage | Prove one cap contains both centers, or isolate the exact failure packet. | `stage1_common_cap_alignment_boundary.lean` proves an actual K-A-PAIR leaf dichotomy between alignment and `URowSeparatedCapPlacement`; `stage1_common_cap_incidence_countermodel.lean` realizes the separated branch in a `Fin 12` `(5,5,5)` model retaining cap sum/coverage/intersections, card-four rows, dangerous-center localization, and both complement bounds. All endpoints are core-axiom-only. The missing positive ingredient is `not URowSeparatedCapPlacement` from MEC/full-filter/all-center-K4/no-M44 geometry, or a map from that packet to a named consumed alternate. Assessment: `scratch/atail-force/stage1_common_cap_alignment_assessment_2026-07-13.md`. |
| ATAIL-STAGE1-CAP-CONFINEMENT | CHECKED-SCRATCH DICHOTOMY; CAP-COUNT ROUTE DONE-NEGATIVE | Common cap containing `p` and `uRow.center`; exact live `uRow`; ordered-cap outside-pair uniqueness | Confine every off-dangerous `uRow` point to the common cap, or classify the exact escape into a consumed obstruction. | `stage1_common_cap_confinement_boundary.lean` upgrades failed confinement to `URowOffDangerousSeparatedPairFields`: two outside row points have equal distance from `uRow.center` but unequal distances from `p`; equality at `p` is already killed by `outsidePair_unique_capCenter`. A `Fin 12` shadow retains every current local count plus common-cap placement while confinement fails and dangerous multiplicity is one. All endpoints are core-axiom-only. The missing theorem is a classifier from this separated pair into an existing MEC/nested/order consumer. Assessment: `scratch/atail-force/stage1_common_cap_confinement_assessment_2026-07-13.md`. |
| ATAIL-STAGE1-SEPARATED-CAP-GEOMETRY | CHECKED-SCRATCH SHARP FRONTIER; POSITIVE EXCLUSION OPEN | `URowSeparatedCapPlacement`; actual surplus caps; global K4; exact full filters | Consume all routine cap geometry and state the remaining separated-placement cases. | `stage1_separated_cap_geometry_boundary.lean` proves separated centers are either strict interiors of distinct caps or an opposite-Moser endpoint packet; two Moser vertices always share a cap. The endpoint packet is now cap-cardinality-free: `selectedClass_capInteriorByIndex_card_ge_two` produces two distinct facing-cap interior points in the exact four-point radius filter, and both outer Moser endpoints have unequal distances to that pair. The former short/large-cap split is superseded; there is no large-cap escape. The exact leaf adapter and final ALIGN interface consume the sharp frontier with core axioms only. Remaining geometry: exclude the distinct-interior packet and the endpoint exact-filter interior-pair packet by producing genuinely new cross-row metric incidence. Assessment: `scratch/atail-force/stage1_separated_cap_geometry_assessment_2026-07-13.md`. |
| ATAIL-STAGE1-SEPARATED-PAIR-CLASSIFIER | CHECKED-SCRATCH FRONTIER; ADDITIONAL-BISECTOR-CENTER PRODUCER OPEN | `URowOffDangerousSeparatedPairFields`; exact full shell; global convex order | Refine the separated pair and map it to a named consumed obstruction. | `stage1_separated_pair_classifier_boundary.lean` proves exact full-circle support, that `uRow.center` is the unique common-cap point equidistant from the outside pair, and a retained global boundary block containing both centers while both pair points lie outside. Its smallest checked consumed alternate uses two additional carrier centers on the same perpendicular bisector; with `uRow.center`, Dumitrescu's bound gives `False`. Current data produces neither additional center. MEC/nested/five-row consumers first miss their cross-row equality chains. Assessment: `scratch/atail-force/stage1_separated_pair_classifier_assessment_2026-07-13.md`. |
| ATAIL-STAGE1-BISECTOR-PRODUCER | CHECKED-SCRATCH EXACT INTERFACE; RECIPROCAL INCIDENCE AND COLLISION EXCLUSION OPEN | ATAIL-STAGE1-SEPARATED-PAIR-CLASSIFIER; one actual `CriticalShellSystem` | Reduce the two additional bisector centers to the smallest source-specialized critical-row facts and classify the center-collision complement. | `stage1_bisector_producer_boundary.lean` proves that the rows sourced at the escaped points `z,w` already provide the diagonal incidences. The direct-closing fields are exactly `w ∈ H.row(z)`, `z ∈ H.row(w)`, and pairwise distinctness of `uRow.center`, `H.centerAt(z)`, and `H.centerAt(w)`. These instantiate the checked triple-bisector alternate and close by Dumitrescu; `confinement_of_mutualCriticalSourceBisectorProducer` is the one-call return to the same-cap sink. Reciprocal incidence alone forces one of the three blocker-center collisions, and exact same-center rigidity upgrades it to equality of the corresponding complete supports. Any genuinely new bisector center lies outside the common cap. All endpoints have only the standard core axioms. Assessment: `scratch/atail-force/stage1_bisector_producer_assessment_2026-07-13.md`. |
| ATAIL-STAGE1-THREE-POINT-SINK | CHECKED-SCRATCH 2026-07-14; CORE-AXIOM CLEAN; EQUALITY PRODUCER OPEN | Required theorem-bank registries; `U3FixedTriplePacket`; `eq_of_equidistant_three_noncollinear` | Reduce either sharp separated-cap arm to the smallest uniform metric packet at `c := rows.uRow.center`. | `stage1_three_dangerous_equidistant_sink.lean` contains both the `t1,t2,t3` form and the preferred `q,t1,t3` form: `p ≠ c` plus `dist c q = dist c t1` and `dist c q = dist c t3` implies `False`; exact-shell membership specializations are included. A fresh complete direct-file check exits 0, and all four printed endpoints have exactly `propext`, `Classical.choice`, and `Quot.sound`. The required-bank audit found no direct packet consumer stronger than this current-tree radical-axis theorem. Common-system provenance supplies neither equality. The exact 33-point checker `stage1_dangerous_equality_euclidean_countermodel_2026-07-14.py` passes with global K4, every deletion breaking K4, exact full filters, localized/fixed/live field shapes, and one common blocker system, while the squared distances at `c` are `36,34,32,26`. It is non-convex and therefore not a K-A-PAIR counterexample: the coupled convex/MEC/Moser/cap/no-M44 layer is precisely what remains. Validation: `stage1_scratch_validation_2026-07-14.md`; audits: `stage1_bank_packet_reuse_2026-07-14.md` and `stage1_dangerous_equality_producer_attempt_2026-07-14.md`. |
| ATAIL-STAGE1-CRITICAL-MAP-CAPACITY | CHECKED-SCRATCH 2026-07-14; CORE-AXIOM CLEAN; COUNTING ROUTE DONE-NEGATIVE | One actual `CriticalShellSystem`; ordered-cap selected-row bound; strengthened card-12 shadows | Quantify the strongest cap-local consequence of support locking before asking for reciprocal incidence or a same-cap second center. | `stage1_critical_map_geometry_2026-07-14.lean` proves source-fiber capacity two for a blocker center inside an indexed cap and four outside, hence `|cap sources| ≤ 2|inside image| + 4|outside image|`; with at most one inside center this gives `|cap| ≤ 2 + 4|A \ cap|`. A fresh full-file check exits 0; all five printed endpoints have only standard core axioms. At card 12 and cap sizes 4--6 the capacities are 34, 30, and 26, so the threshold is arithmetically far from firing. The exact finite-shadow replay and ten mutation/checkpoint tests pass; an inside fiber of size two occurs, while one-inside-center shadows still have joint apex fiber at most one. These are exact only within the encoded abstraction and are not Euclidean counterexamples. This result gives no reason to raise or re-adjudicate beyond `CARD-GE-12`; missing metric/order coupling, not cardinality, remains load-bearing. Validation: `stage1_scratch_validation_2026-07-14.md`; assessment: `stage1_critical_map_geometry_assessment_2026-07-14.md`. |
| ATAIL-STAGE1-COUPLED-FIRST-FIELD | AUDITED OPEN-PROOF 2026-07-14; NO PRODUCER ADDED | Sharp separated-cap arms; common `CriticalShellSystem`; required theorem-bank preflight | Identify the first cross-row field that can actually enter a checked contradiction consumer. | On the distinct-interior arm the target `dist c q = dist c t1` is exactly a perpendicular-bisector boundary; current cap order gives neither required sign, and the closest ordered theorem has strict-inequality polarity. On the endpoint arm a literal incidence sourced at localized `t2` or `u` repeats the already-known endpoint center and cannot feed the three-center sink. The first consumable field is `y ∈ H.selectedAt x` together with `H.centerAt x ≠ c0`; symmetric incidence and another distinct center remain downstream. Short-cap outputs `c ∈ B` or `p ∈ R` have no current consumer. No current banked/live theorem produces the useful field. Assessment: `scratch/atail-force/stage1_coupled_geometry_first_field_assessment_2026-07-14.md`. |
| ATAIL-STAGE1-SHORT-CAP-ONE-EQUALITY | DONE-NEGATIVE AS A PRODUCER; CONDITIONAL TERMINAL ONLY 2026-07-14 | Short non-surplus cap selector; joint-fiber injectivity; required theorem-bank preflight | Preserve the fixed-witness equality as an internal contradiction terminal; do not dispatch it as a producer. | The selector fixes a distinct off-surplus pair co-radial at one apex, while equality at the other apex is already refuted by the joint-fiber theorem. Thus proving the last equality has proved the whole branch inconsistent. This specialization is a regression/terminal interface inside the parent classifier and does not cover the large-facing-cap arm. |
| ATAIL-STAGE1-APEX-ALIGNED-TWO-HIT | DONE-NEGATIVE AS A PRODUCER TARGET 2026-07-14 | Three-point off-surplus first-apex marginal; one actual common `CriticalShellSystem`; joint-fiber sink | Preserve the exact compatibility condition and its missing fields; do not dispatch it as the theorem target. | `ApexAlignedTwoHit` would immediately construct the already-forbidden joint-fiber pair, so proving it has already proved the branch inconsistent. No current theorem pins a blocker center to the other apex. Use this only as a regression/terminal interface inside the parent direct contradiction. Assessment: `scratch/atail-force/apex_filters/joint_fiber_functional_producer_assessment_2026-07-14.md`. |
| ATAIL-STAGE1-PRESCRIBED-APEX-DELETION | DONE-NORMAL-FORM; INTERMEDIATE PRODUCER RETIRED 2026-07-14 | Three-point off-surplus apex marginal; prescribed-center deletion split; cap one-hit bank | Consume a deletion failure immediately at its existing equality sink; send the survival complement to the parent robust classifier. | Checked scratch proves the blocked-source and double-deletion normal forms with only the core axioms. The survival flip cycles when prior erasures are forgotten, and the crossed-small-row branch is locally realizable. Do not launch a same-radius or deletion-failure producer from this row. |
| ATAIL-R19-MEC-SCALAR-CORE | CHECKED-SCRATCH; FULL FIVE-ROW CONSUMER AND CARRIER REGISTRATION DONE | Round-19 exact rows and saved cyclic order | Prove the three necessary circle-intersection lower inequalities incompatible and lift the result through the actual five row equalities and both boundary orientations. | `residual_555_round19_mec_scalar_core.lean` proves the scalar forms and rigorous bound `tau < -4/25`; `residual_555_round19_mec_geometry_lift.lean` proves positive and reflected metric endpoints. `residual_555_round19_five_row_order_core.lean` packages the ten equality closures, and `residual_555_round19_general_carrier_adapter.lean` consumes five carrier rows plus cyclic `O,A,D,E,C`. MEC, nonobtuse, and disk hypotheses are unnecessary. All endpoints have exactly `propext`, `Classical.choice`, and `Quot.sound`; there is no `sorryAx`. The registered monotone matcher closes rounds 19 and 20 with five-row cuts; 33 tests and deterministic replay pass. Integration map: `scratch/atail-force/residual_555_round19_integration_map.md`. |
| ATAIL-NESTED-GLOBAL-PAIR-PRODUCER | CHECKED INTERFACE; OPEN FOUR-MEMBERSHIP PRODUCER | `NestedEqualChordCore`; actual `FaithfulCarrierPattern`, `CriticalShellSystem`, and `BoundaryIndexing` | For one critical blocker row canonically enumerated `o,a,b,c,d` in boundary order, force `o,d ∈ rowPattern F a` and `o,c ∈ rowPattern F b`. | `nested_equal_chord_live_producer.lean` proves `orderedBlockerRow`, so the cyclic-order datum is automatic. `HasGlobalNestedPairProducer` packages exactly the four global-row memberships and `false_of_hasGlobalNestedPairProducer` closes immediately. All printed axioms are `propext`, `Classical.choice`, and `Quot.sound`, with no `sorryAx`. Global rows at `a,b` already exist; no additional critical sources or blocker-center alignment fields are needed. Producing the four lower-bound incidences from live MEC/global-K4/cap/full-filter data remains open. |
| ATAIL-456-ONE-GLOBAL-ROW | DONE-NEGATIVE 2026-07-13; EXACT FINITE CANDIDATE ENUMERATION, BOUNDED ORACLE FOLLOW-UP | Exact `(4,5,6)` four-row residual; current selected-K4 candidate frame; existing formalized core bank | Test whether restoring one global selected-four row at any missing center 4--11 already forces an existing kernel-backed obstruction. | No. Complete candidate enumeration leaves 174, 148, 176, 128, 161, 161, 139, and 139 formalized-core survivors at centers 4 through 11 respectively. Each center has a selected row whose normalized equality ideal is `NONUNIT` in both msolve variable orders; Singular agrees for centers 6--11 and times out for 4--5. The added row is correctly non-exact. This does not prove a real convex or target-faithful extension, but it rules out the one-center/current-bank proof plan. The next useful layer is two coupled global rows targeting `GlobalNestedPairFields`, or MEC first. |
| ATAIL-456-NESTED-PAIR-CENSUS | DONE-NEGATIVE 2026-07-13; EXACT WITHIN SAVED PLACEMENT ONLY | `ATAIL-NESTED-GLOBAL-PAIR-PRODUCER`; saved `(4,5,6)` placement and blocker map; current candidate frame | Decide whether bare global-K4 incidence admits the four `GlobalNestedPairFields` memberships for any critical source in the saved placement. | Zero witnesses across all twelve sources. The blocker-center 0, 1, and 3 patterns conflict with locked exact rows. The only unlocked center-2 pattern requires a center-7 row containing `{1,2}`; all 15 locally admissible candidates are killed by six `DuplicateCenterCore` and nine `ExactOffCircleCore` instances, so no equality oracle is invoked. This does not decide other placements, profiles, card 11, or the live theorem. It shows that MEC/cap/full-filter geometry must exclude or reconfigure this placement rather than expecting global K4 incidence alone to force the nested-pair producer here. |
| ATAIL-CARD-EQ-12-PLACEMENT-SURFACE | EXACT PLACEMENT-LEVEL CENSUS 2026-07-13; ROW/METRIC COVERAGE ABSENT | Current `CARD-EQ-12` placement preconditions for `(4,5,6)` and `(5,5,5)` | Enumerate every admitted named placement and quotient only by verified size-preserving carrier automorphisms, before deciding whether per-placement row-system search is tractable. | Independent tuple-first re-enumeration validates 253,302 raw/orbit representatives for `(4,5,6)` (identity stabilizer only) and 683,424 raw placements / 113,904 six-element orbits for `(5,5,5)`: 936,726 raw and 367,206 representatives total. Burnside counts, group action, candidate-domain invariance, representative minimality, and both saved seeds replay; six tests pass. This is strictly `EXACT_PLACEMENT_SURFACE_ONLY`: it checks no row-system existence, metric realization, target faithfulness, producer, or card 11. The size rules out naive per-representative CAS CEGAR as the closure plan. |
| ATAIL-TRIPLE-RELABEL | DONE-PRODUCTION-WIRING 2026-07-14; DEPENDS TRANSITIVELY ON K-A-PAIR | ATAIL-SIXTH-ROW-COUPLING; symmetry of `{t1,t2,t3}` | Transport the fixed-triple, five rows, live data, and base-pairwise packet so an `f2=t1` or `f2=t3` collision becomes the existing dangerous `t2`-row pair consumer. | Both T1 and T3 adapters are production-wired through all 24 helpers, removing 48 direct holes. The focused target build passes. Both intentionally inherit K-A-PAIR's `sorryAx` and are dependency reductions, not kernel closure. LIVE-Q and LIVE-C remain separate. |
| ATAIL-FIVE-ROW-UNIT-SYNTHESIS | EXACT QQ FIXED-SHADOW SYNTHESIS; FOUR DISTINCT SCHEMAS 2026-07-14 | Four five-row subsets from the unmatched extended `(4,5,6)` shards | Minimize and cross-match the smallest exact UNIT subsystems before choosing a new Lean consumer. | Eight deterministic deletion orders retain 9, 7, 9, and 11 equality generators. Every result is UNIT in Singular and msolve in both variable orders. Exhaustive role assignment with aliasing allowed except at the two conclusion anchors gives a diagonal-only four-by-four coverage matrix: no one concrete motif covers another. All share an equilateral hinge normalization, but their tail contradictions are distinct. The smallest possible new consumer is the seven-equality five-point hinge-cycle collision; promoting it alone would not produce a live packet or close K-A. |
| ATAIL-FIVE-ROW-HINGE-KERNELS | DONE-PRODUCTION CONSUMERS 2026-07-14; LIVE PRODUCER OPEN | ATAIL-FIVE-ROW-UNIT-SYNTHESIS | Prove and package the shared hinge normalization and four distinct 7/9/9/11-equality collision tails without trusting the discovery CAS. | `Census554/EquilateralHingeCollisions.lean` production-builds the four uniform Euclidean collisions, abstract `EdgeClosure` Core structures, and `false_of_*Core` consumers. The fresh focused build passes 8,055 jobs; ten public endpoints have exactly `propext`, `Classical.choice`, and `Quot.sound`; source safety is clean. The exact role adapters and 34 matcher tests pass, and all five saved SAT shadows from the first eight-way run now classify by production consumers. This completes the metric-consumer side, not the live geometry-to-Core producer; three shards were node-capped. |
| ATAIL-EIGHT-SINK-RERUN | BOUNDED DISCOVERY: 1 SAT / 7 INDETERMINATE / 0 EXHAUSTED 2026-07-14 | Four ordered production sinks plus four hinge collision sinks | Re-run the eight `(4,5,6)` shards with every current sink matcher at complete leaves. | Corrected 100,000-node/shard run checks hinge, nested, SixPointTwoCircleOrder forward/reverse, FourPoint forward/reverse, and ArcOvertake forward/reverse. It ends with one SAT row shadow at shard 6 / 60,854 nodes, seven `INDETERMINATE_NODE_CAP` shards at 100,001 each, zero exhausted shards, and 760,861 nodes total. A provisional run omitting SixPointTwoCircleOrder was discarded. SAT here is finite combinatorial compatibility only, not Euclidean realizability or a K-A counterexample. |
| ATAIL-GLOBAL-PRODUCER-CONTRACT | CHECKED-SCRATCH ALL-EIGHT CONSUMER; LIVE PRODUCER OPEN 2026-07-14 | Four ordered production sinks plus four equilateral-hinge collision sinks | Return one current production Core branch; the smallest branch is two arbitrary `EdgeClosure` paths for a shared pair plus cyclic order `q,u,y,v`. | `global-producer-contract/Contract.lean` kernel-checks the ordered-only four-way disjunction, the all-current eight-way `ProductionCoreAlternative`, and the smaller FourPoint closure consumer with core axioms only. The natural active blocker cannot supply the FourPoint continuation: cross membership forces opposite-side placement and cross survival forces unequal distances. Thus the first missing packet is an off-frontier nonalternating shared-pair continuation, or one of the other seven cores. The corrected finite query still has one SAT shadow and seven capped shards, so row-only coverage is not proved. |
| ATAIL-OFF-FRONTIER-CONTINUATION | FULL-LIVE ADAPTER CHECKED; POSITIVE TWO-HIT OPEN 2026-07-14 | ATAIL-GLOBAL-PRODUCER-CONTRACT; actual `hfixed`, live row, `D.K4`, convexity, and `CriticalShellSystem` | Construct the faithful global system and force an off-frontier exact row to share two dangerous points in the forbidden nonalternating placement. | `off-frontier-continuation/OffFrontierContinuation.lean` kernel-constructs the source `u`, blocker `v != p`, faithful system pinned to `{q,t1,t2,t3}`, and exact blocker row. Thus provenance and system construction are solved. The first missing field is `2 <= |{q,t1,t2,t3} ∩ selectedAt(u).support|`; the matching upper bound is already proved, after which cap/order must force nonalternation. A checked `Fin 12` `(5,5,5)` shadow has all cap cardinalities, one row per center, common blocker provenance, and intersection bounds but only one dangerous hit for every off-frontier source. Metric/MEC/exact-filter geometry is therefore load-bearing. |
| ATAIL-OFF-FRONTIER-TWO-HIT-GEOMETRY | EXACT EUCLIDEAN SELECTION COUNTERMODEL; CONVEX/MEC BRIDGE OPEN 2026-07-14 | ATAIL-OFF-FRONTIER-CONTINUATION; full exact filters and global K4 fragment | Decide whether exact Euclidean/global-K4/deletion/common-selector data force the positive two-hit. | No. A pinned 33-point integer carrier has global K4, every deletion breaks global K4, exact four-point full filters, and a legal common selector whose 29 off-p rows have dangerous-hit histogram 27 zero / 2 one. The same carrier admits a different legal two-hit shell, so the field is selector-sensitive. The carrier is nonconvex and lacks MEC/cap/noM44, hence is not a K-A counterexample. No imported theorem forces the lower bound. The best bank-facing route needs blocker-center Moser-apex alignment plus dangerous-row alignment with at least two opposite-cap-interior points, or a direct adaptive critical-shell multiplicity theorem. |
| ATAIL-ENDPOINT-CONTINUATION | DONE-NEGATIVE FOR INCIDENCE/ORDER SURFACE; FULL-GEOMETRIC PRODUCER OPEN 2026-07-14 | `CriticalShellSystem`; `BoundaryIndexing`; exact `(4,5,6)` residual | Force endpoint support or a well-founded strict cross-cap advance along blocker iteration. | `endpoint-continuation/finite_countermodel.lean` kernel-checks a `Fin 13` interior three-cycle satisfying the row-cardinality, center-exclusion, pairwise-intersection, blocker-source, boundary, and cap-order interface while every cycle row omits both endpoints. The exact biquadratic `(4,5,6)` residual separately realizes an endpoint blocker whose row omits both endpoints. Therefore endpoint landing must be an explicit branch, and strict advance must carry a global lift/rank or produced `StrictLapPacket`; shell/boundary incidence alone cannot supply it. The remaining producer must visibly consume MEC, full all-center K4, minor-cap structure, or equivalent geometry. |
| ATAIL-ENDPOINT-BLOCKER-GEOMETRY | CARD-FIVE ENDPOINTS EXCLUDED; CARD-FOUR SELECTOR TARGET REFUTED 2026-07-14 | ATAIL-ENDPOINT-CONTINUATION; production frontier; hNoM44 | Decide whether actual blockers can land on surplus endpoints and whether landing is a terminal. | Kernel Lean proves both card-five blockers differ from both endpoints. In card four, `oppApex1` is an exact deletion-critical blocker for both sources; double `overrideAt` constructs a valid critical system choosing it twice even accepting full conditional hNoM44. Endpoint landing normalizes to directed cross hits and, twice, to the existing common-blocker/mutual-hit branch. An exact 12-point strict-convex nonobtuse-MEC local model realizes the sharp one-hit split with profile `(6,4,5)`; it lacks global K4 and is not a counterexample. The next bridge is choice-invariant `ExistsSurplusPairCriticalBlocker`, or prior elimination of card four—not a universal endpoint inequality. |
| ATAIL-BLOCKER-APEX-ALIGNMENT | CHECKED-SCRATCH ADAPTIVE CLASSIFICATION 2026-07-14; COUPLING OPEN | Upstream cap cover and one-hit bounds; global K4; nonempty critical system | Produce two off-surplus points on one Moser-apex class and classify their interaction with the other apex. | `blocker-apex-alignment/BlockerApexAlignment.lean` cycle-freely replays the cap-interior lower bound and produces two distinct off-surplus points co-radial at either non-surplus Moser apex. At the other apex, either both deletions preserve K4, or an adapted actual `CriticalShellSystem` selects that apex as blocker for one source. Both directions kernel-check with core axioms only. This avoids importing downstream/circular `PinnedSurplusGeneralM`, but it does not put the second point in the adapted shell, identify the arbitrary live selector, or consume the double-survival arm. |
| ATAIL-FORCE | SUPERSEDED AS LIVE PRODUCTION ROW; CURRENT SIX-LEAF FRONTIER IN K-A-LIVE; CARD-11 EXACT-FOUR CLOSED | `false_of_originalFrontierUniqueRadiusArm`; `false_of_frontierAllLargeCapsTriApexRobustResidual`; K-A-UNIQUE-POST11; K-A-LIVE | Preserve this row only as the historical cap-strengthened bi-apex plan. The live coordinators now dispatch to four unique-radius leaves and two tri-apex low-hit leaves; the promoted non-Census certificate closes the card-11 exact-four branch, and the `12 ≤ D.A.card` remainder is narrowed by the checked physical-consumer split. | The old bare-B, fixed-H, `CriticalFiberClosingCore`, and pre-LIVE assembly targets are not the current coordinator interface and are non-production. Current obligations and immediate constructor fan-out are recorded in K-A-LIVE. |

### Primary ATAIL theorem decomposition

These rows decompose the ATAIL-FORCE umbrella into an immediate routine Lean
milestone and the content-bearing producer. All three bounded seven-case solver
pilots (`msolve`, Z3, and cvc5) are DONE-NEGATIVE-TRACTABILITY, and the complete 343-skeleton
distinct-witness replay makes the equality-only route DONE-NEGATIVE. None is a
dependency of either proof row.

| ID | Status | Dependencies | Exact deliverable | Consumer and acceptance |
|---|---|---|---|---|
| ATAIL-FIBER-EXTRACT | CHECKED-SCRATCH 2026-07-13; COMPATIBILITY ADAPTER ONLY / NOT A PRODUCER | Existing `leafSurplusPacket` and old `DoubleApexOffSurplusSharedRadiusPair` vocabulary | Define the two-apex joint fiber at radii `r, ρ` and extract the old shared-radius witness from a hypothetical fiber cardinality lower bound. | `SurplusCapPacket.exists_doubleApex_pair_of_joint_filter_card_ge_two` in `scratch/atail-force/critical_row_coupling.lean` is sorry-free, but `doubleApexJointFiber_sdiff_surplus_card_le_one` proves every such off-surplus joint fiber has cardinality at most one. The helper is therefore a compatibility adapter for an impossible antecedent, not an on-spine milestone. Do not wire or mine this pair; prove the parent common-critical-map contradiction directly. |
| ATAIL-FRONTIER-CLOSING-CORE | PRIMARY LARGE-OPPOSITE-CAPS BI-APEX DIRECT-FALSE PRODUCER OPEN; FRONTIER-SOURCE CRITICAL-ROW SPLIT IS THE FIRST LIVE GLOBAL STEP; CARD ≥14 SURVIVAL-COVER PRODUCER NOW PRODUCTION; PAIR-MINIMALITY REDUCTION CHECKED | production `ATail/CriticalPairFrontier.lean`, `ATail/ThirdCenterCommonPair.lean`, `ATail/FrontierCommonDeletionEscape.lean`, `ATail/CriticalFiberClosingCore.lean`, and `ATail/SurvivalCover.lean`; scratch `frontier-pair-global-deletion-split/`; exact 26-point full-cell audit | Prove `false_of_largeOppositeCapsBiApexRobust (L : FrontierLargeOppositeCapsBiApexRobustResidual B)`. First call `cross_deletion_survives_or_cross_membership F.pair`: route cross membership through the signed-area/third-center consumers, and on the `w ∈ selectedAt(q)` subarm use the production card-≥14 source-faithful packet before closing its robust/physical-critical residual with total `H`, minimality, or a terminating geometric measure. Cross survival remains the companion-packet branch. The prescribed-pair minimality check now reduces its core to a singleton or the full `{q,w}` pair, but neither arm is yet terminal. Keep the arbitrary mutual-omission sibling independent unless direct full-`L` `False` bypasses the split. | Exact replay of the 26-point Euclidean/MEC/T0/T1/continuation cell finds only six K4 centers and no possible legal deletion-critical blocker for thirteen sources, including both frontier points. The new production `SurvivalCover` theorem removes the producer/interface gap on the card-≥14, non-card-four, cross-membership surface but is not a contradiction. Hence one actual frontier-source `H.selectedAt`/`H.no_qfree_at` instance is still the smallest audited feature that excludes the local cell and feeds checked consumers. The uniform circular-split aggregate route remains refuted for every even `n >= 12`; arbitrary manifest extensions and local row/cap-order lemmas are not substitutes. If `CriticalFiberClosingCore` is used, choose a favorable system late while preserving the complete `R`/`B`/`L` parent. |
| ATAIL-AGGREGATE-INTERVAL-FLUX | EXACT NORMAL FORM AND 263/263 BANK RECURRENCE; GENERIC EXTRACTION REFUTED FOR EVERY EVEN CARD `>= 12`; FINITE LOWER-CARD TOOL ONLY | `scratch/atail-force/aggregate-positive-contour-discovery/`; production weighted Kalmanson consumer; whole-carrier selected-row surface | Retain the flux normal form as a finite-card decision procedure and diagnostic. Do not target a cardinality-uniform one-signed circulation theorem from the bare four-target, strong-connectivity, pair-alternation, and strict-Kalmanson hypotheses. | `TIGHT_GRAPH_UNIFORM_ATTACK.md` gives a symbolic positive circular-split counterfamily for every even `n >= 12`; the independent card-twelve replay checks 48 tight arcs, degree four on both sides, strong connectivity, pair alternation, and strict Kalmanson slacks. Hence no one-signed nonzero interval-flux circulation exists on that table. The 263/263 stored-core recurrence and card-eight/nine decisions remain exact finite evidence only. Cards ten and eleven may still be decided separately; high-card closure must restore Euclidean/MEC/full-fiber/minimality data. |
| ATAIL-AGGREGATE-PRODUCT-BOX | KERNEL-CHECKED SUFFICIENT REDUCTION; COMPLETE PRODUCT SURFACES UNSAT WITH VERIFIED DRAT AT CARDS EIGHT AND NINE; CARD TEN SEARCH ACTIVE; GENERIC WIDTH THEOREM REFUTED FROM CARD TWELVE | assignment-comparability and coupled-cycle audits under `aggregate-positive-contour-discovery/`; ATAIL-AGGREGATE-INTERVAL-FLUX | Use exact product-box CEGAR only to decide remaining lower-card surfaces. Do not extrapolate it to a uniform parent producer. | Scratch Lean kernel-checks the balance and crossing-profile reduction. Card eight is exhausted by 256 replayed cuts and verified DRAT; card nine by 2,560 cuts and verified DRAT. The piqd raw-DIMACS outer now replays complete SAT assignments exactly, supports atomic resume, and emits only the inclusion-minimal active cut antichain while preserving the append-only certificate bank. The uniform even-card counterfamily has no one-signed contour, so the generic comparability conclusion is false. Cards ten and eleven remain finite cardinal-specific questions, not a route to `card >= 12`. |
| ATAIL-AGGREGATE-TIGHT-ROW | OFF-DIAGONAL ONE-EDGE-DEFICIT AND LOW-ROW THEOREMS REFUTED; UNIFORM EVEN-CARD DEGREE-FOUR COUNTERFAMILY EXACT | `TIGHT_GRAPH_UNIFORM_ATTACK.md`; `tight_graph_uniform_counterexample.py`; positive circular-split Gordan dual | Preserve the counterfamily as a regression gate. Any replacement theorem must add full-parent geometric/provenance hypotheses absent from the circular-split abstraction. | For every even `n >= 12`, set split weight `n-8` on size-two splits and one elsewhere. Explicit parity potentials produce exactly four nonloop tight targets per row and target. The symbolic formula proves the family; two independent exact-integer verifiers pass at card twelve. This refutes `|E| <= 4*n-1`, the degree-`<=3` row lemma, and the generic interval-flux/product-box theorem. It is not a Problem 97 counterexample because the split metric need not be realized by the full Euclidean/MEC/critical-fiber parent. |
| ATAIL-RETAINED-BLOCKER-SELECTOR | FALLBACK SOURCE LIBRARY; SELECTOR/REDUCTIONS DONE-PRODUCTION; NOT AN INDEPENDENT FINAL DISPATCH | `FrontierCommonDeletionParentResidual`; production retained selector/reduction/consumer/normalization modules | Supply source-exact collision/matching facts inside `false_of_largeOppositeCapsBiApexRobust L` or the optional late-choice critical-fiber implementation. Do not dispatch the historical collision/matching leaves as separate publication obligations. | The local leaves have exact rational/cycle residuals and are not complete consumers. Their production facts remain available to the primary parent-scoped producer. |
| ATAIL-RETAINED-COLLISION-CAP | FALLBACK SOURCE LIBRARY; LOCAL CONSUMER CLOSES 2/7 ORDERS; FIVE LOCAL RESIDUALS | production collision-cap modules and exact local models | Reuse the localized cap/order facts only inside the parent-scoped critical-fiber producer or a direct full-parent contradiction. | The bare cross hit is not a complete producer; the five acyclic local models forbid treating this row as an independent final dispatcher. |
| ATAIL-RETAINED-MATCHING-REDUCTION | FALLBACK SOURCE LIBRARY; COMMON-DELETION NORMAL FORM DONE-PRODUCTION | production matching reduction/consumer/normalization modules | Feed the origin-tagged matching/common-deletion facts into the parent-scoped critical-fiber producer; do not treat generic packet termination as a separate final obligation. | The generic packet admits a checked successor cycle. Full-parent geometry is required, exactly as recorded by the primary producer row. |
| ATAIL-RETAINED-MATCHING-LARGE-CAP-CONSUMER | DONE-PRODUCTION; ALL THREE OUTCOMES NORMALIZED TO COMMON DELETION | production `ATail/RetainedMatchingLargeCapConsumer.lean` and `ATail/RetainedMatchingCommonDeletionNormalization.lean`; matching geometric reduction | Consume reverse incidence and the opposite-large-cap split, then normalize every arm to `CommonDeletionTwoCenterPacket`. | The second-cap localized reverse hit is not a special Kalmanson residual: its four-point shell has only two points outside cap one, whereas the large second cap has at least three strict-interior points, yielding a fresh deletion source. `exists_commonDeletionPacket_of_matchingReduction` covers the entire matching reduction. The generic packet remains nonterminal by the exact successor-cycle regression, so retain the originating matching/large-cap provenance in the final consumer. |
| ATAIL-PARENT-CONTENT | OPEN ASSEMBLY; CAP-FIRST EXITS, LARGE-CAP ROBUST PRODUCER, AND PROTECTED UNIQUE ARM REMAIN | production physical ingress, `CriticalFiberClosingCore`, its exact consumer, and `CriticalPairFrontier`; protected original/swapped unique-row lanes | Run the cap-first small/critical consumers, then extract `F` on the large-cap robust branch and apply `originalUnique_or_commonDeletionParent`. Dispatch the protected original unique arm; on common deletion construct `R`, `B`, and cap wrapper `L`, prove `false_of_largeOppositeCapsBiApexRobust L`, and assemble `false_of_twoLargeCaps_commonCriticalMap`. | The mandatory public producer is direct `False` from `L`; bare-`B`, fixed-`H`, and local conditional adapters are superseded. The exact 26-point `(11,10,8)` regression refutes complete reverse rows plus retained T0/T1/frontier, the unused critical row, continuation common deletions, Euclidean/MEC geometry, and cap bounds as sufficient. The live coupling must use total all-center K4/common-CSS/minimality or a checked aggregate cap-order occurrence. |
| ATAIL-COLLISION-OFFCAP | CHECKED-SCRATCH EXACT LOCALIZATION, INTERSECTION, CENTER-ROLE, AND NAMED-ROW SPLITS; DIRECT CONSUMER OPEN | `scratch/atail-force/collision-offcap-localization/` and `collision-offcap-u5-incidence/`; localized collision mutual-omission cycle; cap partition; common critical system | Force `p` plus a second dangerous point into the named other-collision-source row, force a second dangerous-centered directed row hit, or prove a direct cap/MEC contradiction in the exact empty/singleton/pair fresh-row branches. | The blocker lies in strict surplus-cap or strict second-opposite-cap interior. The fresh actual row intersects `{q} ∪ T` in exactly ∅, one point of `T`, or two distinct points of `T`; `q` is excluded. Global K4 gives a named q-deleted/q-critical row at the other collision source, and both blockers have exact dangerous-center/selected-candidate roles. Imported U5 sinks still require missing `p` and cross-row memberships, so broad row enumeration is rejected. |
| ATAIL-COLLISION-ONCAP-PLANAR | CHECKED-SCRATCH LINEAR ROUTE EXHAUSTED; SERIAL EUCLIDEAN/CONCYCLIC RESIDUAL OPEN | `scratch/atail-force/collision-oncap-kalmanson/`; two complete on-cap critical rows | Decide the serial `s1 < A < s2 < B < f` residual using row-specific Ptolemy equalities, planar Gram/rank/two-circle geometry, or a third actual row. | Exact replay closes 72/84 orders. A kernel-checked rational survivor realizes the remaining 12 orders and satisfies all triangles, strict Kalmanson, cap-nonacute, general Ptolemy inequalities, and both exact row tables, but has a negative planar Gram determinant. Linear Kalmanson/Farkas and cap curvature alone are blocked. |
| ATAIL-SOURCE-RETURN-SECOND-APEX | CHECKED-SCRATCH FOUR-WAY ENDPOINT FULLY ROUTED; ROBUST SECOND APEX OR PROTECTED SWAPPED FA-UNIQ4 | `scratch/atail-force/source-return-second-apex-bridge/` and `source-return-physical-residual/`; source-return walk; original second-apex row | Consume only the two genuine downstream dependencies: `FullyDeletionRobustAt D S.oppApex2` and `SwappedFirstApexUniqueFourFrontier D S H`. | `sourceReturn_secondApexRobust_or_swappedUniqueFour` is exhaustive. Critical leaves reorient to swapped FA-UNIQ4; disjoint exact shells imply full robustness; joint double deletion splits honestly on robustness and its nonrobust side produces the same swapped frontier. The selected sources have unequal second-apex distances and cannot witness K-A-PAIR. Do not mine `PhysicalSecondApexCriticalResidual`, joint double deletion, or disjoint shells as independent terminals. |

### liveData textual-hole families

**Current dispatch rule:** do not assign the LIVE-Q/C rows individually. They
are retained below as source inventory only while ATAIL-PARENT-CONTENT is open.
The parent theorem is called before this split; afterward reference mining
deletes the helper tree or leaves only sorry-free wrappers with real external
callers. T1/T3 are legacy dependency reduction, not the target proof shape.

**Finite-certificate dispatch rule:** do not queue literal witnesses or resume
anonymous support/fixed-class CEGAR. A new certificate is load-bearing only
if it eliminates a complete symmetry orbit/schema, reduces a certificate
required by an existing consumer, or is consumed by a formal coverage
theorem. Solver/CAS agreement on another isolated assignment remains
theorem-discovery evidence.

| ID | Status | Exact holes | Required output and gate |
|---|---|---|---|
| LIVE-SHARED-PRODUCER | SUPERSEDED BY ATAIL-PARENT-CONTENT; INVENTORY ONLY | Historical shared antecedent behind LIVE-Q/T1/T3 and the seven LIVE-C branches | No dispatch. Preserve the checked boundary reports as regressions while the parent theorem bypasses this split. | Existing scratch audits explain why no local helper closes; they are negative evidence, not a queue of proof tasks. |
| LIVE-T1/T3-RELABEL | DONE-PRODUCTION-WIRING; TRANSITIVELY OPEN THROUGH K-A-PAIR | 0 direct LIVE-T1 holes + 0 direct LIVE-T3 holes | Transfer the sixth-row full support to the collided named row, permute the dangerous triple so that row is the existing `t2` row, and call K-A-PAIR once per orbit. | Both adapters are production-wired. Neither orbit is kernel-closed until K-A-PAIR closes, but neither is a direct source-hole family. |
| LIVE-BANK-MATCH | DONE 2026-07-12 (dd2f91c1) — NEGATIVE terminal | CTRL-BANK-PREFLIGHT; before any LIVE-Q/T1/T3 or terminal branch certificate hunt | Delivered `scratch/live-bank-match/` (REPORT.md, match_matrix.json, gate PASS): 1,422 (leaf, consumer) pairs → 0 MATCH; block structural. Full verdict recorded in the K-A-LIVE row. | Negative map accepted; no bank wiring exists without the new packet-label-centered K4-row producer. |
| LIVE-Q | NO-DISPATCH; PENDING PARENT BYPASS | 24 ordered `q = t2[0]` leaves, 6 holes in each of four helpers | Retain only as current source inventory. After ATAIL-PARENT-WIRE, reference-mine and delete or leave sorry-free wrappers. |
| LIVE-T1 | SOURCE-SORRY-FREE; TRANSITIVELY OPEN THROUGH K-A-PAIR (2026-07-14) | 0 direct holes across all 12 `liveData_T1_ql{i}_srcl{j}_false` helpers; each reaches K-A-PAIR through the production relabel theorem | `Problem97.U1LargeCapRouteBTailRelabel.false_of_center_p_t1_t20_via_pair` bypasses the former six-positive/eighteen-negative slot split and is called in both branches of every helper. Focused target build passes, and the helpers are absent from `proof-blueprint symbols --with-sorry`. Gate: close K-A-PAIR and confirm their axiom closures no longer contain `sorryAx`. |
| LIVE-T3 | SOURCE-SORRY-FREE; TRANSITIVELY OPEN THROUGH K-A-PAIR | 0 direct holes across all 12 helpers | Production T3 relabel wiring reaches K-A-PAIR in both orderings of every helper; focused target build passes. |
| LIVE-C-Q | NO-DISPATCH; PENDING PARENT BYPASS | `liveData_C_center_q_false`, center `q` | Source inventory only; delete or retain a sorry-free wrapper after parent reference mining. |
| LIVE-C-T1 | NO-DISPATCH; PENDING PARENT BYPASS | `liveData_C_center_t1_false`, center `t1` | Source inventory only; delete or retain a sorry-free wrapper after parent reference mining. |
| LIVE-C-T2-N | NO-DISPATCH; PENDING PARENT BYPASS | `liveData_C_center_t2_named_false`, center `t2`, all named | Source inventory only; delete or retain a sorry-free wrapper after parent reference mining. |
| LIVE-C-T2-F | NO-DISPATCH; PENDING PARENT BYPASS | `liveData_C_center_t2_rowFailure_false`, center `t2` | Source inventory only; delete or retain a sorry-free wrapper after parent reference mining. |
| LIVE-C-T3 | NO-DISPATCH; PENDING PARENT BYPASS | `liveData_C_center_t3_false`, center `t3` | Source inventory only; delete or retain a sorry-free wrapper after parent reference mining. |
| LIVE-C-U | NO-DISPATCH; PENDING PARENT BYPASS | `liveData_C_center_u_false`, center `u` | Source inventory only; delete or retain a sorry-free wrapper after parent reference mining. |
| LIVE-C-FRESH | NO-DISPATCH; PENDING PARENT BYPASS | `liveData_C_center_fresh_false`, fresh center | Source inventory only; delete or retain a sorry-free wrapper after parent reference mining. |
| LIVE-FINAL | BLOCKED on ATAIL-PARENT-WIRE | ATAIL-PARENT-WIRE | Call the parent common-critical-map contradiction before slot enumeration, delete or prove any externally referenced residual wrappers, and build `U1LargeCapRouteBTail`; both target spines leave `sorryAx`. |

## Front-B producer rows

| ID | Status | Dependencies | Exact deliverable | Consumer and acceptance |
|---|---|---|---|---|
| END-MOD | DONE (2026-07-11) | CTRL-GRAPH, CTRL-OWN | `EndpointCertificate/GeometryProducer.lean` exists (green, sorry-free; commits 8a7e6d1b, b2183714, 35bc63aa): label-complete engine, u-mask-bound family, circumcenter family. It may be imported by `Base.lean`, but must not import `Base.lean` or a consumer of `isM44EndpointResidualsExcluded`. | Import DAG and public signatures are reviewed; source/axiom audit is explicit because the certificate namespace is mining-skipped. |
| END-L | DONE (2026-07-11) | END-MOD | `endpointLeft_residual_false_of_card_five` (GeometryProducer.lean, sorry-free): right-apex branch (f67e7818) + reflected branch + combiner (e7ee31a2), assembled component-wise (the `mem_interfaces` wrapper is unusable — diagonal `sepOKFor c c` is false). | Base left hole replaced by one producer call (e7ee31a2); full library green. |
| END-R | DONE (2026-07-11) | END-MOD, END-L template | `endpointRight_residual_false_of_card_five` via Plan B: inline mirror over `endpointMirrorLabelPoint = leftPinnedLabelPoint` (funext bridge, not defeq), kernel pairing flipped vs END-L (left-apex → direct, right-apex → reflected). | Base right hole replaced by one producer call; full library green; umbrella left the spine open-obligations list (K-B-END-GENERAL remains). |
| PIN-R | DONE | Label-complete `S.surplusCap.card = 5`, right pinned geometry | Right half of `IsM44PinnedSurplusNonVExactShapeProducerStatement`: construct same-radius support classes and exact candidate masks. | Proved; `PinnedSurplusProducer` builds without `sorry`. |
| PIN-L | DONE | PIN-R mirror lemmas and left label map | Left half in the label-complete regime. | Proved; full metric-shadow producer builds without `sorry`. |
| PIN-METRIC-TRIAGE | DONE-BOUNDED | PIN-GENERAL saved relaxed row systems; `Census554.EqualityCore`, `ConvexFivePointCore`, `ConvexRhombusCore` | `metric_realizability_structural_complete` partitions all 1,325 saved systems as 1,264 duplicate-center, 31 exact-off-circle, 20 perpendicular-bisector, 9 cyclic five-point, and 1 cyclic rhombus/equilateral contradiction. | Deterministic regression checks the exact partition. Generic Lean consumers for all five schemas build and are core-only under `proof-blueprint axioms`. This row claims saved-artifact coverage only. |
| PIN-METRIC-BRIDGE | HISTORICAL ASSET; SUPERSEDED BY K-B-PIN | PIN-METRIC-TRIAGE | Twelve generic metric-core consumers, arbitrary-cardinality realization vocabulary, canonical labeling, incidence soundness, native search coverage, and all twelve placement replays are kernel-checked. The former external bank is not on the proof path. | No dispatch. The contemplated `PinnedShellOK` producer is unnecessary because `isM44PinnedSurplusGeneralMResidualsExcluded` is already source-proved and K-B-PIN is DONE. Reuse individual generic lemmas only when a new on-spine consumer exists. |
| PIN-GENERAL | DONE VIA K-B-PIN 2026-07-12 | K-B-PIN | Historical decomposition forced `m = 6`, `A.card = 11` and built the finite classifier surface. The actual terminal `Problem97.isM44PinnedSurplusGeneralMResidualsExcluded` is now proved in `RemovableVertexAxiom/PinnedSurplusGeneralM.lean`. | Do not dispatch confinement or `PinnedShellOK` work against this former leaf. Source has no `sorry`; the declaration is absent from `proof-blueprint symbols --with-sorry`. |
| PIN-KQ35 | DONE-CORE; HISTORICAL NONCRITICAL | None | K-Q3-5 normalization, packet alignment, side-product extraction, and orientation symmetry remain reusable kernel-checked assets. | No PIN-GENERAL producer is open. Any future extraction work requires a different named on-spine consumer. |
| PIN-EXACT-CLOSURE | DONE-CORE; HISTORICAL NONCRITICAL | None | The exact-off-circle equality core and `CriticalFourShell` bridge remain kernel-checked reusable assets. | No PIN-GENERAL producer is open. A saved probe assignment is still not a Lean realization, but no closure row currently asks for that bridge. |
| ERASE-P4-U | DONE (2026-07-12; card 10 and 11) | `CardTenProducer.lean`; `CardTenP4Seed*.lean`; `ErasedNativeClassifier.lean`; `P4UPlacements.lean`; `P4UClosure.lean` | Card ten: the complete 504-seed bank routes 378 direct separation contradictions and kernel-checks the remaining 72 P4-U plus 54 P4-S grid seeds. Card eleven: Moser-pair containment reduces the seed support domain from 79 to 47; the closed native certificate covers every support and eligible deleted label, semantic transport extracts a closure-core alternative, and the canonical geometry consumer refutes all branches. | `surplusOppositeErasedPinTriple_cardEleven_residual_excluded` is sorry-free, target-built, axiom-audited, and absent from the refreshed spine open list. No ten-label claim may assume more than three surplus labels without the explicit card-10 producer bridge. |
| ERASE-P4-S | DONE (2026-07-13, downstream verified) | Card-ten P4 bank; generic card-eleven classifier/soundness infrastructure; `P4SPlacements.lean`; `P4SClosure.lean` | Card ten is spine-closed through the three 18-seed P4-S grid families. Card eleven has 128 built native leaves, complete semantic/closure transport, and wiring into `surplusInteriorErasedPinTriple_cardEleven_residual_excluded`. | `Continuation` builds with P4-S imported; the exact-pin parent is kernel-complete, and terminal/dispatcher/parent axiom audits contain no `sorryAx`. |
| ERASE-P2-R | DONE (2026-07-13) | `CardTenProducer.lean`; `P2Placements.lean`; `P2Closure.lean` | Every right card-10 branch, all right card-eleven finals, and all 10 consumers are built. Native leaves are balanced to 21-25 active searches and share one base-domain construction per leaf. | P2 and downstream targets build; dispatcher and right terminal audits pass; no right residual appears in the refreshed open spine. |
| ERASE-P2-L | DONE (2026-07-13) | ERASE-P2-R shared classifier/closure infrastructure | Every left card-10 branch, all left card-eleven finals, and all 10 consumers are built through the same P2 fleet. | P2 and downstream targets build; left terminal audits pass; no left residual appears in the refreshed open spine. |
| ERASE-P3-MAP | DONE 2026-07-12 (54b7950f) | None | Deterministic map from each blocked erased-pin row/site to the exact multi-center class code and orientation used by the census. | Round-trip test from row -> class -> row features; no Lean `sorry`; no claim of geometric necessity. DELIVERED `scratch/erase-p3-map/` (ep3map.py + artifacts). Vocabulary: multi-center joint token census (`census/multi_center/`); frames card 10 → (5,4,4)/n=10, card 11 → (6,4,4)/n=11. Code: census canonical row `min((m,s,l,r),(m,s,r,l))` for non-Moser sites, `class_key(canon_joint(...,"EP1"))` for the apex; orientation (side, chi) restores the quotient — lossless. Gates: witness validation 28/28, hard_fail 0 (26 rows + 2 surplus probes; the 2 Lean-closed structurally-impossible rows carry no witnesses by construction), all witnesses LOCAL-cut-clean and `solve_global` SAT under BOTH tiers (EMPIRICAL); round-trip IDENTITY over the full 186-feature domain with 186 distinct (code, orientation) pairs. Inventory (`inventory.json`): 76 entries, 25 canonical classes; PROVEN-tier survivors 8/10 (n10) and 9/13 (n11); the three card-11 Sint s=3 shapes are the only tier-sensitive ones (PROVEN-SAT, CONJECTURED(PLUS)-killed). All witness-backed entries are PROVEN-tier SAT, so any separating cut for ERASE-P3-SWEEP must come from beyond the current PROVEN set. |
| ERASE-P3-SWEEP | OPTIONAL (HELD — no spare compute, Adam-gated 2026-07-12) | ERASE-P3-MAP (DONE — sweep input is `scratch/erase-p3-map/inventory.json` `entries`) | Run targeted CONJECTURED-tier appendix and report which cuts separate all mapped survivors. Sweep = `solve_global` per surviving entry at (5,4,4)/(6,4,4) under PROVEN then PROVEN+CONJECTURED tiers plus any proposed new cut, reporting SAT→UNSAT flips. | Reproducible artifact with PROVEN/CONJECTURED labels. A discovered cut creates a proof row only after a necessity theorem and consumer are specified. |

## Cross-cutting multi-center research

These rows remain off-spine until their selected-four surface is connected to
the fixed MC-CONSUMER target below. Do not introduce off-spine sorries while
exploring them.

| ID | Status | Dependencies | Exact deliverable | Consumer and acceptance |
|---|---|---|---|---|
| MC-EXTRACT | OPTIONAL | Existing `JointClass`, `CapProfile`, and leaf data | Concrete `extractedClass`/`extractedProfile` plus `extractedClass_locallyAdmissible`, proving support, center-use=4, capacity, H1, pair-sharing, and Q3 cuts field by field. | Sorry-free module builds; extraction applies to an actual Front-A hypothesis package. |
| MC-SURFACE | OPTIONAL | MC-EXTRACT | Instantiate `ProfileRealizationSurface`; prove `GlobalSound` and exact profile occurrence/extension facts. | Existing abstract `localInventory_stepPersistent` applies to the concrete surface. |
| MC-T1 | OPEN-RESEARCH | MC-SURFACE | `CompletesGlobalFrom` or an equivalent geometric LOCAL-to-GLOBAL upper bound. | Produces a theorem identifying scoped LOCAL codes with geometric GLOBAL realizations above a stated threshold. Representative-surface completeness alone does not pass. |
| MC-CONSUMER | OPEN-RESEARCH (target fixed 2026-07-13; bridge absent) | MC-T1 plus a selection-robust geometric bridge from the selected-four surface to full exact-radius filters | From the actual K-A-PAIR hypothesis package, with `S := leafSurplusPacket ...`, produce radii `r, ρ` such that the off-surplus intersection of the full exact-radius filters at `S.oppApex1` and `S.oppApex2` has card at least two; equivalently produce `False`. | The target now matches ATAIL-FORCE exactly (`docs/atail-force-producer-plan-2026-07-13.md`), but the 3,375-row representative surface proves only selected-four LOCAL completeness. MC-T1 and the full-filter geometric bridge are both required before an on-spine consumer call; no finite-inventory or persistence theorem alone advances K-A-PAIR. |
| MC-CONJ | OPTIONAL | A route-specific question such as ERASE-P3 | Full targeted CONJECTURED-tier appendix, not merely n=12..15 smoke. | Artifact and audit note only; no automatic proof status. |

## Exhaustive textual-hole reconciliation

Historical census, updated 2026-07-26. It reported six direct Front-A leaves
before the later exact-four on-spine decompositions; do not use this table as
the current leaf census. The
former card-at-least-12 exact-four leaf is now a source-clean coordinator over
two strictly enriched physical-consumer leaves, and the robust constructor is
a source-clean wrapper over its stronger post-card-eleven surface leaf; the
ERASE exact-pin subtree remains kernel-complete:

| Declaration | Hole lines | Count |
|---|---|---|
| `ATailFrontierLiveClosure.false_of_exactFourPostCardElevenRobustSurface` | `FrontierLiveClosure/Rigid221Closure.lean:735` | 1 |
| `ATailFrontierLiveClosure.false_of_exactFourPhysicalConsumerSwappedUniqueFourOutcome` | `FrontierLiveClosure/Rigid221Closure.lean:778` | 1 |
| `ATailFrontierLiveClosure.false_of_firstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual` | `FrontierLiveClosure/Rigid221Closure.lean:1024` | 1 |
| `ATailFrontierLiveClosure.false_of_firstApexUniqueRadiusExactFiveCommonObstructionCenterResidual` | `FrontierLiveClosure/Rigid221Closure.lean:1035` | 1 |
| `ATailFrontierLiveClosure.false_of_localizedCollisionMutualOmissionCycle_exactTwo_and_all_low_hits` | `FrontierLiveClosure/Coordinator.lean:510` | 1 |
| `ATailFrontierLiveClosure.false_of_retainedInteriorDirectedOmission_and_all_low_hits` | `FrontierLiveClosure/TriApexEndpointRetainedOmission.lean:2795` | 1 |
| **Total** | | **6** |

`isM44PinnedSurplusGeneralMResidualsExcluded`,
`isM44EndpointGeneralMResidualsExcluded`, the endpoint umbrella, and all 22
ERASE residual declarations are source-closed and contribute zero current
holes. ERASE is committed at `652fdfcb` and passes its target build, axiom,
spine, and target-specific publication gates as recorded above. The former
`DoubleApexOffSurplusSharedRadiusPair` and LIVE-Q/C implementation was removed
from production comments and preserved under
`docs/archive/2026-07-25-u1-route-b-tail-retired/`; this is
bypass/retirement, not individual proof. Global publication remains blocked by
the five Front-A leaves. The card-11 replay trees are committed production Lean
sources, not an additional proof obligation or clean-checkout prerequisite.

## 2026-07-14 T3 Wiring Checkpoint

The production `U1LargeCapRouteBTailRelabel.false_of_center_p_t3_t20_via_pair`
adapter is now implemented in `Erdos9796Proof.P97.U1LargeCapRouteBTail` and
called by both orderings of all 12 LIVE-T3 declarations.  The focused target
build passes.  LIVE-T3 therefore has zero direct holes and remains only
transitively open through K-A-PAIR.

The source contains 11 remaining direct sorry declarations in these families:
four LIVE-Q helpers and seven LIVE-C center branches.  Their textual direct-hole
count is 31 (24 LIVE-Q plus 7 LIVE-C), in addition to the single K-A-PAIR
producer sorry.  A prior `proof-blueprint` build incorrectly classified those
LIVE-Q/C declarations as off-spine; Adam identified that tool bug and had it
repaired in a separate session.  The freshly regenerated
`docs/live-blueprint.md` now lists all 11 declarations as open obligations on
both configured publish spines.  Do not use a stale off-spine snapshot for
dependency planning or publication counts.  The T3 adapter is a dependency
reduction, not a closure of K-A-PAIR; its inherited `sorryAx` must disappear
when that producer closes.

## Front-A next dispatch (2026-07-14)

These rows supersede the older instruction to prove unconditional `u`-row
cap confinement or to finish a coverage census over only the two apex
marginals.

| ID | Status | Dependencies | Exact deliverable | Consumer and acceptance |
|---|---|---|---|---|
| ATAIL-EXACT-PAIR-COVERAGE | DONE-NEGATIVE; FINITE ABSTRACTION ONLY | `producer_surface.py`; current bank/endpoint/one-hit/MEC matchers | Exhaust every target-negating full exact-class pair in the three card-11/card-12 profiles. | `producer_coverage_census.py` classifies 369,743 pairs: 44,831 bank, 108,435 endpoint containment, 215,547 production adjacent-cap one-hit, and 930 survivors (96 / 150 / 684 by profile). One-hit precedes and subsumes both scratch MEC stages. The pinned checkpoint, mutation/count tests, exact consumer checks, and witness-invariant tests pass; the full ATAIL suite passes 73/73. Survivors occur in every profile, so do not extend this marginal surface as the primary proof route. |
| ATAIL-RESIDUE-930-BRIDGE | CONSUMER AND NORMAL FORM DONE-PRODUCTION; DIRECT RANK-ONE PRODUCER NEGATIVE | The 930 post-one-hit residues; required theorem-bank registries and indexed corpus | Identify the smallest already-consumed output that would cover every remaining finite pair, and distinguish static sink coverage from live production. | Current two-apex rows hit 0/930 equality/order cores. `SurvivorPairRelocationPacket.false_of_w_mem_selectedAt_q_of_sameSide` is a production conditional consumer. The rank-one normal form is also production-wired as `cross_deletion_survives_or_cross_membership`, `signedArea_product_neg_of_cross_membership`, and `card_five_cross_deletion_survives_or_cross_oppositeSide`; the defining module and full U1 target build, and all three close under the three core axioms. At `q`'s actual blocker, deleting `w` preserves K4 or the selected shell contains `w`; in the cross-hit branch two-circle reflection plus convex noncollinearity forces the signed-area product strictly negative. Thus the positive/same-open-arc field is the contradiction, not a consequence of the cross hit. The first missing antecedent is cross-deletion failure, and otherwise the route enters robust survival. Alternate universal conditional covers remain card-five cap/mutual, choice-invariant surplus blocker, and branch-complete blocker packets. Variable `u1TwoLargeCapObstruction` needs 3 / 4 / 5 extra equalities on 49 / 470 / 411 residues. Checkpoint `e84357cf...2ff16` passes. |
| ATAIL-FRONTIER-EXTRACT | DONE-PRODUCTION 2026-07-14; DOUBLE-SURVIVOR NARROWING DONE | `ATail/CriticalPairFrontier.lean`; arbitrary-packet adjacent-cap one-hit; generic two-circle escape factored into `U2NonSurplusOneHit` | The dependent `CriticalPairFrontier` carries one off-surplus first-apex pair, both single-deletion second-apex survival facts, the first-apex unique-4/5-or-double-survival split, and the stronger `secondApexDouble` fact that simultaneous deletion preserves K4 at the second apex. `exists_criticalPairFrontier_of_K4` now retains `4 <= card (SelectedClass D.A S.oppApex1 r)` and adaptively chooses the double-surviving pair. The older `secondApexSplit` field remains only as a compatibility projection and is always filled by its double-survival arm, so the exact-eight arm is absent from production extraction. | The acyclic module imports only `U1CarrierInjection` and `U2NonSurplusOneHit`; U1 imports it. The focused module build passes 8083/8083. Live axiom audits for both extraction theorems are exactly `propext`, `Classical.choice`, and `Quot.sound`. This narrows the proof surface but does not close it; the prescribed-deletion lane is retired as an intermediate producer, and ATAIL-ROBUST-COUPLING is the remaining content lane. |
| ATAIL-CAP-RADIUS-CAPACITY | CHECKED-SCRATCH 2026-07-14; CORE-AXIOM CLEAN; NORMALIZATION ONLY | Full MEC cap cover; convex adjacent-cap one-hit; global K4 | Prove that two distinct positive K4 radii at one Moser apex force the opposite cap to have card at least six; derive unique full filters for cap four/five and the two-apex card-14 barrier. | `scratch/atail-force/full-geometry-producer/CapFiveApexRigidity.lean` direct-checks with exactly `propext`, `Classical.choice`, and `Quot.sound`. If both non-surplus apices have two radii, `14 <= |A|`; hence through card 13 one apex has a unique full filter of card four/five. Exact `(6,4,5)` and `(6,5,5)` local models replay the sharp boundary. This closes no whole frontier and is not uniform from card 14. |
| ATAIL-SMALL-CAP-FRONTIER | CHECKED-SCRATCH PARENT BYPASS 2026-07-16; R ABSENT THROUGH CARD 13; PROTECTED UNIQUE ARMS OPEN | ATAIL-FRONTIER-EXTRACT; ATAIL-CAP-RADIUS-CAPACITY; fixed-surplus swap; swapped `FA-UNIQ4/5` interfaces | Route every frontier through card thirteen directly to the protected original or swapped unique-radius arms. | `scratch/atail-force/r-small-card-parent-bypass/SmallCardParentBypass.lean` proves `smallCarrier_routes_to_protectedFrontier`. If `oppIndex1` has cap card four/five, `firstApexSplit_unique_of_small_opposite_cap` gives `OriginalUniqueRadiusArm`. If `oppIndex2` is small, the fixed-surplus non-surplus swap, a fresh production frontier, and the same rigidity construct either `SwappedFirstApexUniqueFourFrontier` or `SwappedFirstApexUniqueFiveFrontier`, including the blocked double deletion. All printed declarations have only the three core axioms. Hence no origin-tagged R/common-deletion handler is needed for `D.A.card ≤ 13`; the remaining R surface has both non-surplus caps at least six and therefore carrier card at least fourteen. This routes to, but does not prove, the protected unique-row arms. |
| ATAIL-MEC-BOUNDARY-ROW-DICHOTOMY | CHECKED-SCRATCH 2026-07-14; BOUNDARY-ONLY ROUTE TERMINAL | Three actual critical rows sourced at the MEC-boundary Moser vertices; MEC disk; convex/Moser one-hit | Extract every automatic power/radical-axis consequence and classify the cross-hit graph before invoking off-boundary global rows. | `scratch/atail-force/mec-boundary-critical-rows/MECBoundaryCriticalRows.lean` proves the half-plane law `inner (s-O) (z-q) <= 0` and the pure three-source dichotomy from no-two-hit hypotheses, with exactly the three core axioms; the existing convex/Moser bound supplies at most one cross hit per source row. The graph has either a reciprocal cross-deletion-survival pair or a directed three-cycle. Exact `Q(sqrt(3))` models include a strict-convex unit-MEC `(5,5,4)` instance with the bare cycle; it fails precisely at all-center K4/full critical coverage for the added cap points. The first graph arm is the open robust residual; the cycle gives none of the h4/h5, shared-support, straddling, nested, or arc-overtake antecedents. The later exact 29-point strict-convex local model adds K4 at every relevant support center and still avoids the pair hit. The next gate is therefore all-center global-K4 continuation, not merely row existence or total-critical-system alignment: the exact 35-point completion supplies the latter and still avoids the target. |
| ATAIL-GLOBAL-K4-CONTINUATION | CHECKED-SCRATCH 2026-07-14; FIRST POSITIVE GLOBAL STEP; ROW CLASSIFIER OPEN | ATAIL-MEC-BOUNDARY-ROW-DICHOTOMY; all-center global K4; second-apex selected four-class | Force at least two strict `oppCap2` interior support centers and construct one global selected four-class at each; then classify those continuation rows into an existing consumer. | `scratch/atail-force/global-critical-continuation/GlobalCriticalContinuation.lean` kernel-checks `secondApex_support_strictInterior_card_ge_two` and `secondApex_two_globalK4_continuations` with exactly `propext`, `Classical.choice`, and `Quot.sound`. The exact-radius cover plus the two adjacent one-hit bounds leave at least two of the four support points in `oppCap2 \ (surplusCap ∪ oppCap1)`; `D.K4` supplies a row at each. In the exact 35-point total-CSS regression the representatives are `G` and `K`, both among the 24 centers without K4, so this consumes precisely the isolated missing live layer. It is not closure: the first open theorem must turn one or both rows into a repeated outside pair, same-cap edge and strict rank/lap packet, production metric/order core, confinement, or `False`. Keep the arbitrary-packet API scratch-only until that consumer fixes its shape. |
| ATAIL-SIX-FRONT-STRUCTURAL-AUDIT | DONE-NEGATIVE 2026-07-14; CHECKPOINT AND LEAN ADAPTER VERIFIED | Six smallest exact UNIT fronts; current Census554 equality/order/MEC consumers | Test whether the six nonisomorphic UNIT fronts share a realizable geometric core rather than only an equality deficit. | `scratch/atail-force/six-frontier-structural-core/` finds the same injective `MECStraddlingRowCore.Core` equality skeleton on all six fronts. The live packet supplies the center, `boundary_oa`, and both disk inequalities; `nonobtuse_a` is derivable and kernel-checks in all three cap cases. The candidate still does not close: `boundary_op` would require a strict cap-interior point to lie on the MEC boundary, and every common mapping has orientation signature `(+,+,+,-)` or its reversal, so neither `Geometry` consumer applies. Shards 0, 1, and 2 have no orientation-compatible alternative. No common perpendicular-bisector, exact-off-circle, equality-only, or cyclic-order core was found. `analyze.py --check` and `MECStraddlingTwoRowValidation.lean` replay; the latter has only the three core axioms. This is a ruled-out producer lead, not convergence to closure. |
| ATAIL-EQUILATERAL-THIRD-ROW | DONE-TOTAL-NORMAL-FORM 2026-07-14 | ATAIL-GLOBAL-K4-CONTINUATION; `EquilateralResidual`; sibling U5 theorem-bank preflight | Package a realizability-safe global-K4 continuation and total hit classification at a remaining support point. | `EquilateralSecondGeneration.lean` kernel-checks the fixed-anchor deletion trichotomy and paired exact deleted-row producers. The now packet-generic `ThirdRowProfileBank.lean` kernel-checks `low_hit_or_live_apex_pair_profile`: every generated outside-member row is low-hit on `{z1,z2,oppApex2}`, exact `{z1,oppApex2}`, or exact `{z2,oppApex2}`. `LeafPacketRebase.lean` checks transport from the parent-local packet without identifying it with `D.packet`. Three hits and `{z1,z2}` close; the two apex-pair states remain because exact strictly-convex models realize them. All new axiom closures are exactly `propext`, `Classical.choice`, and `Quot.sound`. |
| ATAIL-ROBUST-TRANSITION-CLASSIFIER | CHECKED LOCAL CLASSIFIER; JOINT GLOBAL COUPLING OPEN 2026-07-14 | ATAIL-EQUILATERAL-THIRD-ROW; concrete parent `Hcritical`; two known bisector centers | Refine every surviving apex-pair state into blocker deletion-survival or alignment with a known bisector center, then prove that the joint state collection across the generated rows cannot persist under the full parent geometry. | `scratch/atail-force/robust-classifier-target/RobustClassifierTarget.lean` kernel-checks `source_blocker_survives_or_eq_known_commonPair_center` and the one-/two-endpoint selected-row classifiers. A genuinely third blocker center closes by `Dumitrescu.perpBisector_apex_bound`; otherwise the state is exact survival/alignment. The next bounded mining object is the joint transition core `LowHit` versus `ApexPair + blocker survival/alignment`, retaining the same parent map. It must return an existing terminal packet or `False`, not eliminate one realizable profile in isolation. Report: `scratch/atail-force/robust-classifier-target/REPORT.md`. |
| ATAIL-JOINT-TRANSITION-CORE | CHECKED-SCRATCH DISPATCH, COMPOSITION, AND PROFILE PRUNING; DEPENDENT BRANCH PRODUCER OPEN 2026-07-14 | ATAIL-ROBUST-TRANSITION-CLASSIFIER; continuation geometry; concrete parent geometry | Select one continuation dispatch and eliminate its actual routed output; in the equilateral output, eliminate the reduced paired state. | `FrontierContinuationDispatcher.lean` kernel-checks the source bridge and routes a chosen continuation pair to cross survival, non-equilateral `CommonDeletionTwoCenterPacket`, or `JointTransitionCore`. `joint-profile-elimination/` reduces the third output to `LowHit` on either row or reverse mixed; `low-hit-residual/` reduces a reciprocal fresh pair to center collision/support alignment; `mixed-parent-coupling/` reduces reverse mixed to an apex-shell hit plus one cap-dependent same-side blocker inequality. `unified-parent-coupling/` remains a checked sufficient adapter, but its arbitrary-map and universal-`K/P` quantifiers make it operationally broader than the choice-explicit surface. No producer constructs a branch contradiction yet. All stated Lean reductions use only the three core axioms. |
| ATAIL-CRITICAL-SYSTEM-REBASE | PRODUCTION TRANSPORT CORE 2026-07-16; LATE-CHOICE SELECTOR OBSTRUCTION CHECKED 2026-07-18; THIRD-SOURCE PRODUCER OPEN | `CriticalPairFrontier`; `CriticalShellSystem.overrideAt`; `global-mutual-favorable-system-choice/`; frontier dispatcher; parent second-large-cap/frontier extraction | Use a choice-explicit frontier/continuation/system order only after producing a genuinely new source row through the equal-blocker fiber pair; do not count selection itself as progress toward `False`. | Production `ATail/CriticalSystemRebase.lean` transports a frontier to every critical system with only the three core axioms. The checked late-choice audit proves that saturating the common shell stutters at its old blocker, pointwise override hits both fiber sources only if the missing equality is already present, nontrivial minimal-deletion cores are not installable, and singleton pair-source overrides destroy the old equal-blocker fiber. The remaining closing-core route must produce a third source `J` whose actual row contains both sources and whose center/common blocker have the same-cap placement. Rebase is source-valid infrastructure, not closure force. |
| ATAIL-PACKET-REORIENTATION | CHECKED-SCRATCH 2026-07-15; PHYSICAL NORMALIZATION AND FRESH FRONTIER EXISTENCE DONE; CROSS-FRONTIER COUPLING OPEN | CP-built second-large-cap witness; `U2NonSurplusSqueeze.NonSurplusSwap`; arbitrary-packet frontier extractor | Remove left/right cap-index casework and determine exactly what frontier data can survive the swap. | `PacketReorientationAudit.lean` proves that any physical non-surplus cap `CP.capAt j` can occupy the `oppCap2` role with `S.oppositeVertexByIndex j` as `oppApex2`, preserving carrier and physical surplus cap/apex. `CriticalPairFrontierSwapAudit.lean` then proves two complementary facts. Same-pair transport is impossible: the old pair has unequal radii at the apex which becomes the swapped first apex. Fresh reconstruction is already available from `exists_criticalPairFrontier_of_K4`, and its physical projection has second apex `S.oppositeVertexByIndex j`. Root validation uses only the three core axioms. No theorem preserves the original numeric label, refines `card >= 5` to exact five, or couples the fresh pair/radius/blockers to the old frontier or chosen cap. That coupling—not more index adjudication or frontier existence—is open. |
| ATAIL-CROSS-SURVIVAL-SOURCE-NORMAL-FORM | CHECKED-SCRATCH 2026-07-14; COMMON-DELETION OR EXACT APEX-ALIGNMENT RESIDUAL | Concrete `CriticalPairFrontier`; cross-survival dispatch; common critical system; global K4 continuation | Replace the raw cross-survival row by an existing two-center packet or a named prescribed-deletion alignment packet. | `global-source-selection/GlobalSourceSelection.lean` proves `crossSurvival_commonDeletion_or_apexCriticalAlignment`: every actual cross dispatch yields one of three `CommonDeletionTwoCenterPacket` variants, `ApexDoubleCriticalResidual`, or `DeletedBlockerApexAlignment`. The earlier broad surplus localization is eliminated; both residuals identify the critical source/blocker with `S.oppApex2` and retain the exact prescribed deletion failures or apex-row/shell support equality needed by the h4/h5 adapters. This is root-recompiled with only the three core axioms. Consumption of the common-deletion and two alignment packets remains open; no production sorry closes. |
| ATAIL-ORIGIN-COMMON-DELETION-PROGRESS | DONE AS ROW BOUNDARY; EXACT ARMS NONTERMINAL; SUPERSEDED BY GLOBAL DELETION-CRITICAL-FIBER CONSUMER | production refined common-deletion modules; exact off/on-radius nonreturn audits; global parent geometry | Preserve the arm facts as regressions, but consume their common first-apex robustness consequence rather than dispatching another per-arm row theorem. | Exact audits show every arm stops at omission, allowed reflection, physical return, or another third-center common deletion. Production proves `firstApexFullyDeletionRobust`, excludes the first apex from the blocker-map image, and forces a two-source deletion-critical fiber. One-row classification is nonterminal and same-center shell generation is support-locked. Ablation rejects the anonymous shared-support/order packet and arbitrary shell-complement bisection as primary targets because neither uses the fiber's source criticality. The active theorem is the full parent-arm critical-fiber contradiction; anonymous row production and recursion are invalid targets. |
| ATAIL-APEX-ALIGNMENT-OMISSION-CONSUMER | CHECKED-SCRATCH 2026-07-14; EXACT IFF TARGET, DISTINCT-RADIUS/ROLE PRODUCER OPEN | `ApexDoubleCriticalResidual`; `DeletedBlockerApexAlignment`; late system override | Normalize both cross alignment outputs and identify the smallest genuinely new closing incidence. | `ApexAlignmentConsumer.lean` turns both outputs into `DeletedApexCriticalCertificate`; its apparent h5 equality is already the parent apex-pair radius equality. `DeletedApexOmissionProducer.lean` proves `deletedApexOmission_iff_distinctApexRadiusClass`: under the certificate, an apex row omitting the deleted endpoint exists iff `S.oppApex2` has a distinct positive radius whose ambient class has card at least four. The parent radius class is exactly four and all same-radius selected rows have the parent support. Retained rows have either the right center/wrong polarity or right omission/provably wrong center. The direct distinct-radius terminal and all adapters root-compile with only the three core axioms. A kernel-checked finite-incidence regression shows the retained local rows plus an abstract five-point second cap do not force the target; full MEC/global-K4/no-`IsM44` geometry must produce the distinct radius or role alignment. No production sorry closes. |
| ATAIL-GLOBAL-MINIMALITY-CAP-CROSSING-AUDIT | BARE-B CARD-11 PURE KALMANSON/FARKAS COVERAGE BLOCKED; CAP-AWARE CARD-14 NO-BANK PROBES UNKNOWN 2026-07-17 | production Kalmanson consumers; corrected active-role direct-CNF/full-LRA audit; `FrontierLargeOppositeCapsBiApexRobustResidual`; `n14-cap-aware-kalmanson/` | Preserve Kalmanson consumers as sinks. Stop anonymous outer mining and build the next discovery object from the named frontier pair, actual physical-apex deletion rows, and common critical-map provenance; force an existing positive row-overlap/order terminal or close `L` directly. | Rank normalization corrects the spacing-sensitive raw bank to 217 active-role cycle/interlocking types. A verified card-11 structural model survives them all and admits an exact rational Kalmanson metric, so pure linear coverage of bare `B` is false. The active wrapper `L` forces `14 <= card` and starts at `(5,6,6)`. The first generic card-14 probe expanded 1,679,938 preload cuts and ended tooling-only `UNKNOWN` before any outer attempt. The cap-aware no-bank successor adds seventeen proved center-cap bounds and six valid endpoint bounds; smoke gates pass, but 30-second and 60-second runs learn 73 and 169 distinct dead order schemas and still end `UNKNOWN`. There is no SAT, UNSAT, coverage, Euclidean, or source-closure conclusion. No production `sorry` is closed. |
| ATAIL-LEMMA81-LIVE-OCCURRENCE | CONSUMER DONE; LIVE OCCURRENCE PRODUCER OPEN; CARD-14 CAP-INCIDENCE REGRESSION SAT 2026-07-17 | production `FivePointCircleIsoscelesOrderBridge.false_of_core_of_ccw`; fixed 555/654 230/230 bank matches; `lemma81-n14-occurrence-audit/` | From `L`, force actual rows with `Z in row(W)`, one common `X in row(W) inter row(Z)`, the remaining row points `F,P`, and cyclic order `W < F < P < X < Z`; otherwise close `L` directly. | The exact `(5,6,6)` finite fixture retains both physical classes, common-deletion rows including the first-apex double row, blocker omissions/collisions, source-locked four-rows, and sharp cap-local bounds, but has zero complete Lemma 81 placements. It omits Euclidean/full-filter realization, MEC, metric criticality, global minimality, and `noM44`, so this is a producer regression rather than a counterexample. |
| ATAIL-KALMANSON-ACTUAL-FRONTIER-MATCH | CONDITIONAL FOUR- AND FIVE-POINT ACTUAL-ROLE TERMINALS KERNEL-CHECKED; NO UNCONDITIONAL LIVE MATCH 2026-07-16 | `CriticalPairFrontier`; production ordinal Kalmanson bridge; shared critical map; `frontier-kalmanson-match/`; `actual-five-point-kalmanson-packet/` | Expose the exact source-valid antecedents of the actual-role Kalmanson consumers, or prove a kernel-checkable coverage theorem into existing terminals. | The four-point audit proves that the actual first apex and blocker at `pair.q` cannot both be equidistant from `pair.q,pair.w` in the directed CCW order; the live frontier never supplies that equality and order together. The five-point audit fixes actual roles `O=oppApex1`, `A=oppApex2`, `Y=centerAt(pair.q)`, `E=pair.q`, `C=surplusApex` and source-faithful rows at `E,C,O`. Three of six support memberships are automatic; the first missing cross-incidence is `O ∈ support (H.selectedAt E)`, and two blocker-map edges, two further cross-incidences, and the directed order remain independently absent. Both adapters have only `propext`, `Classical.choice`, and `Quot.sound`. These are complete consumers, not near-term producers; no smaller Kalmanson match is hidden in the current frontier and no production `sorry` is closed. |
| ATAIL-NONEQUILATERAL-SUPPORT-NORMAL-FORM | CHECKED-SCRATCH 2026-07-16; METRIC HINGE AND CURRENT-KERNEL ADAPTER DONE; COMMON-APEX LOCK AND REVERSE EQUALITIES OPEN | Non-equilateral continuation output; exact cap partition; late critical-system expansion; current U5 metric kernel and sibling-bank audit | Classify the native rows and identify the actual geometric content before treating the five-point bank pattern as a producer. | `nonEquilateralSupportDichotomy` gives surplus-heavy or two exclusive strict witnesses, and `NonEquilateralGeometryConsumer.lean` upgrades the strict witnesses to metric hinges. `StrictWitnessBankCompletion` is a sufficient terminal—one common point plus three reverse equalities. The later equal-source/live-center correction proves the common point is `p` and sends the completed packet directly to import-reachable production theorem `Problem97.u5_equilateral_opposite_point_metric_incompatibility`; no sibling import is needed. An exhaustive fixed-`f = p` audit checks all 24 role bijections and finds minimum deficit exactly three, attained only by the natural map and its reflection. No current theorem produces those equalities. `CommonSupportGeometry.lean` proves a hypothetical first common point is an ambient equilateral apex over `z₁z₂`, while the converse needs both selected four-subsets to be radius-saturated; on the actual equal-source branch, the supports instead intersect exactly in `{p}` with `p ∈ oppCap2`, so a strict-`oppCap1` common hit is impossible. The exact 16-point strict-convex/MEC/cap regression has the strict hinge, zero overlap, and selection failure, but omits the live MEC-to-cap binding, all-center K4, and total CSS; it is not a parent counterexample. The surplus-heavy nearest sink needs two strict surplus-interior hits plus a second `oppCap2` bisector center. No arm is closed. |
| ATAIL-REVERSE-MIXED-CHOICE-FREE-SHELL | CHECKED-SCRATCH 2026-07-15; UNIFORM DELETION/RADIUS/SUPPORT EQUIVALENCE DONE; CAP-FIVE OPPOSITE-APEX ROLE KERNEL-REFUTED | Reverse mixed `JointTransitionPacket`; global K4; no-removability; favorable late-system rebase; full MEC/cap/no-`IsM44` parent | Reduce every aligned blocker arm to the same exact source-deletion/omission/distinct-radius/different-support producer and eliminate overstrong cap-role transports. | `mixed-parent-producer/MixedParentProducer.lean` and `ReverseMixedResidualReduction.lean` give the five shell forms. `SharedDeletionRadiusBoundary.lean` proves deletion survival ↔ source-omitting row ↔ distinct positive four-capable radius ↔ existence of a selected support different from the exact shell, with cross-apex and all four reverse-mixed role specializations. Under the blocked certificate, `reverseMixedAligned_selectedRow_collapses` proves every arbitrary global-K4 row at the blocker is exactly the retained `P.rowX`/`Ku`/`P.rowY`/`Kv` support. `CapFiveRoleClassification.lean` proves every aligned center `x,u,y,v` differs from the opposite Moser vertex of every non-surplus cap, so `CapFiveOppositeApexBlockerRole` is uniformly impossible and exact card five cannot rescue the bridge. The remaining valid target is non-apex-specific deletion survival, omission, or a distinct radius; the separate cross-apex route still lacks its cap-index/cardinality coupling. Root Lean checks use only the three core axioms. No `False` or production closure follows. |
| ATAIL-PRESCRIBED-DELETION-EDGE | DONE-NEGATIVE AS INTERMEDIATE PRODUCER 2026-07-14; EQUALITY-OR-SURVIVAL NORMAL FORM KERNEL-CHECKED | Retained exact selected row; existing h4/h5 metric-core consumers | Kernel-prove the branch-complete local forms `dist d c = dist d f ∨ HasNEquidistantPointsAt 4 (D.A.erase f) d` and `dist f a = dist f d ∨ HasNEquidistantPointsAt 4 (D.A.erase d) f`, plus the actual-map alignment adapters. | `scratch/atail-force/prescribed-deletion-edge/PrescribedDeletionEdge.lean` passes with exactly `propext`, `Classical.choice`, and `Quot.sound`. If the prescribed right endpoint lies outside the exact selected support, that same row survives its deletion. Therefore forcing deletion failure would already contradict an explicit K4 witness; it cannot serve as an intermediate h4/h5 producer. The equality arm enters the existing metric-core consumer, while the survival arm stays in the parent robust theorem. Its former 23-shadow replay is historical evidence pinned to stale checkpoint SHA `5b661a15...`; all 23 stored survivors now hit the current complete bank, 18 also violate the proved own-cap cut, and none is reused by the synchronized refresh. Do not use its old h4/h5 split as current evidence. |
| ATAIL-BIAPEX-CONTINUATION-REFRESH | SYNCHRONIZED CURRENT-BANK CHECKPOINT VERIFIED; 10 SAT / 13 NODE-CAPPED / 0 UNSAT; NO PRODUCER | ATAIL-GLOBAL-K4-CONTINUATION; proved selected-row own-cap bounds; full current `producer_bank` common-system scan | `biapex-continuation-current-bank-refresh/current_producer_bank_refresh_100k_checkpoint.json`, SHA-256 `02a3a92b6241d42841bdbbacfe35005e55b0cd609ce981ab381945c98eba8a66`, independently reruns all 23 fixed `(5,5,5)` shards at 100,000 nodes with no survivor reuse. It records 10 SAT finite shadows, 13 node-capped indeterminate shards, 0 UNSAT, 1,838,367 stored nodes, and 27,535 complete leaves through the live bank. All 10 survivors and cap-mutation gates replay clean. | The 10 survivors contain 12 strict-pair grids; every existential-best and universal-worst deficit is exactly one and no direct terminal fires (`current_producer_bank_grid_analysis.json`, SHA-256 `c0ad7b01207516719f80f9f996c70d0a5b1b2d24e859cf22db04012f32e7d5ce`). Separate MARCO-style row deletion on the six legacy bank-clean fronts found 10 three-engine UNIT frontiers; the six smallest have 7, 7, 8, 9, 9, and 8 rows and are not certified minimal. The finalized invariant bank audit finds no exact match. One recurring U5 consumer is one distance-class join short on all six, but a fixed `ht1q`/apex-bisector equality covers only shards 0, 1, 2, 16, and 20; shard 3 instead has `4+2` and `1+5` radius partitions, so it has no single fixed-slot producer in common with the other five. `u1TwoLargeCapObstruction` is one equality short only on shards 0 and 16, where the apex-normalized completion is `d(1,2)=d(1,10)`. All 101 reported mappings replay through `six-frontier-bank-deficits/checkpoint.json`. These are exact finite-shadow/CAS/theorem-discovery facts, not an equality producer, Euclidean realization, Lean theorem, card-11 cover, or uniform K-A proof. The old `ad2400...` checkpoint remains an immutable older-bank comparison only. |
| ATAIL-ROBUST-COUPLING | OPEN PARENT-SCOPED PRODUCER; ONE EXTENSION-STABLE PLANAR U5 CUT KERNEL-CHECKED; CORRECTED CARD-11 OUTER UNKNOWN; CURRENT BANK NONUNIFORM | production bi-apex/Kalmanson modules; production `CriticalFiberClosingCore`; `whole-carrier-planar-rank-cegar/`; scratch whole-carrier extractor/live adapter and n12/n13 regression | Prove the full-parent existential producer. Treat finite outer carriers as regression tests and add a schema only when it transports an existing checked consumer and advances a generic occurrence theorem; do not restart unbounded literal CEGAR. Decide the corrected compressed-217-plus-planar card-eleven outer before invoking a nonlinear oracle on another table. | The auxiliary-base-collision theorem yields a kernel-checked six-role/four-row planar cut and exactly rejects the former full-Kalmanson survivor. With that cut, the corrected 217-type card-eleven outer is `UNKNOWN` after 300 seconds. A separate 231-to-235 chain has four independently replayed Boolean SAT tables, each then exact-QF_LRA UNSAT with verified deletion-minimal Farkas cores. This work is scoped to `FrontierBiApexRobustResidual`; it does not model the unique-radius arm and closes no source `sorry`. Literal schemas remain path-length- and carrier-dependent, so bounded exclusions are not uniform live coverage. |
| ATAIL-ROBUST-MINIMAL-DELETION | PRODUCTION FINITE CORE AND GENERIC GLOBAL-MINIMALITY BRIDGE; CHECKED-SCRATCH THREE-WAY PARENT REDUCTION 2026-07-16; EXACT CONSUMER DEFICITS RECORDED; NONTERMINAL | production `ATail/MinimalDeletionCore.lean`, `ATail/GlobalMinimalDeletion.lean`, and `ATail/CommonDeletionTwoCenter.lean`; `global-minimal-deletion-core/`; `robust-second-apex-minimal-deletion/`; `robust-minimal-consumer-bank/`; live `SurvivorPairRelocationPacket`; upstream `D.Minimal` | Reuse the stopped lane's collision / packed multi-core / installed-singleton split only when a geometric consumer needs it; do not re-prove it or call the dispatcher a contradiction. | Production now contains the generic MUS-style `MinimalDeletionCore`, its pairwise-disjoint exact shells, the two-shell cap-at-least-six consequence, the common-deletion two-center packet, and the global bridge from a prescribed deletion set to a fresh shared-radius pair or minimal core. The stronger scratch parent bridge produces a fresh strict-cap center and either a bounded shared-radius collision, a packed multi-source core, or an installed singleton blocker omitting one frontier target. `robustSecondApexMinimalDeletion_reduction` preserves the robust-radius classification and physical-second-apex survival for every deleted source. The first missing facts are exact: collision lacks physical-second-apex co-radiality of the actual pair; multi-core lacks a repeated outside pair at a second same-cap center; installed singleton can reproduce robustness and needs a genuine rank/nonreturn theorem. The dispatcher is not a contradiction, and fixed Kalmanson remains disjoint from this cap-at-least-six endpoint. |
| ATAIL-EXACT-FIVE-LOW-HIT | DONE-PRODUCTION REDUCTION AND ROW NORMAL FORM 2026-07-16; FEEDS ORIGIN COMMON-DELETION; NO SORRY CLOSED | production `ATail/LargeCapUniqueFive.lean`, `ATail/TwoCenterCapLocalization.lean`, `ATail/LargeCapUniqueFiveCrossIncidence.lean`, `ATail/LargeCapUniqueFiveLowHit.lean`, and `ATail/LargeCapUniqueFiveCommonDeletionNormalForm.lean`; full radius class of cardinality five at `S.oppApex2`; unused cap source and its actual deletion-critical row | Prove the choice-invariant complement of the impossible two-hit packet, normalize the retained rows, and expose every common deletion forced without a new source-indexed row. | Production supplies at least three physical strict-cap hits and an unused cap source outside the physical class. The unused source's actual row can contain at most one of those hits, so `nonempty_twoCommonDeletionSources_of_largeCapUniqueFive` selects two distinct omissions. The row normal form proves both stored first supports equal the actual unused-source support, both physical supports are the corresponding erasures of the exact-five class, and their intersection has cardinality three. `exists_third_commonDeletionSource` selects a point in that shared three outside the actual support and proves deletion survival at both centers. `criticalRow_eq_selectedAt` closes the row-coherence API. The relevant theorems use exactly `propext`, `Classical.choice`, and `Quot.sound`. No existing bank consumes this canonical renewable packet, so closure continues at ATAIL-ORIGIN-COMMON-DELETION-PROGRESS rather than projecting it to redundant bare robustness. |
| ATAIL-ROBUST-TWO-RADIUS-MINIMAL-TRANSITION | CHECKED STRICT-PAIR THREE-ARM NORMAL FORM 2026-07-16; LOCAL INTERVAL / SINGLETON LOOP / UNEQUAL CORE CONSUMERS OPEN | `robust-two-radius-geometry/`; `robust-two-radius-center-localization/`; two support-disjoint selected four-classes at `S.oppApex2`; retained critical map; `D.Minimal` | Prove nested interval/nonreturn for the localized collision, or directly consume the unequal two-source core; do not advertise generic robust-center iteration as descent. | `exists_strictPair_minimalDeletionNormalForm` applies minimality to two chosen strict `oppCap2` members of one physical row. It returns: an equal-radius collision with fresh robustness and a local ordered-cap interval placing the fresh center strictly between the pair; a singleton core converted to an exact common-deletion packet; or an unequal-radius card-two `MinimalDeletionCore` with two disjoint exact shells, fresh robustness, physical deletion survival, and finite cap/Moser packing. None is terminal. The checked three-cycle regression shows local between-data alone is not a global rank; the singleton can return to robustness; and the unequal core has no common fresh-center radius for the interval argument. The next theorem must add nested-history/nonreturn or a global cap/MEC/critical-row coupling for the unequal core. |
| ATAIL-ROBUST-CRITICAL-MAP-REGRESSION | SAT FINITE STRUCTURAL SHADOW; BANK-CLEAN SEARCH INDETERMINATE 2026-07-16 | `robust-critical-map-regression/`; profile `(6,6,5)` | Test whether global selected rows plus the retained critical map already contradict two-radius robustness before adding minimality or Euclidean fields. | The base represented surface is SAT at card 14/cap 6 with global K4 selected rows, a total nonself blocker map, exact row locking at blocker-image centers, source membership, robust-apex image exclusion, cap-one-hit candidate domains, pair/bisector/cyclic-separation constraints, and two disjoint physical-apex rows. It omits coordinates, radii, MEC, `hNoM44`, full no-q-free semantics, frontier history, and `D.Minimal`. The first witness has current bank matches; 20 sampled verifier-valid completions all bank-match, while the bounded bank-clean search remains indeterminate, not UNSAT. This identifies minimality as the smallest obvious missing parent field but does not prove it sufficient. |
| ATAIL-ROBUST-SECOND-APEX-BANK | EXACT PROFILE-LOCAL NEGATIVE 2026-07-16; NO LIVE CAP ≥6 COVERAGE | `robust-second-apex-bank-audit/`; corrected 101-shadow checkpoint; endpoint one-hit theorem | Test the exact robust radius normal form against the corrected bank and locate the cardinality boundary without promoting a fixed-profile result to live coverage. | The checkpoint profile is `(8,4,5)`, with physical `oppCap2.card = 4`. Exact enumeration gives 28 admissible four-supports, all sharing the two strict opposite-cap points, 0 five-supports, 0 disjoint four-support pairs, and therefore 0/101 robust extensions. The threshold replay is sharp: cap five admits 28 five-supports and cap six admits 123 five-supports plus 1,512 disjoint-four pairs. Thus the 0/101 result is only the already-routed cap-four case and gives no negative evidence against the live cap-at-least-six endpoint. All 101 full stored completions have current-bank/Kalmanson/ordinal-cycle matches, but 0/101 fixed parent-local packets do, so no live coverage theorem follows. The Lean table is compiler-evaluated via `native_decide` and explicitly depends on `Lean.ofReduceBool`/`Lean.trustCompiler`; the Python replay is exact within the pinned abstraction. |
| ATAIL-R-ORIGIN-TAGGED-COORDINATOR | CHECKED-SCRATCH 2026-07-16; COMPLETE ROUTING INTERFACE; NO `FALSE` HANDLERS | `LiveDangerousRetainingSystem`; source-current first-apex normal form; reciprocal swap reduction; failure-profile and F2 strict-cell normal forms | Retain anchored, reciprocal-common, and spent origin data before the lossy resolved projection; expose motive-valued elimination across every visible R branch. | `scratch/atail-force/r-origin-tagged-coordinator/OriginTaggedCoordinator.lean` defines `OriginTaggedCurrentFirstApexFixedRadiusNormalForm`, the exact origin tags, aligned and unaligned branch surfaces, and `OriginTaggedCoordinatorEliminator`; the adjacent `REPORT.md` records the exact validation and scope. It covers two-off-live positive/failure, F1/F2/F3, and F2 live-heavy/support-heavy/mixed. Direct Lean 4.27 validation is warning-free; all nine printed endpoints have only the three core axioms. Setting `Goal := False` still requires a genuine handler for every constructor. |
| ATAIL-R-UNALIGNED-HANDLER | CHECKED-SCRATCH 2026-07-16; SOURCE-FAITHFUL OUTCOME AND DIRECT CONDITIONAL SINK; COMMON-CAP PRODUCER OPEN | `OriginTaggedCoordinator.lean`; exact first/live rows; two-circle intersection; ordered-cap outside-pair uniqueness | Retain the origin-specific unaligned fan and close it once one common cap carries two shared row points outside that cap. | `scratch/atail-force/r-unaligned-handler/UnalignedHandler.lean` proves first-row/live overlap at most two, extracts two distinct off-live first-row points, and retains the coherent anchored/reciprocal U5 fan or spent live-status split. `false_of_unalignedCommonCapLiveMultiplicity` is a direct `False` sink. `RegressionGate.lean` shows that row counts and individual cap coverage do not force a cap containing both centers. The remaining theorem must use global cap/order, MEC, or another named cross-incidence. |
| ATAIL-R-TWO-OFF-LIVE-HANDLER | CHECKED-SCRATCH 2026-07-16; LOSSY PAIR INTERFACE REPAIRED; PAIR ARM ROUTED TO SWAPPED `FA-UNIQ4`; BOTH SUCCESSORS REDUCED TO FULL SINGLE-DELETION ROBUSTNESS | Origin-tagged aligned two-off-live branch; second-apex radius transport; shared critical map; swapped `FA-UNIQ4` interface | Preserve both sources as off-live members of the exact second row, route the prescribed-pair arm to its existing unique-row terminal, and expose the successor as the robust physical-second-apex residual. | `scratch/atail-force/r-two-off-live-handler/RTwoOffLiveHandler.lean` proves that a same-radius successor raises the ambient second-apex class to cardinality at least five and an alternate-radius successor has support disjoint from the retained row. Either shape implies `FullyDeletionRobustAt D S.oppApex2`; the prescribed-pair arm reorients directly to swapped `FA-UNIQ4`. The conditional theorem taking `HasCriticalDeletionAt D S.oppApex2` is logically correct but not a producer route, because that input is exactly the negation of robustness. Cap five robust routes to swapped `FA-UNIQ5`; the actual large-cap residual needs a direct global consumer. |
| ATAIL-R-F1-F3-HANDLER | CHECKED-SCRATCH 2026-07-16; COMMON FRESH-SOURCE PRODUCER FULLY REDUCED TO PROTECTED `FA-UNIQ4/5` OR CAP ≥6 | Aligned F1/F3 profiles; exact deleted critical support; live dangerous row; second-cap profile; cap-five rigidity | Consume the unique outside-both source uniformly and retire the local strict-placement fan as the primary boundary. | `scratch/atail-force/r-f1-f3-handler/F1F3Handler.lean` produces an origin-retaining off-live `FreshCriticalSource` and then either a successor common-deletion packet or `PrescribedCriticalAt source oppApex2` with support exactly the retained second row. `F1F3OutcomeReduction.lean` routes the critical outcome to swapped `FA-UNIQ4`, an exact-card-five successor to a fresh swapped `FA-UNIQ5` frontier, and every remaining successor to the exact residual `6 ≤ S.oppCap2.card` with its radius geometry retained. `f1SingleOutsideProtectedOrLargeCapOutcome` and `f3SingleOutsideProtectedOrLargeCapOutcome` are core-axiom clean. Complement-heavy/mixed placement mining is no longer load-bearing; only the cap-at-least-six successor remains in R. |
| ATAIL-R-ANCHORED-F2-LIVE-MIXED-HANDLER | CHECKED-SCRATCH 2026-07-16; LIVE-HEAVY FULL-PARENT SURFACES CONSTRUCTIBLE; WHOLE LIVE-CENTER METRIC CONSTRUCTOR CLOSED; MIXED EXACTLY THREE RESIDUALS | Anchored F2 provenance; source-faithful three-row chain; `scratch/atail-force/r-f2-directed-original-q-row/`; U5 theorem-bank audit | Expand global K4 after deleting the actual original source `q`; retain the exact generated center, q-deleted/q-critical constructor, raw radius filter, physical middle row, and full parent cap/MEC/frontier/origin data. | `F2LiveMixedHandler.lean` supplies the exact live-heavy and mixed physical rows. The source-extraction, off-live-deficit, raw-criticality, continuation, cap-escape, outside-middle split, and confined-terminal chain remains source-faithful. `generated-successor-parent-entry/GeneratedSuccessorParentEntry.lean` proves that the actual native live-heavy callback constructs both full-parent generated-successor surfaces without assuming either generated row or successor; the mixed callback returns the honest `False ∨ successor surface ∨ MixedConfinedResidual` trichotomy. `qcritical-metric-terminal/` closes q-critical/q-critical `MetricResidual`, and `equal-source-metric-terminal/` closes the complete equal-source-at-live-center constructor uniformly by descending both full-row companion incidences to raw support and applying one shared ordered-cap contradiction. `OriginalQMixedConfined.lean` still leaves exactly three two-common-point mixed residuals. Uniform named-hit and live-center metric-producer mining are retired. |
| ATAIL-R-F2-GENERATED-SUCCESSOR | OPEN FINITE GEOMETRIC CONSUMER; FIVE-WAY POSTMIX SOURCE SPLIT, FOUR Q-CRITICAL ENDPOINT CLASSES, LIVE-CENTER/SECOND-APEX METRIC TERMINALS, AND HISTORY-RETAINING REROUTE CLASSIFIER CHECKED 2026-07-16 | `OriginalQOutsideMiddleSuccessor`; `OriginalQGeneratedSuccessorPair.SourceSplit`; `PostmixSourceSplit`; `HistoryRetainingPostmixSourceSplit`; `ReducedGeneratedSuccessorFrontier`; full anchored origin/frontier/cap/MEC parent surface | Consume only honest branch outputs: the four global-source-selection endpoints for q-critical cross survival; explicit off-`oppCap2` placement plus reciprocal membership where applicable; a companion-omission residual; or either concrete non-apex outside-middle reroute. Retain `false_of_originalQOutsideMiddleSuccessor` as the umbrella target. | Each successor source belongs to its actual generated support, lies outside the live row and physical middle row, and preserves K4 at `p` and `S.oppApex2`; this polarity forbids reuse of `OffLiveCommonDeletionSuccessor`. For q-critical/q-critical, the metric arm is `False` and full-parent continuation reduces to the two oriented cross-deletion-survival arms. The global-source-selection normal form initially had three `CommonDeletionTwoCenterPacket` variants, `ApexDoubleCriticalResidual`, and `DeletedBlockerApexAlignment`; `qcritical-endpoint-integration/` closes the alignment endpoint because its blocker would be the deleted `q`, leaving exactly the two escape/common-deletion orientations, `ApexDoubleCriticalResidual`, and relocated-blocker common deletion. The paired rank reduction proves an outside source is omitted by the opposite generated row and, for equal sources, one shared ordered-cap argument rules out both companions being present. The equal-source live-center constructor closes uniformly. The second-apex constructor also has no metric residual: homogeneous and mixed pairs close, leaving only reroutes at `x` or `y`. `PostmixSourceSplit` therefore retains distinct sources, the two oriented equal-source cross-survival arms, and those two concrete reroutes. `ReducedGeneratedSuccessorFrontier` now carries that split directly when at least one row is q-deleted; the two-q-critical arm still carries an oriented cross survival and four-class endpoint normal form. `postmix-reroute-consumer/` repairs the projected split by retaining equal predecessor sources at the physical second apex and the equilateral history. Each reroute is either outside `oppCap2` and omitted by the opposite full row, or inside `oppCap2` with a certified opposite-side rank move; opposite-row incidence in the outside case is already a direct common-outside-pair contradiction. The surviving rank move still lacks a fixed cross-step cap presentation, center-index link, decreasing measure, and no-wrap theorem. The old `StrictOppCap1CommonHit`, surplus-heavy completion equality, three-reverse-equality packets, and mixed complementary packets are not producer targets. Do not infer cap or metric facts from support omission or recurse unranked through the generic classifier. |
| ATAIL-R-F2-SECOND-APEX-EQUILATERAL | LOCAL METRIC RESIDUAL CLOSED 2026-07-16; ALL FOUR CONSTRUCTOR PAIRS REDUCED TO FALSE OR REROUTE; FRONTIER WIRING CHECKED | `MixedSecondApexEliminator.lean`; `SecondApexPostmixWiring.lean`; exact q-deleted/q-critical generated-row constructors; physical second-apex row | Remove the two mixed complementary packets and replace the old `equalSource_atSecondApex` frontier arm by concrete non-apex outside-middle reroutes. | Homogeneous constructor pairs were already closed or rerouted. For either mixed packet, the support-only points `a,b` lie with the second apex `O` on the physical row, and the generated equalities give `y+a=O+x` and `x+b=O+y`; hence `a+b=2O`, making three distinct carrier points collinear against convex independence. Both mixed `False` theorems and `secondApexRerouteReduction` are kernel-clean. `PostmixSourceSplit` removes the old second-apex constructor, retains only reroute-at-`x`/`y`, and converts both to `OriginalQOutsideMiddleSuccessor`; `ReducedGeneratedSuccessorFrontier` now carries this split directly. The local residual is closed, but the reroutes remain parent-consumer obligations and no production `sorry` is closed. |
| ATAIL-R-ANCHORED-F2-SUPPORTHEAVY-HANDLER | CHECKED-SCRATCH 2026-07-16; NATIVE DEPENDENT INTERFACE; EIGHT EXPLICIT CALLBACKS; NO FULL F2 `FALSE` | Anchored provenance lift; support-heavy coupling; generated escape/metric routing; origin-tagged coordinator | Keep the anchored aligned packet on `alignedSharedRowPacket` and consume the exact generated-row residual without a dependent cast through the generic live-center packet. | `scratch/atail-force/r-anchored-f2-supportheavy-handler/AnchoredF2SupportHeavyHandler.lean` defines a native anchored and full origin-tagged coordinator eliminator. The both-q-deleted case becomes exact repeated common deletion; each mixed case routes to cross survival, non-equilateral, or equilateral; both-q-critical routes only to cross survival because its metric residual is already contradictory. All six printed endpoints have only the three core axioms. Eight callbacks remain, so this is a nested branch reduction rather than R closure. |
| ATAIL-R-CAPTURE-INSUFFICIENCY | CHECKED-SCRATCH 2026-08-04; INTERFACE CONSISTENCY KERNEL-CHECKED; CAPTURE NOT PRODUCIBLE FROM ENUMERATED FRONTIER FACTS | `double-survival-branch-producer/DoubleSurvivalBranchProducer.lean`; `RobustLiveBankAdapter`; frontier packet fields; global K4; `CriticalShellSystem` | Certify that the R-branch capture packet `StrictSurplusRowCapturesErasedPair` cannot be produced from the incidence facts reachable at the double-survival normal-form frontier, and provide a solver-time triage tool for candidate couplings. | `scratch/atail-force/capture-insufficiency/` holds a 39-field abstract signature (`CaptureIncidenceInterface.lean`) with the generic refutation `false_of_abstractCapture`, a `Fin 17` countermodel proving every fact field by kernel `decide` (`CaptureIncidenceCountermodel.lean`), and an `(ℝ², ℝ)` realization proving each field from its named real source (`CaptureIncidenceRealization.lean`). All printed endpoints close over exactly `propext`, `Classical.choice`, and `Quot.sound`; no `sorry`, no `native_decide`. Consequence: incidence-only mining at the current normal-form interface cannot close R; a closer must import a coupling outside the signature (MEC/convex order, cap-triple partition structure beyond the listed membership facts, an `oppApex2`-side one-hit analogue, or shell label/provenance data). Candidate couplings are falsified in solver time by adding them as constraints in `search_model.py` and checking countermodel survival before any Lean dispatch. Off-spine; no production `sorry` changed. |
| ATAIL-R-CONTINUATION-OBJECT-GATE | FAILED BEFORE ENCODING 2026-07-15; NO FORMULA OR SOLVER RUN; SUPERSEDED BY SOURCE-FAITHFUL ORBIT GATE | ATAIL-ROBUST-COUPLING; `exists_doubleSurvivalBranchNormalForm`; `nonempty_frontierContinuationDispatch`; `UnifiedFrontierParentCoupling` | Before any paired-row scan, prove a full-parent R transition which returns a checked terminal or an invariant-preserving strict rank/adjacent-cap advance. | `docs/archive/2026-08-03-doc-sweep/audits/2026-07-15-r-global-continuation-object-gate.md` records that the proposed common two-row target is not source/consumer faithful. The source constructs only `(R B0/B1/B2) x (CrossSurvival/NonEquilateral/Equilateral)`; it does not couple the robust pair to either anonymous continuation row. Repeated outside-pair support is an unsourced conditional terminal, the original-U5 role has no legal live map, and a raw same-cap edge is nonterminal and lacks its endpoint equality. Do not encode pinned `G,K`, continue R CEGAR, or treat a bank miss as a terminal negation. The later actual-blocker work supersedes the old final diagnosis: source-exact successor preservation and a finite orbit are now proved. The remaining fields are retained-blocker provenance on terminal hits and cycle-wide cap/global-order progress on a minimal erased cycle. |
| ATAIL-R-ACTUAL-BLOCKER-TRANSITION | CHECKED-SCRATCH COMPLETE COHERENT ORBIT NORMAL FORM AND DOWNSTREAM BOUNDARIES 2026-07-16; RECIPROCAL CRITICAL ARM RECLASSIFIED AS SWAPPED `FA-UNIQ4`; ANCHORED ARM PROJECTS TO COMMON DELETION | `FixedSingleRadiusCycleAnchoredIntegration.lean`; `LeastTerminalHitReciprocalRowSplit.lean`; `FixedSingleRadiusAnchoredOrTerminalResidual.lean`; `AnchoredTwoRowCoverConsumer.lean`; `ReciprocalSwapReduction.lean` | Preserve the actual source and exact blocker rows; expose a provenance-bearing common-deletion output or the swapped unique-row dependency. | Every cycle reaches an anchored transition. The anchored cover fallback is eliminated, and every anchored transition has an off-surplus row-external source whose deletion preserves the same two rows. Thus terminal-hit versus minimal-cycle provenance is not needed to produce the next common deletion, although it may still be needed to consume it. In the reciprocal split, prescribed criticality supplies a swapped first-apex `FA-UNIQ4` branch; reciprocal common deletion remains provenance-bearing and nonterminal. All accepted adapters use only the three core axioms. No production sorry is closed. |
| ATAIL-R-DANGEROUS-RETAINING | CHECKED-SCRATCH 2026-07-16; FIRST-CENTER ALIGNMENT CHARACTERIZED BUT NOT FORCED; LIVE-HEAVY SUCCESSOR PAIR/RANK SURFACE EXPLICIT; LIVE-CENTER AND SECOND-APEX METRIC CONSTRUCTORS REDUCED | `DangerousRowCoupling.lean`; `DangerousRetainingFullParentNormalForm.lean`; failure/F2 normal forms; F1/F3, F2 original-`q`, generated-successor, and support-heavy reports | Keep the live dangerous row in the same critical system and consume exact common-deletion profiles with named source/center roles. | The aligned surface has source-faithful reductions for every F profile. F1/F3 route to protected `FA-UNIQ4/5` or an exact cap-at-least-six successor. Native anchored live-heavy constructs both full-parent outside-middle successors; their source-equality/cross-survival split and cap-rank alternatives are explicit. The q-critical/q-critical metric arm closes from perpendicular-bisector localization plus the retained non-Moser hypothesis, and the equal-source-at-live-center constructor closes for every generated-row constructor pair by raw-support companion descent plus cap order. The second-apex metric arm now reduces to reroute at `x` or `y`, so the current postmix source split has five arms. Physical mixed confinement still has exactly three constructor-indexed two-common-point residuals. Support-heavy remains eight callbacks, with q-critical boundary absorption and its both-q-critical metric arm closed. Reciprocal and spent F2 require source-faithful adapters. Anonymous support-cardinality mining, the retired uniform named-hit disjunction, impossible live-center/second-apex metric producers, omission-to-metric inference, and unranked reclassification remain prohibited. |
| ATAIL-R-FRONTIER-PROGRESS | CHECKED-SCRATCH 2026-07-16; PAIR-LOCAL FRESHNESS ONLY, NO WELL-FOUNDED RANK | `AnchoredTwoRowCoverConsumer.lean`; `AnchoredOffSurplusFrontierSuccessor.lean`; `FrontierProgressAudit.lean` | Determine whether same-radius recurrence is strict in a retained history/rank. | The successor pair differs from the current source pair and the new endpoint avoids the current source. The deleted endpoint is either retained by the terminal carrier or already erased. The retained branch yields another retained row-external source or the exact terminal three-point residual; the cycle branch explicitly reuses erased history. Because `CriticalPairFrontier` forgets predecessor and history, no global nonrecurrence or strict descent follows. A new rank must be carried in the theorem statement rather than inferred from `Nonempty CriticalPairFrontier`. |
| ATAIL-R-TERMINAL-THREE-POINT | CHECKED-SCRATCH 2026-07-16; NAMED-HIT METRIC TARGET REFUTED; TERMINAL ARM ROUTED TO COMMON DELETION OR SWAPPED `FA-UNIQ4` | `TerminalSourceFaithfulPacket.lean`; `TerminalSourceFaithfulIntegration.lean`; `TerminalNamedMetricLocalization.lean`; first-apex one-hit and exact cap-cover banks | Retain the terminal origin only as provenance for the downstream common-deletion consumer; do not mine source-circle equality or dangerous-base membership. | The source-faithful packet names `terminalSecondRowHit`, but the residual proves `dist firstCenter terminalSecondRowHit ≠ sourceRow.radius` and, in the aligned live branch, puts it outside the dangerous base. Because deleting that hit preserves the first center, global K4 at `oppApex2` yields either a fresh `CommonDeletionTwoCenterPacket` or a prescribed critical row which the fixed-surplus swap sends to `FA-UNIQ4`. Thus the terminal-only metric producer is retired. The terminal tag may still carry useful history into the common-deletion consumer and must not be discarded merely because the packet has a generic projection. |
| ATAIL-R-SPENT-ENTRY | CHECKED-SCRATCH 2026-07-16; GENERIC COMMON-DELETION PROJECTION AVAILABLE; ORIGIN DATA POTENTIALLY LOAD-BEARING | `FrontierRadiusSpentAtEntry`; `SpentEntryOriginalPairSharedRows.lean`; `biApex_two_by_two_survival_normal_form`; `CoherentContinuationCollapse.lean`; full parent cap/dangerous data | Feed the spent packet into the same provenance-aware common-deletion consumer family while retaining its original pair and shared-row facts. | The spent arm already has the generic common-deletion shape. Its stronger audit also retains two original endpoints omitted by the same two supports and the exact one-inside/one-outside overlap split. The generic packet alone is nonterminal, so this origin data cannot be declared irrelevant until a uniform consumer has actually been proved. Do not build a separate spent-only DAG, but do not erase the spent tag at the parent boundary. |
| ATAIL-R-COHERENT-COLLAPSE | CHECKED LOGICAL PROJECTION 2026-07-16; NOT THE CLOSURE INTERFACE | `ReciprocalSwapIntegration.lean`; `AnchoredTwoRowCoverConsumer.lean`; `CoherentContinuationCollapse.lean`; common-deletion successor-cycle regression; `r-branch-coverage-audit/REPORT.md` | Record that every non-unique R output has a generic common-deletion projection or swapped `FA-UNIQ4`, without promoting the weakened projection to a direct-`False` target. | Anchored terminal/cycle transitions, reciprocal common deletion, and spent-at-entry all map to `CommonDeletionTwoCenterPacket`; reciprocal criticality maps to swapped `FA-UNIQ4`. This retires provenance-specific work whose sole purpose was to produce a continuation. It does not prove that the generic packet is contradictory: the exact finite successor-cycle regression shows geometry-free termination is false. The coverage audit further shows that `ResolvedCurrentFirstApexFixedRadiusNormalForm` drops reciprocal and spent origin witnesses needed by a branch-complete consumer, so the next boundary must be a stronger origin-tagged source-current coordinator rather than this projection. |
| ATAIL-R-BRANCH-COVERAGE | CHECKED SOURCE AUDIT 2026-07-16; SECONDARY FALLBACK, NOT PRIMARY CARD ≥14 ROUTE | `scratch/atail-force/r-branch-coverage-audit/REPORT.md`; `matrix.json`; `OriginTaggedCoordinator.lean`; branch-handler reports | Preserve the exact branch inventory and regressions without treating every callback as a current closure obligation. | The origin-tagged coordinator remains a valid source-complete audit of unaligned, two-off-live, F1/F2/F3, generated-successor, mixed, reciprocal, and spent surfaces. However, the physical-second-apex survival-cover reduction now bypasses that tree on the primary card ≥14 route and lands directly in robust `S.oppApex2` or swapped `FA-UNIQ4`. The still-open callback list is therefore fallback infrastructure, not the load-bearing plan. |
| ATAIL-THIRD-CENTER-SATURATION | FOUNDATIONAL CLASSIFIER / CARD ≥14 SURVIVAL-COVER AND PARENT BOUNDARY PORTED 2026-07-19; ROBUST HANDLERS OPEN | Production `ATail/ThirdCenterCommonPair.lean`, `ATail/AnchoredDoubleDeletionProducer.lean`, `ATail/SurvivalCover.lean`, and `ATail/SurvivalCoverParentBoundary.lean`; scratch `survival-cover-bank-match/`, `common-deletion-uniform-consumer/`, `robust-second-apex-geometry/`; actual frontier | Use the production total-map classifier and blocker-fiber bound; feed the source-faithful card-≥14 physical-second-apex packet into the existing robust/critical consumer, then close the large-cap residuals. Keep the exact-card-four branch separate. | Production now contains the third-center impossibility, deletion-failure/support equivalence, exact support locking, blocker-fiber bound `≤ 4`, the card-≥14 two-color survival-cover producer, and an exhaustive parent-facing split. `exactFour_or_companionCommonDeletion_or_physicalSecondApexEndpoint` takes the complete `L` parent and returns exact-card-four, a source-faithful companion packet, or `FullyDeletionRobustAt D S.oppApex2`/`PhysicalSecondApexCriticalResidual D S`. The focused declarations are source-clean with only `propext`, `Classical.choice`, and `Quot.sound`; they do not themselves close a sorry. The remaining target is a terminal `L`-indexed consumer for the companion/robust/critical residuals. |
| ATAIL-UNIQUE-ROW-PRODUCER | THEOREM TARGETS REMAIN LOAD-BEARING; LITERAL 555/654 QUEUE STOPPED BY SOURCE-MAP GATE | User-owned unique-row/`(6,5,4)` work; checked T1/T5/D refinements; exact-CAS whole-row audits; actual-frontier, third-center, and anchored survival-cover audits | Prove the `FA-UNIQ4`, `FA-UNIQ5` distinct-blocker, and `FA-UNIQ5` coincident-blocker residual configurations directly as `False`, but admit new computation only when it targets a complete source-valid antecedent or formal coverage theorem with an immediate checked consumer. | The protected lane's checked T1/T5/D results show that `ExistsSurplusPairCriticalBlocker`, `CardFiveDistinctCapLocalCrossHypothesis`, and the coincident residual-member packet are already inconsistent on their branch surfaces, so producing them is equivalent to proving the branch contradiction. They remain valid consumers but are not useful intermediate producer objects. Exact-CAS audits kill the standing 555 row assignment by a crosschecked UNIT core and the standing 654 assignment by crosschecked real-infeasible forced-pair membership; those are exact within their fixed algebraic assignments, not Lean proofs or uniform closure. The current source-map audits establish that further literal 555/654 cores neither consume the six-source survival cover, produce the complete five-point packet, nor prove coverage. Preserve completed artifacts, stop the in-flight scans, and launch no successors. The unique-row theorem targets remain required before parent wiring is branch-complete; this is a correction of the mining object, not removal of those dependencies. |
| ATAIL-EXACT-FIVE-OMISSION-CYCLE | RETIRED TO ATTIC 2026-07-26; NEVER PUBLISHED; HISTORICAL DIAGNOSTICS ONLY | `attic/atail-exact-five-parent-assembler-2026-07-26/README.md`; historical exact 26-point full-cell and equal-blocker Kalmanson audits | None. The live exact-five path is K-A-EXACT5-GLOBAL-COVER. | The former assembler and omission-cycle helpers belonged to the same 13-module off-spine component. Local exact and Kalmanson audits remain bounded historical evidence, but neither established the missing global occurrence nor closed a production `sorry`. |
| ATAIL-SOURCE-FAITHFUL-FULL-CELL-K4 | ONE EXACT SOURCE-ORIENTED DELETION-CRITICAL EXTENSION CERTIFIED; BOUNDED SECOND-MANIFEST SEARCH NO-HIT/UNKNOWN; MULTI-ROW/TOTAL COMPLETION OPEN 2026-07-18 | exact 26-point full-cell coordinates; `WholeCarrierBiApexKalmansonSurface`; `BlockerRowManifest`; `source-faithful-full-cell-k4-completion/`; `x21-blocker-semantic-audit/`; `source-faithful-full-cell-k4-second-manifest/` | Replace local equality hunting by a full-dimensional exact oracle, or prove a hull/MEC boundary theorem; any successor must preserve the predecessor cell and both exhaustive deletion-critical manifests. | The generic arbitrary-cardinality Lean extraction already exists. An exact rational Krawczyk/interval certificate adds `{uS1,t0s,t1s,o}` at `x21`, with every source deletion leaving maximum radius-class cardinality three; Singular independently verifies the zero-dimensional system. A bounded 76-atom second-manifest pass found no gated candidate, but all 76 outcomes are fail-closed `UNKNOWN_NO_HIT`, not UNSAT. A six-DOF follow-up found 66 equality hits, all rejected by the full-cell/manifests gate; the closest valid-manifest hit violates MEC and strict hull inequalities. This is external discovery evidence, not Lean, coverage, total K4, minimality, or sorry closure. |
| ATAIL-EQUAL-BLOCKER-KALMANSON-COVERAGE | GENERIC CONSUMERS KERNEL-CHECKED; FIXED ROW TABLE AND SAVED STREAM EXACTLY DECIDED; LIVE `(5,6,6)` EXTRACTION/COVERAGE OPEN 2026-07-18 | production cap crossing/ordinal-cycle inequalities; `equal-blocker-kalmanson-feasibility/`; `corrected-survivor-kalmanson-coverage/` | Prove that every live large-cap residual emits a production `SelectedRowOrdinalComparison` cycle, or give an exact source-valid live-profile residual requiring nonlinear geometry. | The shared-middle-pair theorem covers all 3,456 cap-compatible orders of one banked 14-label table. Separately, the authoritative current saved stream has 143 records / 142 distinct assignments; all pass current semantic replay and all 143 have a production-representable cycle (89 length one, 54 length two) with exact integer Farkas replay. The stale round-two ids are excluded and the old 101 records are the exact prefix. This is not live coverage: that stream has profile `(8,4,5)`, incompatible with the two cap-at-least-six fields in `L`. The next audit must retain the source-indexed minimum live `(5,6,6)` parent surface; the earlier anonymous n=14 run was bounded UNKNOWN. |
| ATAIL-LIVE-EXACT6-PERIOD3-ORDER | DONE-PRODUCTION FOR ALL-REVERSE EXACT-SIX SLICE; MUTUAL FOUR-ROW LINEAR AND NAMED-`NO_QFREE` GATES EXACTLY SURVIVE; TOTAL ALL-CENTER GATE ACTIVE 2026-07-18 | `ATail/ParentExactFiveExactSix.lean`; `exact6-uniform-core-occurrence/`; `exact6-physical-apex-distribution/`; `exact6-manifest-first-gate/`; `exact6-orbit-kalmanson-gate/`; `exact6-noqfree-semantic-gate/`; `exact6-nom44-direct-gate/`; full parent shared cap order | Decide the exact-six mutual direct `False` on the total `WholeCarrierBiApexKalmansonSurface` plus all-source `BlockerRowManifest`, exact cap blocks, and the named seven-orbit packet. At card fourteen use the exact `(5,6,6)` all-center gate; exact-oracle-check every source-mapped LRA survivor. Do not add anonymous rows or resume literal-core mining. Then solve cap card at least seven without weakening the parent packet. | The production all-reverse exact-six contradiction is source-clean. The corrected physical-apex distribution is kernel-checked. All 456 enumerated six-point cap-order cells across the seven mutual orbits are exact rational SAT under every strict triangle/Kalmanson inequality, the four full row filters, physical-apex uniqueness, and cap-local hit bound. Full all-radius `no_qfree_at` at the three named blockers also leaves 7/7 orbits alive, maximum deleted radius-class cardinality three. These are projection witnesses, not planar/MEC/live models. The `noM44` audit proves any alternate packet must differ from `S`, have surplus cap at least nine, and use a nonphysical support vertex, but neither blocker arm constructs it. Thus the first missing force is total all-center K4/all-source critical-map geometry; literal/anonymous mining, more four-row linear closure, and the three-center adapter are retired. Cap sizes at least seven and the current eight source-`sorry` declarations remain open. |
| ATAIL-LIVE-EXACT6-TOTAL-SOURCE-AUDIT | CHECKED-SCRATCH 2026-07-18; ACTIVE GATE IS A SOUND NECESSARY-CONDITION RELAXATION, NOT A FULL-PARENT MODEL | `exact6-total-surface-source-audit/{REPORT.md,manifest.json,MutualOmissionBlockersDistinct.lean}`; active `exact6-allcenter-capaware-gate/` | Correct the minimum-cardinality gate before interpreting survivors: require the unused continuation source to lie in the closed physical cap; retain exact epistemic labels; then restore first-apex deletion robustness/frontier double deletion only if the weaker corrected gate survives. | The mutual pair's own actual blockers are provably distinct (kernel checked); this does not remove the later unused-source/partner equal-blocker arm. No mathematical overconstraint was found. The cheap missing necessary constraint is `unused in PHYSICAL_CAP`. First-apex full robustness/frontier data, full minimality, global `noM44`, MEC, and planar rank-two realization remain omitted. Therefore certified UNSAT of the corrected relaxation would be meaningful, while SAT would still be only a partial-parent abstract-distance shadow. |
| ATAIL-LIVE-EXACT6-CERTIFIED-COVERAGE | COMBINED STATIC BANK STILL SAT; EXACT CEGAR AND DIRECT PORTFOLIO NONTERMINAL WITHOUT ALIVE; UNIFORM AGGREGATE LINEAR ROUTE REFUTED 2026-07-19 | `exact6-allcenter-coverage-certificate/`; `exact6-allcenter-capaware-gate/`; `weighted-kalmanson-cut-data-soundness/`; `aggregate-positive-contour-discovery/TIGHT_GRAPH_UNIFORM_ATTACK.md` | Do not launch a third broad literal-schema round or seek a uniform Kalmanson/product-box theorem. Continue exact coverage only when it decides a named lower-card slice; otherwise restore full parent Euclidean/MEC/critical-fiber/minimality data. Apply the prepared planar rank-two gate only to a real `ALIVE`. | The initial 7,000-cut bank and 12,509-cut cross-bank replay but do not cover an orbit. Corrected Source/Target recovery found no SAT/ALIVE and added ordinary cuts 722/720. The D14 direct portfolio is timeout `UNKNOWN` on all seven role orbits. Independently, the exact even-card positive-split counterfamily refutes the bare aggregate dual from card twelve, so more linear aggregate coverage cannot be the high-card proof. No source `sorry` closes. |
| ATAIL-LIVE-EXACT6-TWO-HIT-MEC | CHECKED-SCRATCH NONLINEAR LOCALIZATION; ROLE-PRESERVING `(1,1,1)` ONE-HIT SUBCELL REMAINS OPEN 2026-07-20 | `exact6-mec-nonlinear-gate/ExactSixTwoHitBlockerLocalization.lean`, `search_card3_continuation_order_one_hit.py`, `qfnra_card3_continuation_order_one_hit.py`; exact-six complete-row manifest and physical distribution | Split each mutual row by one versus two physical-class hits. Enumerate the finite strict-cap aliases on the two-hit side. On the one-hit side, first fix a source-valid role orbit, hit distribution, cap cell, and cyclic word; use exact QF_NRA only as a cell decision and require a source-valid coverage theorem before any Lean lift. | Two actual physical-class hits force the row's actual blocker into the four-point strict physical cap. Card-four physical incidence localizes it to `physicalVertices`; card-three with the unused point in the strict cap localizes it to `insert unused physicalVertices`. This is kernel-checked and uses the actual `H.selectedAt` row. The new `continuationOrder` `(1,1,1)` cell records the mutual/unused omissions and legal same-cap bound. Its 24-worker numerical probe is `UNKNOWN_NO_HIT`; the exact replay rejects the optimizer's cap-inconsistent near-miss word, while a cap-consistent word is QF_NRA `UNKNOWN` at 30 s. It omits the `(2,1,0)`/`(1,2,0)` distributions, other orbits/cells/words, total CSS, parent geometry, minimality, and `noM44`. No witness, infeasibility certificate, coverage theorem, or source `sorry` closure is claimed. |
| ATAIL-LIVE-EXACT7-SOURCE-BLOCKER | PRODUCTION SOURCE-BLOCKER OCCURRENCE; DISTANCE-ONLY ROLE CENSUS AND TOTAL-MAP ADAPTER EXHAUSTED; LIVE COMPATIBILITY TARGET LACKS `D.Minimal` 2026-07-20 | `ATail/ParentExactFiveExactSeven.lean`; `exact7-role-coverage-gate/REPORT.md` Findings 17–19; Round-126 total-map audit; Round-166 blocker-cycle audit; full-`L` exact-five all-reverse packet | Keep research on an oriented coordinate/MEC or total-critical-system consumer that retains full `L`. The current pair theorem cannot consume that route because its signature dropped `D.Minimal`; mechanically thread `hmin` only if preparing a user-approved spine refactor. Do not extend distance-only, bare-curvature, or uncoupled-total-map census. | `ParentExactFiveExactSeven` proves that a seven-point physical cap forces `H.centerAt q = successor q`, and exposes the corresponding faithful all-center row and source-deletion failure. The existing terminal consumes exactly the missing equality for the predecessor's two-point outside pair. The source-clean total-map classifier at either outside point yields a blocker collision at the aligned successor or a physical-second-apex common-deletion packet; the collision still lacks the ordered/same-cap producer, and two packet outcomes are uncoupled and nonterminal. Exact finite radius/color models refute deriving the equality from rows, radii, K4, deletion criticality, and abstract minimality alone; the completed distance-matrix role census and the Round-166 counterpattern separately rule out its unused-row and bare-cycle-curvature extensions. The proven frontier assembler needs `D.Minimal`; `u1_largeCap_routeB_tail_false` has it, but its sole caller chain drops it before the pair theorem. A target swap to the two genuine frontier arms would relocate—not remove—the sorry and is explicitly deferred pending user direction. The 25-role coordinate probe's bounded no-hit is not UNSAT. |
| ATAIL-PARENT-WIRE | CAP-FIRST PHYSICAL DISPATCH AND TERMINAL CONSUMERS IMPLEMENTED; LARGE-OPPOSITE-CAPS PRODUCER AND PROTECTED UNIQUE CONSUMERS OPEN; NO PRODUCTION SORRY CLOSED | `removableVertexOfLarge_of_nonIsM44`; `u1_largeCap_routeB_tail_false`; production physical-ingress, frontier, bi-apex, and critical-fiber modules; protected unique-row lane | Preserve the source order: cap-first small/critical exits; frontier extraction; `originalUnique_or_commonDeletionParent`; then `R`, `B`, and `L : FrontierLargeOppositeCapsBiApexRobustResidual B`. Close `false_of_largeOppositeCapsBiApexRobust L` plus the protected unique arms, then call `false_of_twoLargeCaps_commonCriticalMap` before LIVE row construction. | Whole-carrier bank decisions are not wiring dependencies. Once the direct L-indexed contradiction and protected consumers close, bypass/delete K-A, reference-mine/delete the remaining LIVE-C tree, rebuild, refresh blueprint, and require the current eight direct source-`sorry` declarations (K-A-PAIR plus seven LIVE-C helpers) to disappear. LIVE-Q/T1/T3 are already source-clean compatibility consumers. A late favorable `H` plus rebased closing core may implement the contradiction but does not change this dispatcher order. |
| ATAIL-PARENT-SCOPE | LIVE GENERIC BI-APEX-ROBUST ARM; CAP-STRENGTHENED `L` REMAINS SUPPORTING 2026-07-20 | `ATail/FrontierLiveClosure.lean`; `ATail/OrientedPhysicalApexIngress.lean`; `ATail/LargeOppositeCapsBiApexSurface.lean`; exact-five/exact-seven assemblers | Close `false_of_frontierBiApexRobustResidual F R B` directly, or prove a source-faithful classifier which discharges both small-cap exits and supplies `L : FrontierLargeOppositeCapsBiApexRobustResidual B`. | The live source retains the full common-deletion parent and physical-second-apex robustness `B`, but not the two opposite-cap-six fields. An arbitrary `F`/`R` arm is therefore too weak for the exact-five/seven route, while an `L`-only theorem cannot currently cover every live `B`. The exact-card family is valid supporting geometry, not an on-spine close until this ingress bridge or a direct `B` consumer is proved. |

### Authoritative exact-six redirect (2026-07-19)

This checkpoint supersedes the older action text in
`ATAIL-LIVE-EXACT6-PERIOD3-ORDER` and
`ATAIL-LIVE-EXACT6-CERTIFIED-COVERAGE` that says to continue exact cut
coverage or keep the total all-center literal gate active.

- The production all-reverse exact-six contradiction remains done and
  source-clean.
- Kernel-checked scratch
  `full-parent-coradial-card-split/FullParentCoRadialCardSplit.lean` uses that
  contradiction at cap cardinality six and requests
  `FirstApexCoRadialTransitionReversePairOccurrence` only from cardinality
  seven upward.  Exact seven is a separate geometric leaf; the aggregate lane
  after it begins at cardinality eight and retains the full `R`/`B`/`L`
  parent.
- The corrected piqd audit repairs cyclic schema transport, expands the bank
  to 737,100 cyclic-dihedral applications, and still obtains 28 wholly new
  independently replayed cuts, five shell-conditioned, with two fail-closed
  timeouts and no exhausted or `ALIVE` orbit.
- Checkpoint `f8ef5d9b` therefore classifies literal exact-six CEGAR
  `NONCONVERGENT_UNDER_OPTIMIZED_ENGINE`.  Preserve its replay artifacts but
  launch no further literal rounds.
- The active mathematical input must be nonlinear Euclidean/MEC geometry,
  full-fiber/common-critical-system provenance, or genuinely global
  minimality, feeding the existing co-radial terminal or direct parent
  `False`.  `OrderedCrossRowCore` is a fallback only when its extra fiber
  alignment, cross-incidence, and cyclic-order fields are actually produced.
- The exact-five arbitrary mutual-omission sibling now has a checked
  source-faithful same-cap/equal-blocker residual consumer, with a direct
  `FullParentExactFiveMutualData` bridge preserving `L`. Its final positive
  overlap or third-row producer remains independent and open. No source
  `sorry` closes at this checkpoint.

### Authoritative frontier-pair global checkpoint (2026-07-19)

The active parent-scoped step is now the retained frontier pair, not the
superseded equal-blocker gate.  On the complete `L` parent, apply
`cross_deletion_survives_or_cross_membership F.pair` first.

- Cross membership feeds the signed-area and third-center consumers.  It is a
  source-valid branch, not an unconditional contradiction.
- Cross survival produces a source-faithful companion common-deletion packet.
  The live consumer must retain total `H`, `D.Minimal`, and the complete
  `R`/`B`/`L` packet, then establish a terminating global survival/progress
  fact.  Anonymous row or Kalmanson marginal mining is not a substitute.

The source-clean production module
`ATail/FrontierPairGlobalDeletionSplit.lean` now exposes
`frontierPair_globalDeletion_split`.  It applies global minimality to the
actual pair with `14 ≤ D.A.card`, yielding a center outside `{q,w}`, a minimal
deletion core `V ⊆ {q,w}`, restoration fields, and the exact split
`V.card = 1` or `V = {q,w}`.  Neither branch is terminal yet; the singleton
branch needs a total-map/progress consumer and the full-pair branch needs the
same global progress coupling.  The protected live dispatcher is intentionally
not edited, so the live sorry count does not change from this port.

On the directed cross-membership subarm, the full-pair core is now sharper.
`full_frontierPair_core_dist_ne` rules out its shared-radius alternative: the
fresh center cannot equal the first apex because `R.common.firstApexDouble`
survives deleting both sources, and cannot equal the selected `q` blocker
because the core's restoration of the `w` deletion contradicts the cross hit.
A third distinct co-radial carrier center would violate the
perpendicular-bisector bound.  The production theorem
`nonempty_minimalDeletionCore_of_full_frontierPair_core` therefore constructs
the remaining two-source `MinimalDeletionCore` with pairwise distinct radii.
This is a PROVEN branch reduction, not a terminal: the next theorem must use
that exact core together with total-map, cap/MEC, or a source-faithful progress
consumer; it must not restart shared-radius or anonymous-row mining.

The 26-point exact rational Euclidean/MEC replay remains a regression: it
realizes the local rows but fails to provide legal deletion-critical blockers
for thirteen sources.  Therefore the next model or theorem must include the
total critical map and all-source deletion semantics.  Any solver result is
fail-closed: a full-parent witness weakens the target, a checked UNSAT result
is promoted only for its named branch, and `UNKNOWN` makes no mathematical
claim.

The previous
`scratch/atail-force/equal-blocker-full-parent-gate/` artifact is retained as
historical relaxation evidence, but it is no longer the active anchor for
research.  Do not reopen it unless the frontier-pair route produces a
source-faithful equal-blocker consumer.

## Final commands

Run only after the shared tree is stable and no other same-project build is
active:

```bash
lake-build
proof-blueprint index --refresh
proof-blueprint refs --refresh
proof-blueprint refs --check
proof-blueprint symbols --with-sorry
proof-blueprint spine
proof-blueprint verify-publish
```

`proof-blueprint verify-publish` is the terminal acceptance criterion. Bank
counts, successful SAT runs, generated source volume, and reduced textual
`sorry` count are intermediate evidence only.

## 2026-07-19 external-round reconciliation

The latest Front-A backup (Rounds 137--142) was checked against the current
repository.  It contributes no production import and closes no live sorry.
Rounds 137 and 140 provide source-faithful unused-source/common-deletion
cores; Round 141 proves the unused blocker is not an adjacent transition
bisector; and Round 139 supplies a DRAT-verified UNSAT result only for a fixed
fifteen-label Kalmanson profile.  Round 142 gives an exact finite rational
countermodel to the pure critical-shell/fiber-counting argument.  These are
useful regression boundaries, not live parent consumers.

The matrix therefore keeps the active closure boundary unchanged: preserve
the complete `F`/`R`/`B`/`L` parent and obtain a genuinely global
Euclidean/MEC, full-critical-map, or metric-minimality coupling that feeds an
existing terminal.  Literal CEGAR, anonymous row adapters, and uniform
Kalmanson expansion remain retired unless a full-parent survivor and its
named consumer are both present.

The import audit further confirms that the source-clean exact-five assembler
and exact-six terminals are not imported by `U1LargeCapRouteBTail`; they do
not reduce the live spine until the missing full-`L` packet and mutual-arm
consumer are wired.

### Authoritative live-spine refactor (2026-07-20)

By explicit user authorization, the live U1 Route-B tail now bypasses the
impossible `DoubleApexOffSurplusSharedRadiusPair` existential and the seven
LIVE-C leaves. The sole caller threads `D.Minimal` into
`u1_largeCap_routeB_tail_liveData_false`; that declaration constructs the
CP-built `SurplusCapPacket`, extracts the concrete critical shell system, and
dispatches directly through `CriticalPairFrontier`.

The generated blueprint reports precisely two on-spine source `sorry`s:

| Obligation | Parent data retained | Required closure shape |
| --- | --- | --- |
| `ATailFrontierLiveClosure.false_of_originalFrontierUniqueRadiusArm` | concrete `F`, `D.Minimal`, no-M44, carrier bound, first-apex class bound | direct `False` for the protected unique radius-four/five arm |
| `ATailFrontierLiveClosure.false_of_frontierBiApexRobustResidual` | the same `F`, `R : FrontierCommonDeletionParentResidual F`, and `B : FrontierBiApexRobustResidual R` | direct `False` using bi-apex deletion robustness plus global cap/MEC, total-map, or minimality force |

This removes the obsolete K-A-PAIR/LIVE-Q/LIVE-C source tree from the active
spine. It does **not** establish either new arm, and it does not license a
return to literal CEGAR or generic Kalmanson closure: the known projection
countermodels remain regression gates. Exact-five/exact-seven `L`-indexed
work is a preferred way to furnish an arm consumer, not a third live
obligation.

### Post-refactor routing boundary (2026-07-20)

The live obligations retain generic `F`/`R` frontier data, while the existing
exact-five/six/seven theorem family begins only at the stronger cap-first
packet `L : FrontierLargeOppositeCapsBiApexRobustResidual B`.  The current
live normal forms do not retain `B` or `L`'s two cap lower bounds, and no
source-valid bridge presently reconstructs them.  Thus exact-six and
exact-seven progress is not on-spine closure by itself.

The only current routes to a live close are a source-faithful full-parent to
`L` bridge with its complementary ingress cases discharged, or a direct
global Euclidean/MEC/critical-map/minimality contradiction for each generic
live arm.  Treat the 25-role coordinate model as unresolved: 192 numerical
no-hit runs are empirical negative evidence, not `UNSAT`.  Literal CEGAR and
unmodified numerical restarts remain retired until a changed instrument has a
named on-spine consumer.

### Physical-second-apex live refinement (2026-07-20)

The coupled strict-interior expansion is no longer on the live spine.  A
common-deletion parent contains a packet with physical second center
`S.oppApex2`, and the production theorem
`frontierCommonDeletionParent_biApexRobust_or_critical` gives its exact
source-faithful split.  The current on-spine source obligations are:

| Obligation | Retained data | Immediate next proof object |
| --- | --- | --- |
| `false_of_originalFrontierUniqueRadiusArm` | `F` and global parent fields | packet-generic FA-UNIQ4/5 consumer |
| `false_of_frontierBiApexRobustResidual` | `F`, `R`, and bi-apex robust `B` | cap-size ingress to `L` or a direct robust geometric/minimality consumer |
| `false_of_physicalSecondApexCriticalResidual` | `F`, `R`, and physical-second critical shell | swapped packet-generic FA-UNIQ4 reorientation, then its direct consumer |

This is a **PROVEN routing refinement**, not closure.  It removes an
unnecessary strict-interior wrapper and makes the two real common-deletion
endpoints explicit.  Exact-five/six/seven work can help only after the robust
endpoint is strengthened to `L` with a complete cap-size case split; it still
does not close the critical or original unique arm by itself.

### Critical-arm reorientation promoted (2026-07-20)

The physical-second critical endpoint is now source-cleanly reoriented by
`ATailPhysicalSecondApexSwap.physicalSecondCritical_reorients_to_swappedUniqueFour`.
The proof swaps the non-surplus packet roles, identifies the prescribed
blocked radius as the unique positive four-capable radius, and produces the
same packet-generic FA-UNIQ4 interface consumed by
`false_of_originalFrontierUniqueRadiusArm`.

| Current source obligation | Status of former critical branch |
| --- | --- |
| `false_of_originalFrontierUniqueRadiusArm` | still open; now also consumes the reoriented physical critical branch |
| `false_of_frontierBiApexRobustResidual` | still open; needs cap-faithful ingress to `L` or direct global consumer |

Thus the live spine has two—not three—source `sorry`s. The critical branch is
not kernel-closed independently; it inherits the original unique-arm
dependency and must not be reported as an independent producer frontier.

### Exact-five transition status correction (2026-07-20)

The normalized-cycle provenance gap has already been eliminated in production:
the mutual/all-reverse split is transition-global, and the all-reverse branch
constructs a zero-entry period-three cycle containing both continuation
sources. Do not schedule another cycle-anchoring or transition-API promotion
as live closure work.

The remaining full-`L` cells are not local incidence obligations. The
full-parent mutual equal-blocker audit proves a three-center ledger: its
common blocker is equidistant from the pair, while both physical apices are
not. Since the displayed large-cap packet has cap cardinality at least six,
it is itself not `IsM44`; using `noM44` requires an internally constructed
different support triangle with exact `(m,4,4)` cap counts. The only honest
producer frontiers are therefore a global co-radial reverse-outside pair, a
late-choice `CriticalFiberClosingCore`, or a retriangulation/direct nonlinear
cap contradiction.

### Faithful finite-search gate (2026-07-20)

The current raw-DIMACS/piqd route is not an oriented Euclidean or
deletion-criticality solver.  It faithfully runs a supplied Boolean CNF, but
the extant generic CEGAR chooses blocker rows freely and checks only a local
Kalmanson/metric shadow.  It lacks both the all-radius meaning of
`H.no_qfree_at` and the signed-area/MEC information used by the remaining
cross-membership geometry.  The latter is not recoverable from a distance
matrix because reflection preserves all distances while reversing the needed
orientation sign.

Therefore literal CEGAR and raw-CNF runs are retired as primary closure work.
They may be used only after a source-faithful occurrence map fixes a finite
role cell and an immediate consumer, with an explicit full deletion-radius
semantics and an oriented-coordinate/MEC validation layer.  Any result short
of that is a finite abstraction diagnostic, not evidence that either live
source obligation is closed.

The hermetic Phase-3 fixtures are `DONE-BOUNDED/UNKNOWN` only. They replay the
saved 100-survivor prefix and all 2,400 supplied cyclic orders, but 1,191
metric leaves remain `UNKNOWN`. This is fixture-level bounded computational
evidence, not an exhaustive census, Euclidean or Problem 97 result, Lean
theorem, or closure claim.

### Rebuilt-spine robust priority (2026-07-20)

The focused Route-B build and fresh kernel mining now verify that the public
Problem 97 target reaches exactly two source holes:

| On-spine obligation | Correct active target |
| --- | --- |
| `false_of_originalFrontierUniqueRadiusArm` | direct protected unique-radius contradiction |
| `false_of_frontierBiApexRobustResidual` | direct full-parent robust geometric/minimality contradiction |

The retired `DoubleApexOffSurplusSharedRadiusPair` and LIVE-Q/C declarations
are not on that rebuilt spine. The physical-second-apex critical case is
source-clean and reorients into the first obligation.

The generic robust surface `B` has no proved bridge to
`FrontierLargeOppositeCapsBiApexRobustResidual B`: the two cap-six bounds are
additional `L` data, not a consequence of `B` or a low-cardinality split.
The production multiplicity theorem yields either multiple blocker fibers or
a larger one, but the source-faithful audits show that this alone supplies no
cross-row membership, first-apex equality, or compatible cyclic order.

Therefore `ATAIL-FRONTIER-CLOSING-CORE` should be read as a direct
full-parent occurrence target: select a favorable fiber late and produce a
complete `CriticalFiberClosingCore` (or `False`) using cap/MEC/order and
global deletion-criticality data. Exact-five/six/seven `L` work is
supporting-only until an ingress theorem covers the complementary generic
robust cases. Literal CEGAR, raw DIMACS, and further standalone
blocker-fiber/cap adapters remain nonterminal regressions.

### Direct robust-field triage (2026-07-20)

| Parent field or route | Checked status | Permitted next use |
| --- | --- | --- |
| `R.minimal` / selected-row strong connectivity | **Insufficient in the audited abstract full-fiber models.** | Couple it to a specifically Euclidean source fact; do not mine another connectivity or quota adapter. |
| `R.noM44` | **Nonterminal at the displayed large-cap packet**, which is already not `IsM44`. | First construct a different Moser support triangle with verified exact cap counts, then invoke `noM44`. |
| Blocker multiplicity / local cap placement | **Insufficient.** They do not yield an actual cross row, first-apex co-radial pair, or compatible cyclic order. | Use only inside a full-parent producer that immediately returns `CriticalFiberClosingCore` or `False`. |
| Exact-five/six/seven `L` terminals | **Supporting only.** Generic `B` still has no cap-six ingress. | Retain as terminal targets/tests after a source-faithful bridge, not as a separate live closure claim. |

The remaining robust theorem must visibly consume total
`CriticalShellSystem` deletion-radius semantics plus oriented/MEC geometry
and one global parent field. This is a precise research boundary, not a claim
that the full parent is unrealizable or that the two live obligations are
closed.

### Active direct-parent campaign (2026-07-20)

| Retained-pair arm | Required closure result | Disallowed substitute |
| --- | --- | --- |
| Actual cross membership | A complete signed-area, third-center, Kalmanson, or `CriticalFiberClosingCore` occurrence with its compatible order/cap fields. | A bare additional row, blocker collision, or equality list. |
| Cross-deletion survival | A companion common-deletion packet **and** a source-faithful strict progress/nonreturn invariant using cap/MEC/minimality. | Reapplying the same robust/critical splitter as an unranked recurrence. |

The sole admissible finite-analysis manifest is whole-carrier and
source-faithful: full `no_qfree_at` radius partitions, the retained-pair
minimal-deletion core, oriented convex-boundary/MEC constraints, and one fixed
terminal consumer. Literal 555/654, arbitrary selected-row, and uniform
Kalmanson searches remain excluded. `SAT` may falsify an overstrong proposed
occurrence; `UNSAT` becomes closure evidence only after formal coverage maps
every parent configuration to the manifest.

**Retained-pair source audit (2026-07-20).** The physical-second-apex escape
has a chosen critical blocker distinct from both known retained-pair centers:
the first apex is deletion-robust and the `q` blocker survives deleting the
escape source. This is a proved role constraint, not a terminal row
occurrence. The third-center classifier then forbids a third blocker from
containing both retained sources. The valid next producer is consequently a
terminal-facing coverage theorem on the full bi-apex parent:
`Nonempty (CriticalFiberClosingCore R)`. The two robust-apex image omissions
already yield a two-fiber-or-three-source blocker seed; cap/MEC and a global
parent field must select a favorable fiber and construct its ordered cross-row
or same-cap collision endpoint. The source-indexed two-deletion survival cover
outside the at-most-four-source known blocker fiber (at least six sources
under the live cardinality bound) remains a required constraint, but its
card-≥14 consumer loops back to the physical splitter and is not the generic
closer. A retriangulated `IsM44` construction may discharge internally;
another third-blocker, survival, or common-deletion wrapper is not an
admissible milestone.

The existing whole-carrier bi-apex audit has a source-faithful card-11
structural SAT shadow after every current pure Kalmanson/Farkas consumer is
excluded. Literal ordinal, linear-distance, and Kalmanson-only mining are
therefore blocked for this target. Any new coverage model must add nonlinear
planar Euclidean rank, complete exact-radius filters, or actual MEC/cap
placement coupled to the common critical map.

### Exact-two ingress checkpoint (2026-07-23)

**Historical checkpoint, superseded for fixed card 11 by completed
K-A-UNIQUE-POST11 production wiring.** The chronology below remains evidence
for the promoted certificate; its open-ingress and no-production-closure
statements are not current. The arbitrary-card exact-four remainder begins at
card 12.

This checkpoint supersedes the stale K-A-UNIQUE-DISPATCH note that both
exact-two formulas still lack all Lean ingress. The p4 and p5 projections now
have source-faithful direct/mirror boundary packets and authenticated
core-to-family maps. The p5 bridge additionally has source-clean retained
Kalmanson consumers, normalized schema-5/schema-8 mirror terminals, and a
fail-closed trimmed-occurrence generator.

The remaining p5 ingress is precise: first repair and revalidate the currently
unfinished trimmed-certificate materializer; then produce and Lean-replay a
hash-bound trimmed LRAT certificate, map every retained clause occurrence,
prove the direct and reflected source valuations (including the boundary
reflection), and compose those results with the existing decoder. P4 follows
the same pipeline after p5. This checkpoint closes no production `sorry`; the
arbitrary-card unique-radius arm remains a separate mathematical obligation.

### E1 endpoint-cross-hit superseding checkpoint (2026-08-02)

This checkpoint supersedes the `K-A-LIVE-E1-SPLIT` row's count of four
terminal leaves and three proved dispatchers. The retained-omission E1
frontier now has **eight terminal leaves and five proved dispatchers**. The
former endpoint-cross-hit terminal is a proved exhaustive dispatcher over
the three critical role coincidences

```text
firstCenter = freshSource       (A = J)
firstCenter = secondCenter      (A = X)
secondCenter = firstSource      (X = C)
```

and the generic branch where all three equalities fail. Together with the
inherited endpoint-context inequalities, the generic branch has six distinct
named roles. The shared-blocker child is now itself a proved two-way cap-cover
dispatcher. This is a narrowing of one load-bearing obligation into stronger
load-bearing obligations, not a closure claim; the raw frontier changed from
four to eight `sorry` leaves.

For the shared-blocker branch `A = X`, the banked producer
`endpointFresh_support_eq_of_sharedBlocker` proves equality of the two exact
radius classes, equality of their full supports, and membership of the three
distinct named points `C`, `K`, and `J` in that common support. Exactness leaves
one anonymous support point. The stronger producers now prove that the common
shell and first-apex row intersect exactly in `{C, J}`, that the common shell
is uniquely `{C, K, J, L}`, and that both `K` and `L` are outside the
first-apex row. They also prove that `C` and `J` alternate across the chord
joining the first apex and common blocker in every compatible boundary
indexing. Thus pinned multiplicity plus shared-pair geometry sharply narrows
the branch, but does not close it. Collision localization additionally proves
that `J` is outside the strict first-cap interior. Retained-radius membership
and the global cap cover then split the old outside-first-interior leaf into
the two on-spine leaves where `J` belongs respectively to the left- and
right-adjacent closed cap. The before/after coordinator frontier is one
outside-first-interior obligation versus two obligations with immediate
constructor fan-out two. Both children retain that exclusion and add a named
adjacent-cap membership, hence have strictly stronger hypotheses.

For `A = J` and `X = C`, the three shell equalities plus convexity alone do not
give a contradiction: regular-pentagon realizations exist for admissible
orders. Existing five-point Kalmanson consumers eliminate only the compatible
forbidden order types: each coincidence-specific bank now covers eight of the
twenty-four oriented orders, including the reflected placements. Therefore the
next producer must constrain the actual cyclic order or add a further
full-row/cap incidence; the equalities themselves are not a complete terminal.
For `A = X`, the immediate targets are the two adjacent-cap leaves just named.
A six-role placement packet using one exclusive point from each exact-four row
and the banked shared-pair alternation, followed by exhaustive dispatch to the
sparse six-point Euclidean consumers, remains a downstream fallback.

### Fresh-third normalized residual coordinator checkpoint (2026-08-02)

The live `TwoSourceExactCollisionRowsTerminal` coordinator now has a
source-clean narrowing for the normalized fresh-third packet. Same-blocker
and source-row-omission interactions are eliminated under the both-hit
hypotheses; the canonical same-cap interaction at `S.oppIndex1` is consumed
by `false_of_freshThirdEqualCenter_sameCapOppIndex`; all other equal-center
positive interactions and both non-hit constructors are packaged into the
explicit `FreshThirdNormalizedResidualRemainingCase` frontier. The sole
remaining load-bearing declaration for this packet is
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`, still
open. Focused Lean 4.27 compilation succeeds. This is a frontier update, not
a closure: the narrowed packet has no source-clean terminal yet.

### Fresh-third exact-row/global-bank checkpoint (2026-08-03)

The round-6 global theorem-bank audit found no import-reachable source-clean
consumer for the exact equal-center four-row plus noncanonical overlap packet.
The nearest Kalmanson and shared-pair declarations require a strict boundary
quadruple, boundary/index transport, and (for the alternation theorem)
distinct centers; these hypotheses are not present in the live residual.  The
audit report is
`scratch/retained-omission-e1/round5-general-cegar/round6-global-bank-audit-20260803.md`.

The strengthened bounded n=17 incidence and cyclic CEGAR overlays are SAT in
external Z3 (no Lean kernel proof, no Euclidean realization, no universal
claim).  They are diagnostic only and do not alter the closure count.  The
first missing producer is a branch-preserving `ConvexCyclicOrder`/strict
boundary adapter feeding the existing Kalmanson consumer; the non-hit arms
still need an independent source-faithful bridge.  The literal declaration
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining` remains
open and on spine.

### Fresh-third combinatorial bridge audit (2026-08-03)

The exact-four support/cardinality, cross-pair deletion, and
`FreshThirdBlockerFiber` fields were audited together against all three
constructors of `FreshThirdNormalizedResidualRemainingCase`. They do not
source-cleanly close either non-hit constructor or the noncanonical
equal-center interactions: no common first-apex radius, reciprocal C-row
incidence, or boundary/order invariant is forced. The nearest consumers are
still the distinct-center two-hit terminal and the canonical same-cap
terminal, both already dispatched elsewhere. The audit report is
`scratch/freshthird-combinatorial-bridge-audit-20260803.md`.

The next required producer is therefore a non-hit/source-row-omission
contradiction, an equal-center noncanonical incidence/order terminal, or an
adapter that proves the common-radius/mutual-incidence hypotheses of the
generic two-cap terminal. This is a frontier clarification only: the
load-bearing declaration
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining` remains
open, on spine, and receives no closure credit.

### Mixed-cap FreshThird branch wiring (2026-08-03)

The two equal-center mixed-cap products
`distinctBlockersDifferentCaps × sameCapWithInternalFiberSource` and its
reverse now close source-cleanly via indexed-cap uniqueness and the declared
cap-index inequality. The Lean 4.27 direct check passed. This narrows the
coordinator frontier but does not close
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`:
both non-hit constructors and the noncanonical same-cap × same-cap product
remain open and on spine.

### FreshThird cap-eight bank audit (2026-08-03)

The indexed cap-eight search was verified against the imported source.  The
producer `exists_capSource_thirdCanonicalRow_omits_each_collisionPair` is
already upstream of the live `C` packet; the apparent terminal
`false_of_twoCapSources_freshThirdBlockerFiber_core` is downstream of the
normalized-remaining leaf and is therefore cyclic as a proof route.  The
generic cap-count results permit the cap-cardinality hypothesis, while the M44
size-four result is not in the residual hypotheses.  The common-physical-pair
localization theorem also needs strict-cap/common-radius data that the
remaining packet does not retain.

Status remains `OPEN / ON-SPINE / NO SOURCE-CLEAN CONSUMER` for
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`.  The
mixed-cap pair is closed; `firstNonHit`, `secondNonHit`, distinct-cap ×
distinct-cap, and noncanonical same-cap × same-cap remain unclosed.  This is a
documentation audit only: no SAT artifact, wrapper, downstream theorem, or
conditional assumption changes the closure count.

### FreshThird normalized-remaining branch-bridge checkpoint (2026-08-03)

The production-namespace state probe now enumerates all constructors of
`FreshThirdNormalizedResidualRemainingCase` without introducing a live
obligation.  The focused source audit found no new consumer: the mixed-cap
equal-center products remain the only additional source-clean reductions, while
`firstNonHit`, `secondNonHit`, equal-center distinct-cap products, and
noncanonical same-cap products remain open.  The generic two-cap terminal still
needs common selected-class radius and reciprocal cross-row incidence; the
ordered route additionally needs a producer fixing the common `btw` side.

The normalized-remaining theorem therefore remains
`OPEN / ON-SPINE / NO SOURCE-CLEAN CONSUMER`; the parked probes and bounded
incidence searches provide diagnostic evidence only and do not change the
closure count.

### FreshThird noncanonical same-cap two-center adapter checkpoint (2026-08-03)

The parked Lean 4.27 adapter
`scratch/freshthird-noncanonical-two-center-adapter-20260803.lean` now
typechecks and reports only `propext`, `Classical.choice`, and `Quot.sound`.
With explicit hypotheses that both fresh support points are outside the common
indexed cap, it derives both shell equalities and invokes
`ATailUniqueRowProducerScratch.false_of_two_cap_centers_equidistant_outside_pair`.

This does not close the live branch.  The production
`sameCapWithInternalFiberSource` constructor retains
`Q.source₁ ∈ cap ∨ Q.source₂ ∈ cap`, incompatible with the adapter’s
two-outside premise.  The missing producer is therefore either a
one-inside/one-outside terminal or a source-faithful incidence/order
strengthening. The normalized-remaining theorem remains
`OPEN / ON-SPINE / NO SOURCE-CLEAN CONSUMER`; no closure credit is assigned.

### FreshThird v35 nonapex-transitivity hard-canary checkpoint (2026-08-03)

The approved source-entitled v35 slice completed with a valid child contract
but no terminal result.  Its twelve exact-15 `DDD` role cases all returned
`UNKNOWN` within the five-minute case budget; 189 metric assignments were
checked in total, and no case was `SAT`, terminal `UNSAT`, or a contract error.
The run is recorded under
`scratch/retained-omission-e1/round5-general-cegar/artifacts-v35-hard-canary-production1/20260803T214414.991226Z-hard-canary-pid13301/`.

The slice added 1,320 ordered distinct-nonapex six-literal transitivity
clauses with zero semantic-Boolean increase (1,076 semantic Booleans and 38
trackers per case).  The focused v35 plus telemetry suite passed all 13 tests,
and the artifact source-integrity hashes are pinned to the authenticated
run.  This is computational evidence only: the CEGAR lane has no finite
certificate and does not change the Lean closure count.

The corresponding source-clean producer
`Problem97.mem_selectedClass_of_mutualClassPair_sharedMember` compiles under
Lean 4.27 with axiom profile `propext`, `Classical.choice`, and `Quot.sound`.
It is currently a compatibility bank theorem (the exact-fifteen S-profile
module imports the file only for the older negative terminal); no live
consumer supplies the missing reciprocal incidence in the normalized residual.
The load-bearing theorem therefore remains
`OPEN / ON-SPINE / NO SOURCE-CLEAN CONSUMER`, with no new `sorry` and no
closure credit.

### FreshThird one-inside/one-outside interface shadow (2026-08-03)

The remaining noncanonical same-cap arm was tested against a bounded
incidence/cap shadow using the fields actually retained by
`FreshThirdBlockerFiber`, `FreshThirdEqualCenterExactFourRow`, and
`sameCapWithInternalFiberSource`.  The witness has exact-four cap-source
supports `{c₁,c₂,q₁,q₂}`, a reciprocal fresh pair with one equal blocker,
distinct source/fresh centers, and a noncanonical cap containing exactly one
of `q₁,q₂`; the shadow is satisfiable.  The script and output are
`scratch/freshthird_one_inside_one_outside_shadow.py` and
`scratch/freshthird_one_inside_one_outside_shadow.out`.

This is incidence/cap-level diagnostic evidence only: it omits Euclidean
metric, cyclic-order, and Kalmanson constraints, so it is not a countermodel
to the geometric theorem.  It does establish that those packet fields alone
do not expose an unconditional contradiction.  The honest next producer must
therefore add a metric/order invariant (or strengthen the interface with
common-radius/reciprocal-incidence data); no closure credit is assigned.

### FreshThird non-hit theorem-bank audit (2026-08-03)

The indexed U5/survival-cover audit found no source-clean consumer for the
`firstNonHit` or `secondNonHit` constructors.  Their `sourceRowOmission`
payloads can be converted to a q-free exact-four `U5QDeletedK4Class`, but the
current packet gives only one deletion-survival row and therefore does not
meet the five-center deletion terminal.  Their `sameBlocker` payloads can
recover equal selected supports via
`selectedSupports_eq_of_actualBlockers_eq`, which is positive bookkeeping,
not a contradiction.  This confirms that the normalized-remaining theorem is
still `OPEN / ON-SPINE / NO SOURCE-CLEAN CONSUMER`; no closure credit is
assigned.

### FreshThird row-count and sameBlocker probes (2026-08-03)

The row-count audit found only local bounds applicable to the normalized
residual: `selectedFourClass_inter_capByIndex_card_le_two`, the outside-pair
uniqueness lemma, and finite ordered-cap counting statements.  The latter
require a `MecCapPacket`/`StrictCapOrder`/`FaithfulCarrierPattern` interface
which the residual does not carry.  Consequently the one-inside/one-outside
arm cannot be promoted by an existing row-count theorem.

The sameBlocker/sourceRowOmission probe is likewise nonterminal.  `sameBlocker`
recovers center and support equality, but the fresh shell incidence is
compatible with that equality and only contradicts an independently supplied
cross-row hit.  `sourceRowOmission` is row-local; its deletion-survival field
does not imply `False` and does not yield the five distinct survival centers
required by the deletion consumer.  The target remains
`OPEN / ON-SPINE / NO SOURCE-CLEAN CONSUMER`.

### FreshThird five-center producer applicability check (2026-08-03)

The source-clean first-fiber producers
`firstFiber_firstSourceHit_or_fiveCenterDeletion`,
`firstFiber_twoAnchorHits_or_anchoredFiveCenterDeletion`, and
`SixCenterDeletionSurvivalPacket_of_oneSided` were checked against the live
normalized residual.  The first two require a `FreshOutsideFirstBlockerFiber`
or anchored first-fiber packet, including a source outside the canonical cap
and cap-minus-row exact-pair data.  The six-center producer additionally
requires one-sided deletion survival for the two cap-source witnesses, while
the residual supplies survival only against the fresh third sources.  Thus no
conversion is type-correct and the deletion consumers cannot be used as a
hidden bridge.  The normalized-remaining theorem stays
`OPEN / ON-SPINE / NO SOURCE-CLEAN CONSUMER`.

### FreshThird equal-center and metric/order consumer search (2026-08-03)

The equal-center and mixed one-inside/one-outside residuals were checked
against the source-clean cap-cardinality, outside-overlap,
perpendicular-bisector, cyclic-order, and Kalmanson banks.  No import-reachable
terminal consumes either packet.  The equal-center branch lacks a third
noncanonical-cap support point, common outside endpoint pair, or physical
opposite-apex localization; the mixed branch lacks convex-boundary order data
and a shell-to-chord/Kalmanson equality producer.  Candidate signatures and
the missing hypotheses are archived in
`scratch/freshthird-equalcenter-terminal-search-20260803.md` and
`scratch/freshthird-metric-order-consumer-search-20260803.md`.

Status is unchanged: `false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`
is `OPEN / ON-SPINE / NO SOURCE-CLEAN CONSUMER`, with no closure credit.

### FreshThird exact-four/cap-interior bridge audit (2026-08-03)

The follow-up audit checked the exact-four cap-intersection, outside-overlap,
retained-collision, and same-cap alignment consumers against the live
`FreshThirdBlockerFiber` and `FreshThirdNormalizedResidualRemainingCase`
interfaces.  The non-hit constructors provide only row-local omission or
same-blocker data.  The noncanonical equal-center constructor provides an OR
cap-membership fact, not a common first-apex radius, reciprocal row incidence,
both-off-cap endpoints, or a strict boundary order.  Therefore no existing
consumer is type-correct, and no adapter is promoted.  Evidence is recorded
in `scratch/freshthird-cap-interior-bridge-audit-20260803.md` and
`scratch/freshthird-samecap-alignment-audit-20260803.md`.

The normalized-remaining theorem remains `OPEN / ON-SPINE / NO SOURCE-CLEAN
CONSUMER`; closure credit remains zero.

### FreshThird cap-size/composition inventory (2026-08-03)

The bounded cap-composition probe is recorded in
`scratch/freshthird-cap-size-composition-inventory-20260803.md`.  Using the
live cap-sum identity, the lower bounds `ci >= 6`, and the residual field
`cap_card_ge_eight`, it excludes designated-cap FreshThird instances at
`n = 15,16`.  At `n = 17` the only fixed-index profile is `(6,8,6)`; at
`n = 18` the fixed-index profiles are `(6,9,6)`, `(7,8,6)`, and `(6,8,7)`.

This is a finite selector-capacity filter, not a geometric realization or a
universal-in-`n` theorem.  The existing `n = 17` SAT artifacts for the three
remaining arms remain external diagnostic evidence only.  No Lean closure
credit is assigned; the normalized-remaining theorem is still
`OPEN / ON-SPINE / NO SOURCE-CLEAN CONSUMER`.

The count is informative about proof architecture but not by itself about
theorem difficulty.  The family `(6,8,n-11)` keeps the designated cap at size
8 for every `n >= 17`, so the minimal `m=2` local branch persists at arbitrary
`n`.  Any cap-profile case split must therefore retain that thin-cap branch
unless a transport theorem permits choosing the designated cap as a largest
cap.  A geometric impossibility result for the thin profiles or a
profile-independent terminal could instead bypass that split.

The same stars-and-bars identities were checked for every `15 <= n <= 256`:
all labelled profiles are `binomial(n-13, 2)`, and fixed-index designated-cap
profiles are `binomial(n-15, 2)` for `n >= 17`.  At `n=256` these are 29,403 and
28,920 respectively; the corresponding total ordered C-pair capacity is
283,444,920.  This is exhaustive for the stated arithmetic interface, not a
claim about additional geometric profiles or Lean realizability.

The follow-up motif audit is in
`scratch/freshthird-cap-profile-motifs-20260804.md`.  For designated-cap
surplus `m=c_d-6`, the `m=2` thin-cap stratum persists for every `n >= 17` and
has the largest profile multiplicity, while selector-capacity workload peaks
near `m ≈ 2(n-15)/3` (C-pairs) or `m ≈ 4(n-15)/5` (independent C/Q slots).
These are search heuristics only; they do not alter the Lean closure status.

The largest-cap alternative is not currently a free relabeling in the Lean
tree.  `TwoCapSourceThirdCanonicalRowSurface` and
`CapSourceThirdCanonicalRowWitness` hard-code `S.oppIndex1` in the cardinality,
cap-interior, and source-witness fields.  Existing packet redesignations are
useful in other residuals, but no transport theorem currently carries this
FreshThird packet, its blocker fiber, and the normalized residual across a new
cap index.  Until that producer is proved, the uniform `m=2` thin-cap branch is
present in every cap-profile case split; do not replace it with a
largest-cap-only split without the transport theorem.  This does not rule out
closing the branch by a geometric impossibility or a profile-independent
terminal.

### Rigid221 source-heavy large-cap placement split (2026-08-05)

The single open cap-profile arm of the source-heavy blocker-other branch,
`false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge`
(`Rigid221SourceHeavy.lean`), is replaced by a kernel-checked placement
split on the position of `v` and the rigid deleted point relative to the
strict physical second-cap interior.  Three strictly narrower leaves:

1. `..._secondOppositeLarge_vInterior` — `v` in the strict interior; the
   interior then holds the four class points `u`, `xu`, `xv`, `v` and both
   rigid row traces are interior.
2. `..._secondOppositeLarge_deletedInterior` — `v` outside, the deleted
   point in the strict interior; the interior holds `u`, `xu`, `xv` and the
   row-omitted deleted point.
3. `..._secondOppositeLarge_freshInterior` — both outside.  The parent
   proves for this branch the adjacent-cap orientation split, the
   retained-peer identification `other = xv` (recorded above at the
   2026-07-27 fold as not derivable in the at-least-six arm; it is
   derivable in exactly this both-outside branch), and a fresh
   strict-interior carrier witness `w ∉ SelectedClass(A, oppApex2, ρ)`
   extracted from the interior bound `|I| ≥ 4` against the named card-3
   triple.

Cover proof: the class cover
`selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps` with the two
adjacent one-hit bounds (as in the exact-five constructor), and
`capInteriorByIndex_card_add_two` for the fourth-point extraction.  The
coordinator call site in `...blockerVRowOther_sourceRowHeavy` is unchanged.

Coordinator-interface frontier for the source-heavy subtree: before, one
direct `sorry` leaf (`secondOppositeLarge`); after, three placement leaves.
Raw direct-`sorry` delta `+2`.  Immediate constructor fan-out at the new
parent coordinator is three placement arms, none closed.  Narrowing record:
leaf 1 adds proved `v`-interior membership; leaf 2 adds `v`-outside plus
proved deleted-interior membership; leaf 3 adds both-outside, the proved
orientation, the proved `other = xv`, and the fresh off-class interior
witness.  Leaf 3 restores the exact-five placement surface minus its two
cardinality equalities and materializes the fresh cap point that the
2026-07-26 capGrowth audit identified as the unconsumed ingress for the
`CommonDeletionTwoCenterPacket` route; no terminal consumes that packet
yet, so all three leaves remain open obligations.

### Rigid221 source-heavy large-cap incidence split supersedes the placement split (2026-08-05)

The placement split above is superseded the same day and its three
placement leaves are removed.  Auditing the exact-five case lemmas in
`Rigid221SourceHeavy.lean` showed that the exact-five placement packet
(strict interior `= {u, xu, xv}`) is consumed only to pin interior blocker
centers to named class points; every other case lemma is cap-independent.
The unused packet parameter is removed from `..._reciprocalArm`,
`..._uXvMutualOmission_twoDeletions`, `..._uXvMutualOmission_vXvRow_direct`,
and `..._uXvMutualOmission_deletedXvRow_direct` (the two `_direct`
reindexers consumed it only for `xv ∉ source-row`, which follows directly
from `blocker_eq_xv` and `center_not_mem_support`).

`false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge` is now proved
by a kernel-checked incidence split over the `xv`-row and `xu`-row class
traces (each of size `≤ 2` by `actualLateRow_secondClass_card_le_two`):

- `u ∉ xv-row`: the trace dichotomy dispatches to the now cap-independent
  `twoDeletions` / `vXvRow_direct` / `deletedXvRow_direct` closers; the
  `xu ∈ xv-row` case, which the exact-five arm closed with interior
  pinning, is covered by `twoDeletions` outright.
- `u ∈ xv-row, u ∈ xu-row`: `reciprocalArm` (cap-independent).
- `u ∈ xv-row, u ∉ xu-row, xv ∈ xu-row`: closed inline — the pair
  `(v, xu)` is mutually omitting with prescribed joint deletions `u` and
  the rigid deleted point
  (`exactFourMutualOmissionJointDeletion_of_prescribed` plus
  `false_of_twoDistinctExactFourMutualOmissionJointDeletions`).
- `u ∈ xv-row, u ∉ xu-row, xv ∉ xu-row`, second `xu`-row class slot
  empty: closed inline — the pair `(xu, xv)` is mutually omitting with
  prescribed deletions `v` and the rigid deleted point.

Remaining obligations, the only two open leaves:

1. `..._secondOppositeLarge_vXuRow` — row traces pinned to `{u, xu}`,
   `{v, xv}`, `{xv, u}`, `{xu, v}`: the directed four-cycle
   `u → xu → v → xv → u`.
2. `..._secondOppositeLarge_deletedXuRow` — row traces pinned to
   `{u, xu}`, `{v, xv}`, `{xv, u}`, `{xu, deleted}`.

Coordinator-interface frontier for the source-heavy subtree: before, three
placement leaves; after, two incidence leaves, each carrying four proved
row-incidence hypotheses over the parent.  Raw direct-`sorry` delta `−1`
against the placement split (`+1` against the pre-split single leaf).  The
split consumes no cap-profile counting; the exact-five machinery is
untouched.  The placement leaves' fresh-interior ingress witness is no
longer materialized; the two remaining leaves are fully explicit finite
incidence patterns on the five-point class, with the single free `xu`-row
class slot occupied by `v` or by the rigid deleted point.
