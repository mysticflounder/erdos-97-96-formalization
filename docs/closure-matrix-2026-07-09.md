<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Problem 97/96 closure matrix (2026-07-09)

This is the executable task register for
`docs/closure-plan-full-spec-2026-07-09.md`. It includes every current
source-level proof hole and every non-`sorry` prerequisite on a selected
closure route, including non-UNSAT census outcomes and final publication
gates. “All” does not promote every speculative research idea into an
obligation: OPTIONAL rows are included only where the existing plan names a
concrete artifact and possible consumer. A row is DONE only when its named
consumer and gate pass.

## Snapshot and status vocabulary

Source index plus the last fully mined graph after the final
`proof-blueprint index --refresh`:

- 5 source declarations with `sorry`;
- all 5 were on both publish-target spines in the last fully mined graph;
- 87 textual proof holes inside those declarations;
- 0 off-spine declarations with `sorry`;
- P97 spine: 23/1827 project nodes open;
- P96 spine: 27/1835 project nodes open; and
- `sorryAx` is the kernel marker reached through the five declarations, not a
  sixth source obligation.

The five-declaration source inventory and node counts are current at build
fingerprint `002b0247c64e`: 6024/6024 mined symbols are fresh.  At this
checkpoint proof-blueprint reports two uncommitted Lean paths,
`PinnedSurplusBank.lean` and `U3ToU5Terminal.lean`; this matrix accompanies
those paths' commit.
Publication remains blocked by the five source declarations above, not by a
stale graph.

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

Before taking a row, run `proof-blueprint anchor list`, inspect the current
diff in every affected file, and avoid any row owned by an active session.

## Kernel obligations

| ID | Status | Source declaration | Direct consumer | Completion gate |
|---|---|---|---|---|
| K-A-PAIR | OPEN-RESEARCH | `Problem97.U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair` (`U1LargeCapRouteBTail.lean:2657`, hole `:2702`) | `false_of_center_p_t2_t20` through the liveData chain | The declaration is sorry-free and absent from `proof-blueprint symbols --with-sorry`. |
| K-A-LIVE | OPEN-RESEARCH | `Problem97.u1_largeCap_routeB_tail_liveData_false` (`U1LargeCapRouteBTail.lean:3525`, 79 holes) | `u1_largeCap_routeB_tail_false` | All LIVE-* rows are DONE and the declaration leaves the spine-open list. |
| K-B-PIN | OPEN-RESEARCH | `Problem97.isM44PinnedSurplusGeneralMResidualsExcluded` (`PinnedSurplusBank.lean:471`, hole `:542`) | `isM44PinnedSurplusResidualsExcluded` | The `m = 5` path, exact critical-shell extraction, outside-triple label, bounded audit frame, and direct finite consumer are DONE; PIN-GENERAL must produce the exact rowwise confined-class proposition or a stronger contradiction. |
| K-B-END | OPEN-PROOF | `Problem97.isM44EndpointResidualsExcluded` (`Base.lean:10055`, holes `:10082`, `:10104`) | `removableVertexOfLarge_of_isM44PinnedSurplus_from_residualSplit` | END-L and END-R DONE; declaration leaves spine-open list. |
| K-B-ERASE | OPEN-PROOF | `Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded` (`Continuation.lean:107`, holes `:183`, `:211`, `:312`, `:337`) | `isM44NonSurplusContainmentExactPinResidualsExcluded` chain | ERASE-P4-U/S and ERASE-P2-R/L DONE; declaration leaves spine-open list. |

## Control and publication gates

