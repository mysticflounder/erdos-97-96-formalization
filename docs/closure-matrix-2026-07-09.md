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

Current inventory (updated 2026-07-11 after the K-B-END route-(b) split,
commit 136ebb9b, and the K-B-END-LABEL closure — both m=5 endpoint holes
proved, umbrella off the spine-open list; freshness audit
`docs/audits/2026-07-11-closure-plan-freshness-audit.md`):

- 5 source declarations with `sorry`;
- all 5 on both publish-target spines;
- 86 textual proof holes inside those declarations;
- 0 off-spine declarations with `sorry`; and
- `sorryAx` is the kernel marker reached through the five declarations, not a
  sixth source obligation.

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
| IMPLEMENTED-ON-UNSAT | The implementation is ready but activates only after a checked UNSAT result. |
| OPTIONAL-PARTIAL | Optional research has partial infrastructure or evidence but no closure claim. |

Semicolon-separated statuses describe independently auditable components; the
row is not complete until its stated acceptance gate passes.

Before taking a row, run `proof-blueprint anchor list`, inspect the current
diff in every affected file, and avoid any row owned by an active session.

## Kernel obligations

| ID | Status | Source declaration | Direct consumer | Completion gate |
|---|---|---|---|---|
| K-A-PAIR | OPEN-RESEARCH (scoped 2026-07-12) | `Problem97.U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair` (`U1LargeCapRouteBTail.lean:2516` post-restructure, hole `:2561`) | `false_of_center_p_t2_t20` through the liveData chain | SCOPED (`docs/audits/2026-07-12-ka-route-scoping.md`): card-11 slice TRACTABLE via A11-WIRE-PAIR (census lane; two large caps force `11 ≤ card`); card ≥ 12 tail OPEN-RESEARCH (ATAIL-FORCE) — raw incidence cannot force the pair (11-point shadow), uniform pattern statements falsified; surviving route Candidate-D two-center coupling, deciders ATAIL-SUB2 → ATAIL-Q3. Gate: declaration sorry-free and absent from `proof-blueprint symbols --with-sorry`. |
| K-A-LIVE | OPEN-RESEARCH (scoped 2026-07-12) | `Problem97.u1_largeCap_routeB_tail_liveData_false` (`U1LargeCapRouteBTail.lean:3433` post-restructure, 79 holes) | `u1_largeCap_routeB_tail_false` | SCOPED (`docs/audits/2026-07-12-ka-route-scoping.md`): families LIVE-Q/T1/T3 (24 each) + LIVE-C-* (7); per-leaf certificates excluded (COMP-1 `:3246`, F5 SAT classification); card-11 slice TRACTABLE via A11-WIRE-LIVE (card split before the case tree, `card_ge_eleven_of_twoLargeCaps` DONE); card ≥ 12 residual needs a bounded-forced-subsystem producer over the six critical rows ((Q)-flavor, shared with K-A-PAIR). First decider: LIVE-BANK-MATCH (leaf → RowSlotLabelPacket → bank-ordinal map, validated on the 12 closed leaves). Gate: all LIVE-* rows DONE and the declaration leaves the spine-open list. |
| K-B-PIN | PARTIAL; LEFT-REFLECTION | `Problem97.isM44PinnedSurplusGeneralMResidualsExcluded` in `PinnedSurplusGeneralM.lean` | `isM44PinnedSurplusResidualsExcluded` | DONE in Lean: the open `5 < m` branch is forced to `m = 6`, `A.card = 11`, with exact `(6,4,4)` cap-selected hit counts; all six incidence fields and native placement soundness are proved. `CapSelectedPinnedShellBridge` now turns every right aligned residual packet into `ClosureCoreAlternative` and consumes all twelve certified core cases on the geometric carrier. The terminal source returns `PinnedRightSurplusResidualAt -> False` as its first conjunct. OPEN: the explicit left-to-right finite reflection, its shell/closure transport, and its source adapter for the second conjunct. |
| K-B-END-LABEL | DONE (2026-07-11) | `Problem97.isM44EndpointResidualsExcluded` (`Base.lean`; both former `hshadow` holes proved) | `removableVertexOfLarge_of_isM44PinnedSurplus_from_residualSplit` | Route (b) implemented (136ebb9b) and the m=5 branch fully proved: `EndpointCertificate/GeometryProducer.lean` (sorry-free) supplies `endpointLeft/Right_residual_false_of_card_five`, each covering both ambient CCW apex orientations (direct + reflected kernels `SurplusCOMPGBankGeometry.lean:1498/:1621`; apex orientation SYMMETRIC not forced per the 2026-07-11 prover verdict; the mirror residual flips the kernel pairing). Gate passed: full library green and `isM44EndpointResidualsExcluded` left the `proof-blueprint spine` open-obligations list; its only remaining dependency is the K-B-END-GENERAL leaf. Commits: 858b7e39, 8a7e6d1b, b2183714, 35bc63aa, f67e7818, e7ee31a2, plus the right-residual closure. |
| K-B-END-GENERAL | DONE (2026-07-12, commit 3114fb1f) | `Problem97.isM44EndpointGeneralMResidualsExcluded` (`Base.lean:9511`, hole `:9513`; stated strictly `5 < S.surplusCap.card`) | `isM44EndpointResidualsExcluded` (`m ≠ 5` branch) | General-m endpoint leaf, routed to the forced `m = 6` / `A.card = 11` machinery (K-B-PIN). Cannot consume K-B-PIN unchanged: endpoint escape forces the Moser apex OUT of the escaped row, failing `PinnedShellOK`. Scoped extension required (see `docs/audits/2026-07-11-endpoint-generalm-representability.md`): `EndpointLeft/RightShellOK` seed predicates, classifier extension to the seed union, one (4,2,2) bridge seed-production case, endpoint source consumers. Finite gate PASSED 2026-07-11 — EXACT WITHIN MODEL, not PROVEN: 64-placement sweep (both families, twelve formalized metric cores, enumerate-residuals, complete=true) returned zero residuals (`census/endpoint_confinement/endpoint_direct_metric_core_residuals_n11.json`); no new metric cores needed. STAGING LANDED (5c44d1fc, 6fbde4a8): `EndpointCertificate/GeneralMCardEleven.lean` (sorry-free, no Base import) — card-11 forcing transport, full left+right escape row-shape families (selected classes card-4 interior-pinned, escapee strict-interior + surplus-cap disjointness), and the `EndpointLeft/RightShellOK` seed predicates over the `Fin 11` vocabulary matching the probe encoding. Next: endpoint placement checks against the committed native classifier (gate: `#eval` all 64 before proving — the Lean `hasPrefixCore` core set is not identical to the probe's core granularity), then the soundness transport mirroring `CapSelectedNativeClosureSound` (committed c5fcf286). BRIDGE LANE 2026-07-11 late: transport map `docs/audits/2026-07-11-endpoint-classifier-transport-map.md` (58f93ae2 - left family reuses the committed search code verbatim; right family needs a center-2 detector fork with fresh native runs); bridge design `docs/endpoint-generalm-bridge-design-2026-07-11.md` (a57c7e71, lemmas L1-L13; L9/L10/L10b done upstream at 9e6b5722 `incidenceOK_patternCode`); `EndpointCertificate/BridgeStaging.lean` landed 41d704f3 (L1a-L5: minimality glue, `labelOf`, Moser-cap class forcing + k4Radius uniqueness, endpoint no-qfree, T1 decomposition, row-0 two-intS-slots chooser - obstruction E1 discharged). ASSEMBLY INPUTS ALL LANDED 2026-07-11: `BridgeCarrier.lean` 9bac7853 (L6 public prescription constructor, L7 `endpointBlocker` + transports, L8 row-1 equation, right L3/L4 mirrors); `OrderedCoreSigns.lean` 2c32e3a1 (L12 branches 11-12, core axioms only); `EndpointClassifierSound.lean` + `EndpointClosureSound.lean` fffff751 (transport items 4-7; finals `closureCoreAlternative_of_incidenceOK_endpointLeft/RightShellOK`, axioms core + ofReduceBool/trustCompiler). Pinned lane 8ebadfa2 supplies `false_of_duplicateCenterCore_patternCode` + `false_of_perpBisectorCore_patternCode` for the branch dispatch. CLOSED 3114fb1f: `EndpointCertificate/BridgeAssembly.lean` (L11 `exactAt_endpointBlocker`, right L7/L8 mirrors, system-exposing blocker assemblies, L12b `false_of_closureCoreAlternative_of_canonical`, L13 `false_of_endpointEscapeLeft/Right_cardEleven`) + minimal Base.lean wiring at `:9513`. Leaf axioms: propext/Classical.choice/Quot.sound + Lean.ofReduceBool/Lean.trustCompiler (allowed set, no sorryAx); full library green (9307 jobs); spine open inventory 5 → 4 declarations. |
| K-B-ERASE | OPEN-PROOF | `Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded` (`Continuation.lean:107`, holes `:183`, `:211`, `:312`, `:337`) | `isM44NonSurplusContainmentExactPinResidualsExcluded` chain | ERASE-P4-U/S and ERASE-P2-R/L DONE; declaration leaves spine-open list. |

## Control and publication gates

| ID | Status | Dependencies | Exact deliverable | Consumer and acceptance |
|---|---|---|---|---|
| CTRL-GRAPH | OPEN-ENG | Generated rewrite reaches a checkpoint; no same-project build/miner active | Run the required serialized target builds for source edits, then `proof-blueprint index --refresh`, `refs --refresh`, `refs --check`, and `status`. | Source index and mined graph describe the same current build; no branch or anchor is `graph-stale`. This is a coordination refresh, not publication evidence. |
| CTRL-OWN | OPEN-ENG | CTRL-GRAPH | Refresh `proof-blueprint anchor list`; assign one owner per active source file; each session owner clears or moves its own stale anchor. | No two sessions edit the same proof declaration or run same-project builds concurrently. One agent does not clear another session's anchor or overwrite its file. |
| CTRL-BANK-PREFLIGHT | OPEN-ENG | CTRL-GRAPH | Before any new finite-pattern, row-slot, incidence, or local-metric contradiction, inspect every registry listed in `AGENTS.md` and run `nthdegree docs search --lean`. Record normalized candidate statement, source/import reachability, closure status, field-by-field live-packet map, first missing antecedent, circularity check, and immediate spine consumer. | The record either identifies a directly usable theorem and its producer map or gives a bounded negative result. A consumer without its producer does not authorize a new `sorry` or certificate hunt. |
| CTRL-GIT | OPEN-ENG | Concurrent generated-certificate work finished | Owners adjudicate every generated-file change, commit the accepted tree, and record the supported generator command. Discarding another session's output requires that owner's or Adam's explicit approval. | `git status --short` has no unexplained generated churn; HEAD can reproduce the source tree. |
| PUB-BUILD | OPEN-ENG | All kernel rows DONE; CTRL-GIT DONE | Run one serialized full `lake-build`, then `proof-blueprint index --refresh` and `proof-blueprint refs --refresh`. | Build succeeds; source index and mined graph are fresh against the same HEAD. |
| PUB-AXIOMS | OPEN-ENG | PUB-BUILD | Query both target axiom closures and every new certificate terminal theorem. | Only Lean core axioms (including `Lean.ofReduceBool`/`Lean.ofReduceNat` when present) plus approved `Lean.trustCompiler` where audited `native_decide` is used; no unsafe/extern/implemented-by decision procedure in that closure. |
| PUB-SORRY | OPEN-ENG | PUB-BUILD | Run `proof-blueprint symbols --with-sorry` and textual `rg` scan. | Zero source declarations with code `sorry`; prose mentions only. |
| PUB-GATE | OPEN-ENG | PUB-AXIOMS, PUB-SORRY | Run `proof-blueprint verify-publish` for both configured targets. | Exit 0; both target spines kernel-complete; no off-spine sorries. |

## Card-11 Census554 route

### Operations and terminal artifact

| ID | Status | Dependencies | Exact deliverable | Consumer and acceptance |
|---|---|---|---|---|
| A11-OPS-HOME | PARTIAL | Census process stopped for final data move | Move the provisional code, state, bank, schemas, and deterministic fixtures from `scratch/census-554/` to `census/census_554/`. Keep bulk certificates/run outputs in a documented ignored artifact directory; copy before deleting and verify the bank digest. | Permanent package now contains combinatorics, locking/transactions, terminal publication, structural bank audit, and self-contained smoke/tests. Driver/miner/verifier/generator/state and the changing bank remain under `scratch/` while the live run advances, so this row remains open. `uv run python -m census.census_554.cover_probe_smoke` passes from repo root. |
| A11-OPS-LOCK | DONE-CODE; LIVE-EXERCISED | A11-OPS-HOME only for final path cleanup | Use one lifetime driver lease for `frontier_loop`, direct/broad CEGAR, and direct banking. Under a separate transaction lock, allocate after the maximum PID suffix, canonical-dedupe, exactly revalidate, journal the transaction, atomically publish fsynced certs, and atomically replace the fsynced bank. | Infrastructure tests cover cross-process lease exclusion, max-suffix allocation, canonical dedupe, and post-certificate fault cleanup. The current frozen probe was launched after the preservation-first transition and holds its workdir lock; its child publisher previously used the bank transaction for `pat_05443`. |
| A11-OPS-CNF | OPEN-ENG | A11-OPS-HOME | Preserve the implemented per-process temporary CNF ownership in the permanent package. Terminal mode copies a named final CNF into its staging directory. | Two concurrent smoke solvers use distinct paths; fresh-checkout smoke passes with the historical `/private/tmp/claude-501` directory absent. Working-tree prototype exists; permanent gate remains. |
| A11-OPS-TEST | PARTIAL | A11-OPS-HOME, A11-OPS-LOCK, A11-OPS-CNF | Commit self-contained fixtures and deterministic tests for SAT gates, `unlabeled_key` relabel invariance, non-isomorphic separation, AUTOS containment, and `embed_into_cube` validity. Do not require ignored certificate payloads or cwd-relative imports. | Permanent self-contained motif smoke and infrastructure/audit tests pass from repo root. The SAT encoder's four solver gates still live in scratch and must move before this row is DONE. |
| A11-OPS-TERM | DONE-CODE; LIVE-GATE-PENDING | A11-OPS-LOCK, A11-OPS-CNF | Stage final CNF, checked DRAT, extracted core CNF, LRAT, lock-consistent bank snapshot, and exact instance provenance. Record hashes/versions and publish `COVERAGE_COMPLETE.json` last only after re-solve and `drat-trim` verification. | Unit tests prove failed checking emits no marker; a real CaDiCaL 3.0.0 + `drat-trim` integration emits and re-verifies core/LRAT. `verify_completion` rejects the legacy marker schema and rechecks every digest and DRAT. Any marker from the pre-restart process fails this mandatory gate. |
| A11-BANK-AUDIT | PARTIAL | A11-OPS-HOME | Produce an immutable normalized bank audit: every line valid JSON; unique canonical PID/motif; cert exists; cert PID/pattern matches row; exact verifier passes; orphan certs reported. Preserve the known proof-identical `pat_00003` duplicate only in raw provenance. | The frozen 5,836-row bank has SHA-256 `36348d35397a494bee5ac0ab9e423c20802e7aff45fa12f0530df36a57cfc43a` and passed the structural audit used by the transition. Full exact certificate replay remains explicitly open, so final freeze remains open. |
| A11-STRUCTURAL-SEED | DONE-CODE; MIXED-SOURCE LEAN REPLAY OPEN | CTRL-BANK-PREFLIGHT; the twelve `GeneralCarrierBridge` metric-core alternatives | Keep structural exclusions separate from the Nullstellensatz bank. Preserve the 36-instance `FourRowPerpBisectorCore` seed and run a theorem-provenance CEGAR oracle for every branch detectable from a raw equality cube. Validate finite row/flip paths, boundary-order scope, source/build/axiom evidence, and complete profile orbits; snapshot all inputs before replay. | The catalog records all twelve formalized alternatives; eleven are raw-cube eligible and exact-off-circle is explicitly disabled without `ExactAt`. Nine unordered families and two ordered families (each checked in direct and reverse orientation) emit replayable records. Ten Lean sources and `GeneralCarrierBridge.olean` SHA-256 `9104b9a9d466801ab0894e5e2ff993d3ec91cbee4411ffb41c3b52342e09b96b` are frozen; the build passes and axioms are exactly `propext`, `Classical.choice`, and `Quot.sound`. Transition and resume tests reject provenance conflict, orbit loss, or evidence downgrade. Final Lean publication still needs checked structural-record and order/orientation replay. |
| A11-RUN | ACTIVE-RESUMABLE | A11-OPS-LOCK, A11-OPS-TEST, A11-OPS-TERM, A11-STRUCTURAL-SEED | Reach exactly one recorded result: solver UNSAT, genuine ALIVE candidate, zero-certified/certify failure, or explicit bounded stop. | Source `transition-bank5836-structural36-20260711T185116Z` ended at a checked `combined-frontier` with 1,602,162 dynamic records and 156,278 static instances. The preservation-first transition retained every record, reopened with `integrity_check=ok`, and atomically published `run-20260711T204242Z-40533-f03a883e` with 1,758,440 total instances and zero target collisions. The new theorem-oracle probe is live under a four-hour / 5,000-refinement cap and checkpoints every iteration; `progress.json` is authoritative and no terminal result is claimed yet. |
| A11-OUTCOME | DECISION | A11-RUN reaches a recorded terminal state | Adjudicate the terminal state. UNSAT authorizes A11-FREEZE. Classify ALIVE as Boolean cube, exact `RealizesCube`, or full Front-A-leaf configuration; the latter two require an independent exact realization review and complete assumption ledger. Certify failure requires tool repair/retry. Bounded stop requires an explicit resume/abandon decision. | One outcome and its evidence are recorded; no downstream UNSAT row is dispatched for ALIVE, failure, or bounded-stop output. |
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
| AHEAD-DEC | DECISION (postponed 2026-07-12) | None; defer until A11 outcome unless Adam authorizes parallel research | Choose: hold all >=12 work, or authorize head-only card 12-14 narrowing. Adam 2026-07-12: postponed — no spare compute at present; the defer-until-A11-outcome default stands, revisit when compute frees up. | Written choice records resource cap and whether a named >=15 residual may be introduced. No head census launches before this decision. |
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
| LIVE-BANK-MATCH | OPEN-ENG | CTRL-BANK-PREFLIGHT; before any LIVE-Q/T1/T3 or terminal branch certificate hunt | Machine-readable map: ordered live leaf → `RowSlotLabelPacket` construction → available row/equality/distinctness facts → theorem-bank candidate or first unavailable/circular antecedent → immediate spine consumer. | Registry preflight and `nthdegree docs search --lean` result are attached. A negative map is accepted; no new sorry or unguided certificate hunt is. |
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
| END-MOD | DONE (2026-07-11) | CTRL-GRAPH, CTRL-OWN | `EndpointCertificate/GeometryProducer.lean` exists (green, sorry-free; commits 8a7e6d1b, b2183714, 35bc63aa): label-complete engine, u-mask-bound family, circumcenter family. It may be imported by `Base.lean`, but must not import `Base.lean` or a consumer of `isM44EndpointResidualsExcluded`. | Import DAG and public signatures are reviewed; source/axiom audit is explicit because the certificate namespace is mining-skipped. |
| END-L | DONE (2026-07-11) | END-MOD | `endpointLeft_residual_false_of_card_five` (GeometryProducer.lean, sorry-free): right-apex branch (f67e7818) + reflected branch + combiner (e7ee31a2), assembled component-wise (the `mem_interfaces` wrapper is unusable — diagonal `sepOKFor c c` is false). | Base left hole replaced by one producer call (e7ee31a2); full library green. |
| END-R | DONE (2026-07-11) | END-MOD, END-L template | `endpointRight_residual_false_of_card_five` via Plan B: inline mirror over `endpointMirrorLabelPoint = leftPinnedLabelPoint` (funext bridge, not defeq), kernel pairing flipped vs END-L (left-apex → direct, right-apex → reflected). | Base right hole replaced by one producer call; full library green; umbrella left the spine open-obligations list (K-B-END-GENERAL remains). |
| PIN-R | DONE | Label-complete `S.surplusCap.card = 5`, right pinned geometry | Right half of `IsM44PinnedSurplusNonVExactShapeProducerStatement`: construct same-radius support classes and exact candidate masks. | Proved; `PinnedSurplusProducer` builds without `sorry`. |
| PIN-L | DONE | PIN-R mirror lemmas and left label map | Left half in the label-complete regime. | Proved; full metric-shadow producer builds without `sorry`. |
| PIN-METRIC-TRIAGE | DONE-BOUNDED | PIN-GENERAL saved relaxed row systems; `Census554.EqualityCore`, `ConvexFivePointCore`, `ConvexRhombusCore` | `metric_realizability_structural_complete` partitions all 1,325 saved systems as 1,264 duplicate-center, 31 exact-off-circle, 20 perpendicular-bisector, 9 cyclic five-point, and 1 cyclic rhombus/equilateral contradiction. | Deterministic regression checks the exact partition. Generic Lean consumers for all five schemas build and are core-only under `proof-blueprint axioms`. This row claims saved-artifact coverage only. |
| PIN-METRIC-BRIDGE | PARTIAL | PIN-METRIC-TRIAGE; `CapSelectedRowCounting`; concrete `CriticalShellSystem`; convex-order API | DONE: twelve generic metric-core consumers, arbitrary-cardinality `rowPattern`/`Realizes`, and orientation-symmetric finite cyclic predicates. DONE in Lean: `5 < m` forces the card-eleven `(6,4,4)` case; `CapSelectedGeometry.exists_canonicalLabeling_of_isM44_surplus_card_eq_six` constructs exact `intS`/`intO1`/`intO2` preimages with direct-or-reflected hull order; `CapSelectedClosureColor` gives a canonical closure color. `CapSelectedCarrierBridge.incidenceOK_patternCode` proves all six incidence conjuncts (`LocalRowsOK`, `RowIntersectionsOK`, `PairCenterCountOK`, `CrossSeparationOK`, `Q3OK`, and `CapSelectedCountsOK`), including the upstream non-Moser circumcenter exclusion without U2 or containment assumptions. Its axiom closure is core-only: `propext`, `Classical.choice`, and `Quot.sound`. `CapSelectedNativeClassifierCoverage` proves recursive semantic search coverage, and `CapSelectedNativePlacements.allPlacementChecks` proves all twelve native replays. `CapSelectedNativeClosureSound.closureCoreAlternative_of_incidenceOK_pinnedShellOK` proves the union-find parent/root invariant, extracts all four active core families, and closes the total finite classifier theorem. Its kernel closure is `propext`, `Classical.choice`, `Lean.ofReduceBool`, `Quot.sound`, and approved `Lean.trustCompiler`; the module has no `sorry`, `axiom`, `unsafe`, `@[implemented_by]`, or `@[extern]` declaration. EXACT WITHIN MODEL: the external miner certified all 795,609 prefix kills and reduced them to 149,434 minimal nogoods, but its 647,221,809-byte flat bank was rejected because the generic proof makes that payload unnecessary. | OPEN: prove `PinnedShellOK` from each aligned hull orientation, then wire the resulting `ClosureCoreAlternative` to the existing geometric consumers. Acceptance is the geometry/source theorem and removal of the target `sorry`; no generated bank remains on the critical path. |
| PIN-GENERAL | PARTIAL | CTRL-BANK-PREFLIGHT; `5 < S.surplusCap.card`; `SurplusCapPacket.surplus_card_eq_six_of_convexIndep_K4`; `SurplusCapPacket.card_eq_eleven_of_surplus_card_gt_five` | The formerly general-`m` branch is proved to have `m = 6`, `A.card = 11`. Exact cap counts, the canonical `Fin 11` labeling, all six `IncidenceOK` conjuncts, canonical closure coloring, every native pruning rule, search coverage, all twelve placement replays, and the total finite `ClosureCoreAlternative` theorem are kernel-checked. | Complete `PinnedShellOK`; apply `closureCoreAlternative_of_incidenceOK_pinnedShellOK` and the existing consumers; remove the sole declaration-level `sorry`. Shared-pair interval descent remains fallback research. Do not import downstream residual or containment conclusions. |
| PIN-KQ35 | DONE-CORE; PARTIAL-PRODUCER | `Problem97.SurplusCapPacket.q3_shared_interior_false_of_adjacent_selectedClass_membership` | The full K-Q3-5 normalization, packet alignment, side-product extraction, and orientation symmetry are kernel-checked: the source-facing adapter consumes `z` in the indexed cap interior, `p`/`q` in adjacent interiors, and four endpoint `SelectedClass` memberships. | `proof-blueprint axioms` for the source-facing theorem is core-only. The open work is to extract those seven geometric/class facts from a concrete selected-class branch; the row does not claim that extraction or the PIN-GENERAL producer. |
| PIN-EXACT-CLOSURE | DONE-CORE; OPEN-PRODUCER | `EqualityCore.false_of_exactAt_of_exactOffCircleCore`; `ExactShellBridge.false_of_criticalFourShell_exactOffCircleCore` | Equality closure forcing an excluded label onto an exact row circle is kernel-checked, and the exactness endpoint is bridged to a live `CriticalFourShell`. Produce a realized pattern and closure witness from a PIN-GENERAL shell/audit packet. | No saved probe assignment is itself a Lean realization. The remaining producer must map its labels, support membership, and off-support label into the bridge without importing a circular confinement conclusion. |
| ERASE-P4-U | OPEN-RESEARCH (scoped 2026-07-12) | CTRL-BANK-PREFLIGHT; exact data already at Continuation lines 150-177 | SCOPED (`docs/audits/2026-07-12-erase-p4-route-scoping.md`): route A consumer chain fully committed (`U3ToU5Terminal.lean:310` → `U5FiniteExtraction.lean:1983`, Mode A unnecessary via A1); sole missing input `RowwiseConfinedQDeletedClasses` (:296) = (Q)-flavor content, all recorded levers closed (dead-ends Cluster 1). Route B: no sound cut over the five-input surface — exact-rational card-10 witness `SO_t2_PuQ1` (row-truth probe) satisfies all five inputs + ConvexIndep + IsM44 + minimality and realizes the pin; `hK4` load-bearing. Routes converge on census-style finite closure at forced cards {10,11} (third classifier instance); deciding ladder ERASE-P3-MAP → ERASE-P3-SWEEP. {{NEEDS_ADAM_INPUT}} on committing to the P3 diagnostic lane. | Replace line 183. No ten-label claim may assume more than three surplus labels without an explicit extra-label bridge. |
| ERASE-P4-S | OPEN-RESEARCH (scoped 2026-07-12) | CTRL-BANK-PREFLIGHT; exact data at lines 184-205 | Mirror of ERASE-P4-U (witness `SI_c-s1_Q2vPu`); fewer structural bounds attach (non-apex center). Same P3 ladder; see the 2026-07-12 scoping audit. | Replace line 211. |
| ERASE-P2-R | OPEN-PROOF (route BLOCKED 2026-07-11) | Side-specific right ordered scaffold types in Base lines 6055ff | §B.3 consumer-refactor dispatch returned NO EDITS with a blocker report: the third `hfiniteResidualRows` goal is `ErasedPinFiniteCandidateSepSplitOrderedScaffoldFacts S x`, baked into the intermediate statement (`Base.lean:9167`, conjunct `:9190`); it forces the two `OneSidedSeedCandidateRemainder` fields (`Base.lean:1223/:1229`) regardless of Continuation-side restructuring. Sole producer `oneSidedSeedCandidateRemainder_of_mask_interfaces` (`SurplusCOMPGBankGeometry.lean:3913`) requires `RightOneSidedErasedPayloadSeedMaskInputs` (`Base.lean:442`), which has zero tree-wide producers; the remainder is reported refutable in the `(0,0,0,4)` config via `false_of_privateSurplusTriple_u_crossSeparation` (`:5238`). AUDITED 2026-07-11 (`docs/audits/2026-07-11-erase-p2-remainder-blocker-audit.md`): blocker CONFIRMED in corrected form — zero remainder producers in `lean/` and all indexed banks; cross-separation for the pinned witness is unconditional (`SurplusCOMPGBankGeometry.lean:2016`), so for any `p` realizing row-(0,0,0,4)/(0,0,4,0) counts the remainder goal is false in the real configuration; any producer must contain the row exclusions, inverting the `Base.lean:9167` dependency; the §B.3 route fails identically. No Continuation-only discharge exists. Correct factoring: per-row refutation redraft of `Base.lean:9167` + new per-row geometric content (forced `.u`-class facts under row counts). {{NEEDS_ADAM_INPUT}} on the redraft. | Replace line 312; side-specific theorem and Continuation build. |
| ERASE-P2-L | OPEN-PROOF (route BLOCKED 2026-07-11) | CTRL-OWN; left ordered scaffold and ERASE-P2-R mirror lemmas | Left counterpart; same blocker as ERASE-P2-R (the Sep-split conjunct carries both sides' remainder fields). | Replace line 337; K-B-ERASE DONE once P4 rows also land. Active ownership is determined live through `CTRL-OWN`, not a dated status label. |
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

Updated 2026-07-11 (route-(b) split, commit 136ebb9b; line numbers per the
2026-07-11 freshness audit):

| Declaration | Hole lines | Count |
|---|---|---|
| `DoubleApexOffSurplusSharedRadiusPair` | 2702 | 1 |
| `u1_largeCap_routeB_tail_liveData_false` | LIVE-Q (24), LIVE-T1 (24), LIVE-T3 (24), terminal 5876, 5877, 5883, 5884, 5885, 5886, 5887 | 79 |
| `isM44PinnedSurplusGeneralMResidualsExcluded` | sole terminal `sorry` in the declaration | 1 |
| `isM44EndpointGeneralMResidualsExcluded` | Base.lean 9514 (declared 9512) | 1 |
| `isM44NonSurplusContainmentErasedPinTripleResidualsExcluded` | 183, 211, 312, 337 | 4 |
| **Total** | | **86** |

(`isM44EndpointResidualsExcluded` closed 2026-07-11 — K-B-END-LABEL DONE;
its two former holes are proved by the GeometryProducer producers.)

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