| ID | Status | Dependencies | Exact deliverable | Consumer and acceptance |
|---|---|---|---|---|
| CTRL-GRAPH | OPEN-ENG | Generated rewrite reaches a checkpoint; no same-project build/miner active | Run the required serialized target builds for source edits, then `proof-blueprint refs --refresh` and `status`. | Current build fingerprint equals the mined fingerprint; no branch or anchor is `graph-stale`. This is a coordination refresh, not publication evidence. |
| CTRL-OWN | OPEN-ENG | CTRL-GRAPH | Refresh `proof-blueprint anchor list`; assign one owner per active source file; each session owner clears or moves its own stale anchor. | No two sessions edit the same proof declaration or run same-project builds concurrently. One agent does not clear another session's anchor or overwrite its file. |
| CTRL-GIT | OPEN-ENG | Concurrent generated-certificate work finished | Owners adjudicate every generated-file change, commit the accepted tree, and record the supported generator command. Discarding another session's output requires that owner's or Adam's explicit approval. | `git status --short` has no unexplained generated churn; HEAD can reproduce the source tree. |
| PUB-BUILD | OPEN-ENG | All kernel rows DONE; CTRL-GIT DONE | Run one serialized full `lake-build`, then `proof-blueprint index --refresh` and `proof-blueprint refs --refresh`. | Build succeeds; source index and mined graph are fresh against the same HEAD. |
| PUB-AXIOMS | OPEN-ENG | PUB-BUILD | Query both target axiom closures and every new certificate terminal theorem. | Only Lean core axioms plus approved `Lean.trustCompiler` where audited `native_decide` is used; no unsafe/extern/implemented-by decision procedure in that closure. |
| PUB-SORRY | OPEN-ENG | PUB-BUILD | Run `proof-blueprint symbols --with-sorry` and textual `rg` scan. | Zero source declarations with code `sorry`; prose mentions only. |
| PUB-GATE | OPEN-ENG | PUB-AXIOMS, PUB-SORRY | Run `proof-blueprint verify-publish` for both configured targets. | Exit 0; both target spines kernel-complete; no off-spine sorries. |

## Card-11 Census554 route

### Operations and terminal artifact

| ID | Status | Dependencies | Exact deliverable | Consumer and acceptance |
|---|---|---|---|---|
| A11-OPS-HOME | PARTIAL | Census process stopped for final data move | Move the provisional code, state, bank, schemas, and deterministic fixtures from `scratch/census-554/` to `census/census_554/`. Keep bulk certificates/run outputs in a documented ignored artifact directory; copy before deleting and verify the bank digest. | Permanent package now contains combinatorics, locking/transactions, terminal publication, structural bank audit, and self-contained smoke/tests. Driver/miner/verifier/generator/state and the changing bank remain under `scratch/` while the live run advances, so this row remains open. `uv run python -m census.census_554.cover_probe_smoke` passes from repo root. |
| A11-OPS-LOCK | DONE-CODE; RESTART-PENDING | A11-OPS-HOME only for final path cleanup | Use one lifetime driver lease for `frontier_loop`, direct/broad CEGAR, and direct banking. Under a separate transaction lock, allocate after the maximum PID suffix, canonical-dedupe, exactly revalidate, journal the transaction, atomically publish fsynced certs, and atomically replace the fsynced bank. | Infrastructure tests cover cross-process lease exclusion, max-suffix allocation, canonical dedupe, and post-certificate fault cleanup. The live process began before this code loaded, so lifetime exclusion takes effect on restart; its child publisher already used the new transaction for `pat_05443`. |
| A11-OPS-CNF | OPEN-ENG | A11-OPS-HOME | Preserve the implemented per-process temporary CNF ownership in the permanent package. Terminal mode copies a named final CNF into its staging directory. | Two concurrent smoke solvers use distinct paths; fresh-checkout smoke passes with the historical `/private/tmp/claude-501` directory absent. Working-tree prototype exists; permanent gate remains. |
| A11-OPS-TEST | PARTIAL | A11-OPS-HOME, A11-OPS-LOCK, A11-OPS-CNF | Commit self-contained fixtures and deterministic tests for SAT gates, `unlabeled_key` relabel invariance, non-isomorphic separation, AUTOS containment, and `embed_into_cube` validity. Do not require ignored certificate payloads or cwd-relative imports. | Permanent self-contained motif smoke and infrastructure/audit tests pass from repo root. The SAT encoder's four solver gates still live in scratch and must move before this row is DONE. |
| A11-OPS-TERM | DONE-CODE; LIVE-GATE-PENDING | A11-OPS-LOCK, A11-OPS-CNF | Stage final CNF, checked DRAT, extracted core CNF, LRAT, lock-consistent bank snapshot, and exact instance provenance. Record hashes/versions and publish `COVERAGE_COMPLETE.json` last only after re-solve and `drat-trim` verification. | Unit tests prove failed checking emits no marker; a real CaDiCaL 3.0.0 + `drat-trim` integration emits and re-verifies core/LRAT. `verify_completion` rejects the legacy marker schema and rechecks every digest and DRAT. Any marker from the pre-restart process fails this mandatory gate. |
| A11-BANK-AUDIT | PARTIAL | A11-OPS-HOME | Produce an immutable normalized bank audit: every line valid JSON; unique canonical PID/motif; cert exists; cert PID/pattern matches row; exact verifier passes; orphan certs reported. Preserve the known proof-identical `pat_00003` duplicate only in raw provenance. | Structural snapshot at 5,444 raw / 5,443 normalized rows passed: no unexplained duplicate, missing cert, or orphan; digests recorded by `census.census_554.bank_audit`. Exact replay is explicitly NOT_RUN and the live bank can advance, so final freeze remains open. |
| A11-RUN | ACTIVE-PRELEASE | A11-OPS-LOCK, A11-OPS-TEST, A11-OPS-TERM | Reach exactly one recorded terminal state: solver UNSAT, genuine ALIVE candidate, zero-certified/certify failure, or explicit bounded stop. | File/log evidence at 19:40 PDT shows iteration 1240 and 5,444 raw rows; process-list access was sandbox-blocked. The process predates the lifetime lease/terminal rewrite. No terminal result is claimed. |
| A11-OUTCOME | DECISION | A11-RUN reaches a recorded terminal state | Adjudicate the terminal state. UNSAT authorizes A11-FREEZE. ALIVE requires independent exact realization review, then either a proved necessary cut and restart or a recorded route blocker. Certify failure requires tool repair/retry. Bounded stop requires an explicit resume/abandon decision. | One outcome and its evidence are recorded; no downstream UNSAT row is dispatched for ALIVE, failure, or bounded-stop output. |
| A11-FREEZE | OPEN-ENG | A11-OUTCOME selects UNSAT; A11-OPS-TERM, A11-BANK-AUDIT | Immutable manifest containing normalized bank digest, cert digests, exact motif-instance provenance, final CNF/proof digests, script commit, command, and versions. Independently run `verify_certs.py` over every source pattern referenced by the manifest. | Clean-checkout verifier reproduces all digests, checks the SAT proof and manifest/CNF correspondence, and validates all referenced certs. A stdout-only UNSAT does not pass. |
| A11-COVER-FMT | OPEN-ENG | A11-FREEZE, or a representative frozen prefix for measurement | Compare direct Lean `decide`/DFS certificate, generated search trace, and checked DRAT/LRAT route. Record source size, build wall time, peak memory, and number of pattern IDs used. | Select the first format whose targeted `lake-build` remains below the 30-minute hard ceiling and the wrapper's 16,384 MB per-Lean-worker cap. If none qualifies, return measured blocker; do not claim coverage. |
| A11-CORE | IMPLEMENTED-ON-UNSAT | A11-OPS-TERM reaches checked UNSAT | Use `drat-trim -c/-L` to emit an UNSAT core CNF and LRAT, map core exclusion clauses back to manifest rows, and emit source-row digests/PIDs with cert sizes. | Integration test maps the needed exclusion into the extracted core. The live cover has not reached UNSAT, so no real core exists yet; later replay consumes the core, not the fleet. |

### Certificate replay

| ID | Status | Dependencies | Exact deliverable | Consumer and acceptance |
|---|---|---|---|---|
| A11-GEN | OPEN-ENG | A11-OPS-HOME, A11-CORE | Integrate the tracked certificate generator in the permanent package; generated files have project headers and deterministic output. Preserve the committed disjoint batch namespace and absence of duplicate global declarations. | Generate one base, pair, and multi-pair module twice byte-identically; import batch and individual compatibility probe together; targeted `lake-build` and proof-blueprint index both succeed. Twenty-one representative replay modules are committed; core-specific generation remains open. |
| A11-CERT-BENCH | PARTIAL | A11-GEN, real A11-CORE | Build representative smallest/median/p90/largest cover-core certs serially and record source bytes, coefficient terms, wall time, and peak memory. Set the naive-replay threshold from core measurements, targeting 10 minutes and never exceeding 30 minutes or 16,384 MB per Lean worker. | Fleet scan records 78.16 GB total, p50 54,787 B, p90 7,193,804 B, p99 365,247,505 B, max 2,281,208,887 B, and 157 certs over 100 MiB. Core-specific builds/classification remain open. |
| A11-CERT-LIGHT | OPEN-ENG | A11-CERT-BENCH | Generate and build every LIGHT cover-core certificate. Export one `IsDead` theorem per core pattern. | Targeted modules build serially; generator's exact re-derivation passes; theorem axioms are core plus approved native-decision boundary. |
| A11-CERT-HEAVY | OPEN-ENG | A11-CERT-BENCH | For each HEAVY core certificate, choose in order: re-lift with alternative order, split the `multi_pair` Rabinowitsch set, re-mine a smaller covering motif, then optimize `SPoly.normalize`. Record old/new terms and build time. | Every heavy core ID obtains a buildable `IsDead` theorem within the same limits. Fleet-wide heavy certificates outside the core are not blockers. |
| A11-CERT-INDEX | OPEN-ENG | A11-CERT-LIGHT, A11-CERT-HEAVY | Generated `CoverCoreBank.lean` lists core patterns and maps every entry to its `IsDead` theorem without duplicate declarations. | One target imports the full core bank within build budget; no missing or extra pattern IDs versus A11-CORE. |

### Geometry bridge

| ID | Status | Dependencies | Exact deliverable | Consumer and acceptance |
|---|---|---|---|---|
| A11-GEO-CARD | DONE | Existing cap-sum and lower-bound lemmas | `Census554.card_ge_eleven_of_twoLargeCaps`: surplus cap `>4`, distinct second cap `>=5`, third cap `>=4` imply `11 <= A.card`. | `lake-build Erdos9796Proof.P97.Census554.GeometryBridge` succeeds; axioms are only `propext`, `Classical.choice`, and `Quot.sound`. Wiring remains A11-WIRE-*. |
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
| A11-COVER-CHECK | OPEN-ENG | A11-FREEZE, A11-COVER-FMT, A11-CORE | `coverCore_covers : CubeOk kappa -> exists row in coverCore, exists f, PatternEmbedsUnder row.pattern f kappa`, where the relation includes `Set.InjOn f (support row.pattern)`. | Selected finite checker builds and checks the frozen manifest; changing one known-needed cover witness makes its regression fixture fail. |
| A11-COVER-DEAD | OPEN-PROOF | A11-CERT-INDEX, A11-COVER-REL, A11-COVER-CHECK | `not_realizesCube_of_coverCore : CubeOk kappa -> not (RealizesCube x kappa)`. | Proof chooses a covered row and embedding, obtains `row.Certified` from the generated certificate index, and applies `CoverRow.not_realizesCube_of_embeds`. Core axioms plus approved native boundary only. |
| A11-CONSUME | OPEN-PROOF | A11-GEO-CUBE, A11-COVER-DEAD | `Census554.false_of_cardEleven_twoLargeCaps`: obtain `frame`, `L`, `S`, and `CubeOk S.cube` from `exists_card11SelectedCube_cubeOk`; build `RealizesCube L.pointOf S.cube` through the A11-COVER-REL adapter; contradict `not_realizesCube_of_coverCore`. | `lake-build Erdos9796Proof.P97.Census554.Card11` succeeds. The theorem has no liveData-row hypotheses and does not add a second geometric realization proof. |
| A11-WIRE-PAIR | OPEN-PROOF | A11-GEO-CARD, A11-CONSUME | At the start of `DoubleApexOffSurplusSharedRadiusPair`, split `D.A.card = 11` versus `12 <= D.A.card`; close card 11 by false elimination; leave the exact card-at-least-12 residual. | Source hole is narrowed to the >=12 branch with a named statement consumed immediately; no off-spine placeholder. |
| A11-WIRE-LIVE | OPEN-PROOF | A11-GEO-CARD, A11-CONSUME | At the start of `u1_largeCap_routeB_tail_liveData_false`, obtain the second large cap, split card 11 versus >=12, and close card 11 before the case tree. | Card-11 path contains no case sorries; remaining LIVE-* rows explicitly carry `12 <= D.A.card`. |

## Front-A card-at-least-12 and liveData rows

### Route decisions and Candidate D

| ID | Status | Dependencies | Exact deliverable | Consumer and acceptance |
|---|---|---|---|---|
| AHEAD-DEC | DECISION | None; defer until A11 outcome unless Adam authorizes parallel research | Choose: hold all >=12 work, or authorize head-only card 12-14 narrowing. | Written choice records resource cap and whether a named >=15 residual may be introduced. No head census launches before this decision. |
| AHEAD-SPEC | OPTIONAL-PARTIAL | AHEAD-DEC chooses head census before any run | Keep tooling in `census/card_head/`; exclude CONJECTURED cuts from the proof tier; prove every retained geometric cut. Enumerate the listed 3/6/10 labeled profiles at n=12/13/14. | Python enumeration/tests and Lean `labeled_cap_profile_card{12,13,14}_iff` prove arithmetic exhaustiveness. Candidate-count fixtures and necessity of any additional cut remain open; no head census was launched. |
| AHEAD-N12 | OPTIONAL | AHEAD-SPEC | Run all three n=12 profiles under PROVEN cuts with predeclared wall, bank-growth, and shape-staleness stops. | One immutable manifest and honest terminal state per profile; current `654_all` run does not pass because it used a CONJECTURED cut and did not converge. |
| AHEAD-N13 | OPTIONAL | AHEAD-SPEC | Run all six labeled n=13 profiles under the same proved interface and stops. | One immutable manifest and honest terminal state per profile; the existing 300/300 dead sample is not coverage. |
| AHEAD-N14 | OPTIONAL | AHEAD-SPEC | Run all ten labeled n=14 profiles under the same proved interface and stops. | One immutable manifest and honest terminal state per profile; the existing 160/160 dead sample is not coverage. |
| AHEAD-COVER | OPEN-RESEARCH | AHEAD-N12, AHEAD-N13, AHEAD-N14 all reach checked coverage | For every profile, replay the used deadness-certificate core and kernel-check its finite cover plus the geometric profile-to-cube bridge. | Sorry-free theorem excludes exactly cards 12, 13, and 14 under the actual Front-A hypotheses. Current evidence does not satisfy this row. |
| AHEAD-CONSUME | OPEN-PROOF | AHEAD-COVER | Split both Front-A consumers into card <=14 and `15 <= D.A.card`; eliminate the checked head cases and introduce the exact named >=15 residual only with its immediate spine consumer. | Cards 12-14 disappear from both leaves; no off-spine placeholder or sample-based split. |
| ATAIL-SUB2 | OPEN-RESEARCH | Candidate-D probe | Decide the seven-variable half-disk `SUB2-H` statement by hand proof or independently checked CAD/QE. | A Lean theorem, not solver timeout or floating evidence; feed resulting cut into Q3. |
| ATAIL-Q3 | OPEN-RESEARCH | Existing proved per-type cuts; ATAIL-SUB2 if used | Complete two-center Q3 coupling sweep with exact witnesses/certificates and state the surviving class surface. | Reproducible artifact plus theorem-facing statement; SAT windows are not full-configuration counterexamples. |
| ATAIL-FORCE | OPEN-RESEARCH | ATAIL-Q3 or a new mechanism | Prove the convexity-coupled shared-radius conclusion required by K-A-PAIR for all cards >=12, or for cards >=15 only if AHEAD-CONSUME is DONE; alternatively prove `False` from the same hypotheses and eliminate into that conclusion. | K-A-PAIR DONE. No pattern-only or equality-only statement is acceptable because explicit n=15/16/20 realizations falsify that surface. |

### liveData textual-hole families

Each LIVE row must either close every listed leaf or replace the family by a
strictly narrower named on-spine theorem with a proved consumer in the same
change. One theorem per permutation orbit is preferred; 24 copy-pasted proofs
are not the default plan.

| ID | Status | Exact holes | Required output and gate |
|---|---|---|---|
| LIVE-Q | OPEN-RESEARCH | 24 ordered `q = t2[0]` leaves at lines 3792, 3812, 3850, 3870, 3908, 3928, 4075, 4095, 4133, 4153, 4191, 4211, 4285, 4306, 4346, 4367, 4407, 4428, 4501, 4521, 4560, 4580, 4619, 4639 | Factor and prove a consumer invariant under the 24 support-label permutations; textual hole count drops by 24 with no new unconsumed `sorry`. |
| LIVE-T1 | OPEN-RESEARCH | 24 `t1 = t2[0]` source-slot leaves at lines 4799, 4807, 4887, 4895, 4975, 4983, 5063, 5071, 5107, 5115, 5149, 5157, 5203, 5211, 5241, 5249, 5277, 5285, 5331, 5339, 5369, 5377, 5405, 5413 | Prove two row-vs-fixed-triple consumers: six positive `ht1Row_l1` leaves where the source slot is `l1 = t1`, and eighteen negative leaves for the other source/label orders. Close all relabelings; do not assert one false polarity-uniform lemma. |
| LIVE-T3 | OPEN-RESEARCH | 24 `t3 = t2[0]` source-slot leaves at lines 5487, 5491, 5515, 5519, 5543, 5547, 5591, 5595, 5619, 5623, 5647, 5651, 5695, 5699, 5723, 5727, 5751, 5755, 5799, 5803, 5827, 5831, 5855, 5859 | Produce and apply the t3 mirror orbit consumer; textual hole count drops by 24. |
| LIVE-C-Q | OPEN-RESEARCH | line 5876, outer branch `f2CriticalRow.center = q` | Named contradiction from available localized packet, fixed triple, row data, and liveData; close branch without adding assumptions. |
| LIVE-C-T1 | OPEN-RESEARCH | line 5877, center `t1` | t1-centered contradiction, exact same consumer boundary as source branch. |
| LIVE-C-T2-N | OPEN-RESEARCH | line 5883, center `t2`, all named | Consume `hf5_named`, `hp_named`, and `hq_named`; prove branch `False`. |
| LIVE-C-T2-F | OPEN-RESEARCH | line 5884, center `t2`, `t2ResidualHRowFailure` | Prove the row-failure contradiction or a narrower named residual with immediate consumer. |
| LIVE-C-T3 | OPEN-RESEARCH | line 5885, center `t3` | t3-centered contradiction. |
| LIVE-C-U | OPEN-RESEARCH | line 5886, center `u` | u-centered contradiction. |
| LIVE-C-FRESH | OPEN-RESEARCH | line 5887, fresh center | Fresh-center contradiction; if a sixth critical row is required, state its exact packet and consumer together. |
| LIVE-FINAL | OPEN-PROOF | All LIVE-* | Remove all 79 holes and build `U1LargeCapRouteBTail`; K-A-LIVE leaves both target spines. |

## Front-B producer rows

| ID | Status | Dependencies | Exact deliverable | Consumer and acceptance |
|---|---|---|---|---|
| END-L | OPEN-PROOF | Existing `endpointLeft_residual_exists_false_of_metric_shadow_data` | `EndpointCertificate.endpointLeft_residual_exists_metricShadow`: produce `∃ shadow, endpointShadowInBank xLabel shadow = true ∧ EndpointMetricShadow pointOf shadow`. The open content is non-v/w selected-class confinement, exact-four/card/self exclusion, circumcenter/no-three, and `sepOKFor`. | Replace Base hole 10082 by one call; targeted endpoint producer and Base modules build. |
| END-R | OPEN-PROOF | END-L reusable lemmas; right residual core data | Exact mirror theorem for `endpointMirrorLabelPoint`. | Replace Base hole 10104; K-B-END DONE when both sides land. |
| PIN-R | DONE | Label-complete `S.surplusCap.card = 5`, right pinned geometry | Right half of `IsM44PinnedSurplusNonVExactShapeProducerStatement`: construct same-radius support classes and exact candidate masks. | Proved; `PinnedSurplusProducer` builds without `sorry`. |
| PIN-L | DONE | PIN-R mirror lemmas and left label map | Left half in the label-complete regime. | Proved; full metric-shadow producer builds without `sorry`. |
| PIN-GENERAL | OPEN-RESEARCH | `5 < S.surplusCap.card`; exact bank explicitly out of scope; both `exists_pinned*ExtraCriticalPacket` theorems DONE | Consume `CriticalShellSystem A`, the exact `CriticalSelectedFourClass` on `{y,t1,t2,t3}`, a triple label outside the pinned class, and the extracted `U3FixedTripleAuditFrame` `H`. Every audit center has a proved exact q-deleted-four/q-critical-three row dichotomy. The direct finite consumer `¬ H.RowwiseConfinedQDeletedClasses` is DONE for every such frame and bypasses U2/Mode A. Current 135-leaf singleton bank still has uncovered finite-interface models at labelled-cardinality floors 2 and 3. | Prove `H.RowwiseConfinedQDeletedClasses`: eliminate or promote every q-critical-three row, then prove bounded-support inclusion for each q-deleted four-class. A stronger direct audit-frame contradiction is also acceptable. Do not import U2/U5 or containment conclusions that depend on this residual. Remove `PinnedSurplusBank.lean:542`. |
| ERASE-P4-U | OPEN-RESEARCH | Exact data already at Continuation lines 150-177 | Prove `False` for the direct surplus-opposite erased-pin triple, via row-confined classes + Mode A or a new sound direct cut. | Replace line 183. No ten-label claim may assume more than three surplus labels without an explicit extra-label bridge. |
| ERASE-P4-S | OPEN-RESEARCH | Exact data at lines 184-205 | Prove the direct surplus-interior mirror/family contradiction. | Replace line 211. |
| ERASE-P2-R | OPEN-PROOF, actively owned at audit | Side-specific right ordered scaffold types in Base lines 6055ff | Refactor away the false broad `hrightCandidate`; produce `ErasedPinRightFiniteCandidateOrderedScaffoldFacts` from the concrete ordered mask interface and feed `rightFiniteCandidateSepFacts_of_*`. | Replace line 312; side-specific theorem and Continuation build. |
| ERASE-P2-L | OPEN-PROOF, actively owned at audit | Left ordered scaffold and ERASE-P2-R mirror lemmas | Left counterpart using independently reversed surplus order. | Replace line 337; K-B-ERASE DONE once P4 rows also land. |
| ERASE-P3-MAP | OPTIONAL | None | Deterministic map from each blocked erased-pin row/site to the exact multi-center class code and orientation used by the census. | Round-trip test from row -> class -> row features; no Lean `sorry`; no claim of geometric necessity. |
| ERASE-P3-SWEEP | OPTIONAL | ERASE-P3-MAP | Run targeted CONJECTURED-tier appendix and report which cuts separate all mapped survivors. | Reproducible artifact with PROVEN/CONJECTURED labels. A discovered cut creates a proof row only after a necessity theorem and consumer are specified. |

## Cross-cutting multi-center research

These rows are not on the current closure path. They may become relevant only
through MC-CONSUMER; do not introduce off-spine sorries while exploring them.

| ID | Status | Dependencies | Exact deliverable | Consumer and acceptance |
|---|---|---|---|---|
| MC-EXTRACT | OPTIONAL | Existing `JointClass`, `CapProfile`, and leaf data | Concrete `extractedClass`/`extractedProfile` plus `extractedClass_locallyAdmissible`, proving support, center-use=4, capacity, H1, pair-sharing, and Q3 cuts field by field. | Sorry-free module builds; extraction applies to an actual Front-A hypothesis package. |
| MC-SURFACE | OPTIONAL | MC-EXTRACT | Instantiate `ProfileRealizationSurface`; prove `GlobalSound` and exact profile occurrence/extension facts. | Existing abstract `localInventory_stepPersistent` applies to the concrete surface. |
| MC-T1 | OPEN-RESEARCH | MC-SURFACE | `CompletesGlobalFrom` or an equivalent geometric LOCAL-to-GLOBAL upper bound. | Produces a theorem identifying scoped LOCAL codes with geometric GLOBAL realizations above a stated threshold. Representative-surface completeness alone does not pass. |
| MC-CONSUMER | OPEN-RESEARCH | MC-T1 plus a named geometric consequence | Exact theorem consumed by K-A-PAIR or K-A-LIVE, with hypotheses available at that source site and conclusion matching a needed field. | Consumer call is on the kernel spine. Until this row has a viable statement, MC-* remains optional research. |
| MC-CONJ | OPTIONAL | A route-specific question such as ERASE-P3 | Full targeted CONJECTURED-tier appendix, not merely n=12..15 smoke. | Artifact and audit note only; no automatic proof status. |

## Exhaustive textual-hole reconciliation

| Declaration | Hole lines | Count |
|---|---|---|
| `DoubleApexOffSurplusSharedRadiusPair` | 2702 | 1 |
| `u1_largeCap_routeB_tail_liveData_false` | LIVE-Q (24), LIVE-T1 (24), LIVE-T3 (24), terminal 5876, 5877, 5883, 5884, 5885, 5886, 5887 | 79 |
| `isM44PinnedSurplusGeneralMResidualsExcluded` | 542 | 1 |
| `isM44EndpointResidualsExcluded` | 10082, 10104 | 2 |
| `isM44NonSurplusContainmentErasedPinTripleResidualsExcluded` | 183, 211, 312, 337 | 4 |
| **Total** | | **87** |

## Final commands

Run only after the shared tree is stable and no other same-project build is
active:

```bash
lake-build
proof-blueprint index --refresh
proof-blueprint refs --refresh
proof-blueprint symbols --with-sorry
proof-blueprint spine
proof-blueprint verify-publish
```

`proof-blueprint verify-publish` is the terminal acceptance criterion. Bank
counts, successful SAT runs, generated source volume, and reduced textual
`sorry` count are intermediate evidence only.
