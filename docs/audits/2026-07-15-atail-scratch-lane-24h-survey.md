# ATAIL scratch-lane 24-hour survey (2026-07-15)

**Scope**: every file under `scratch/atail-force/` modified since
2026-07-14T09:31 local — 113 lane directories plus ~40 standalone files —
surveyed read-only by a search agent; each lane's own status/verdict line is
quoted with its original rigor label. Commit-level context for the same
window: `f01ff4a2` (producer frontier + metric bank), `9b92cc64`
(SurplusM44Packet shard split), `e442825c` (cold-build benchmark),
`6118e06a` (closure-plan prose skeptic audit,
`docs/audits/2026-07-14-closure-plan-prose-audit.md`).

**Cross-cutting verdict**: no lane claims to close K-A-PAIR (the live
`u1_largeCap_routeB_tail_false` obligation). Every lane that proves Lean
theorems delivers a consumer, adapter, or normal form; every solver lane
delivers a finite-shadow or exact-CAS exclusion. The live geometric
producer/coupling is uniformly OPEN. Where a lane says "kernel-checked," the
printed axiom closure is `propext, Classical.choice, Quot.sound` with no
`sorryAx` unless noted.

---

## 1. Unique-row branch: the (6,5,4) real-exclusion replay

`scratch/atail-force/unique-row-producer/` (user-owned lane; REPORT.md, 2,059
lines).

Lane status header: **"CHECKED INTERIOR-SURVIVOR AND
CROSS-BLOCKER-LOCALIZATION INTERMEDIATES, PLUS CONDITIONAL ADAPTER;
SOURCE-INDEXED ALL-PAIR SURVIVOR SEARCH HAS FOUR FIXED SURVIVORS EXCLUDED BY
INDEPENDENTLY REPLAYED QQ CORES; ACCEPTED PRODUCER OPEN."**

Recorded verdicts:

- Classification table (`card_five_interior_shadow_search.py`):
  - `(5,5,4)` → `EXHAUSTIVE_UNSAT_IN_FINITE_SHADOW` (12/12 supports, 22,498
    DFS nodes, no node cap);
  - `(6,5,4)` → `SAT_TARGET_NEGATING_FINITE_SHADOW_ONLY` after resumed CEGAR
    — fourteen successive fixed shadows are now exactly real-infeasible, but
    the raised-cap run continues to expose new support-1 variants; no
    exhaustive verdict;
  - `(5,5,5)` → `SAT_TARGET_NEGATING_FINITE_SHADOW_ONLY`.
- The first fixed (6,5,4) witness (5-support `[0,2,7,8,9]`, polynomial digest
  `2476ead3…`) is definitively **not** a Problem 97 counterexample. Its 37 row
  equalities force `4*x10y^2 + 1 = 0` over ℝ; a real square is nonnegative, so
  the equalities have no real solution. Proved by
  `p97_counterexample_exact_real_exclusion_654.jl`, which computes a QQ
  Gröbner change matrix for all 37 generators and replays
  `4*x10y^2 + 1 = Σ cᵢ·gᵢ` exactly. Certificate SHA256
  `6a37fbfdf3d55c11bba07837bf371441867bc357e5e4ee0806c43d593b383778`;
  independently replayed.
- Fourteen fixed shadows excluded over ℝ: 11 `CROSSCHECKED_UNIT` (Singular +
  msolve, forward and reverse variable orders); 3 nonunit but exactly
  real-infeasible (shadow 1 above; shadow 7 via `4*x11y^2+1`; shadow 9 via
  `4*x8y^2+1`). The branch is not exhausted: the old 500k-node bound was too
  low, new support-1 witnesses appeared at up to ~1.1M nodes, and the CEGAR
  sequence is nonconverged.
- Four source-indexed all-pair fixed survivors are each excluded by
  independently replayed QQ cores (`unit_core_source_indexed_654_01…04`,
  each ideal `CROSSCHECKED_UNIT`); a bank of ~22 independently replayed unit
  cores (`source-indexed-unit-core-654-09…-22`) is admitted as scanner cuts.
  Only the first is claimed row-deletion-minimal.
- Kernel-checked sorry-free Lean intermediates:
  `card_five_distinct_cap_local_producer.lean` (conditional adapter
  `cardFiveCapOrMutualFields_of_frontier_distinct_capLocalCross`),
  `card_five_interior_survivor_pair.lean`,
  `card_five_cross_blocker_localization.lean`. All generated (6,5,4)
  collision-core Lean files are source-complete and sorry-free but **unbuilt**
  under a standing no-Lean-build gate. The accepted unique-row producer
  (`CardFiveDistinctCapLocalCrossHypothesis` /
  `ExistsSurplusPairCriticalBlocker` / coincident residual-member packet)
  is **OPEN**.

---

## 2. Robust four-center, prescribed deletion-edge, parent wire

### Robust four-center (`false_of_cardFive_robustFourCenterPacket`)

- `parent-transport-extraction/` — "CHECKED TRANSPORT; CONTENT-BEARING
  GEOMETRY STILL OPEN." `RobustFourCenterPacket` and constructor
  `robustFourCenterPacket_of_cardFive` are kernel-checked
  (`ParentTransportExtraction.lean`, sorry-free). The sink
  `false_of_cardFive_robustFourCenterPacket` is explicitly **CONJECTURED**;
  the proof must use global four-center incidence or MEC/cap/full-filter
  geometry.
- `robust-four-center/` — "CONDITIONAL SINK PROVED; CONVEX/MEC/CAP/NO-`IsM44`
  LOCAL PRODUCERS EXACTLY RULED OUT; THE MISSING LAYER IS TOTAL
  GLOBAL-K4/CSS COUPLING." Kernel-checked sinks:
  `false_of_twoBlockerGlobalPairRows`,
  `exists_global_rows_at_two_blocker_support_points`,
  `false_of_supportCentersBisectFrontierPair`, cap-five opposite-apex role
  impossibility. Two exact SymPy countermodels (33-point pinned;
  strict-convex 29-point with cap profile (5,8,19), pinned by SHAs) prove
  convexity + MEC + cap + no-IsM44 + K4-at-six-centers do **not** force the
  pair hit. Producer OPEN.
- `robust-live-bank-adapter/` (2026-07-15) — kernel-checked generic sink
  `exists_strict_qShellPoint_of_robustFourCenterPacket`; "Q-SHELL PRODUCER
  STRATEGY IS EXISTENTIAL; ONE PLACEMENT FIELD AND ONE PRESCRIBED PAIR ROW
  REMAIN OPEN."
- `global-k4-css-bridge-audit/` (2026-07-15) — "SOURCE AUDIT + CHECKED IMPORT
  PROBES; NO CLOSING PRODUCER FOUND."

### Prescribed deletion-criticality edge (h4/h5)

- `prescribed-deletion-edge/` — the standalone prescribed-criticality lane is
  **retired by logical polarity** (forcing prescribed deletion failure on the
  preferred right-outside row contradicts an explicit K4 witness).
  `PrescribedDeletionEdge.lean` kernel-checks (sorry-free)
  `deletion_survives_of_not_mem_selected_support`,
  `row_extension_or_deletion_survives`, `h4_or_f_deletion_survives`,
  `h5_or_d_deletion_survives`, and the actual-map alignment adapter. The
  23-shadow finite abstraction (card 12, (5,5,5)) is EMPIRICALLY VERIFIED.
  Direct h4/h5 equality from live geometry, U5 bounded-support confinement,
  and named-anchor selection all OPEN.
- `history-global-incidence/` — "FINITE INCIDENCE PRODUCER REFUTED; PRESCRIBED
  BLOCKER ROUTING STILL MISSING; CARD-12 EXACT-ROW ROBUST BRANCH HAS A
  CONDITIONAL COUNTING CLOSURE"; `banked_h4_prescribed_center_deletion_survives`
  kernel-checked.

### Parent wire (`false_of_twoLargeCaps_commonCriticalMap`)

- `parent-false-surface/ParentFalseSurface.lean` — kernel-checks
  `false_of_twoLargeCaps_commonCriticalMap_of_producer`: all routine parent
  wiring (second large cap from `hNoM44`, CP surplus packet, frontier
  extraction, producer invocation at `False`), taking
  `CommonCriticalMapClosingProducer` as an explicit input. Sorry-free; does
  not prove the producer.
- `parent-common-map-adapter/` — "KERNEL-CHECKED PARENT TRANSPORT AND BRANCH
  NORMAL FORM; ONE GEOMETRIC LOCALIZATION FIELD STILL OPEN."
- `critical-system-rebase/` — kernel-checked: frontier/survivor pair
  independent of the chosen `CriticalShellSystem`;
  `commonCriticalMapClosingProducer_of_favorableSystemContent` (and routed /
  late-system variants) reach the parent direct-`False` surface. No favorable
  system constructed (open).
- `chosen-tuple-selector/` (2026-07-15) — "KERNEL-CHECKED EXACT CHOICE
  FACTORIZATION, FIXED-DISPATCH AND FULL-PARENT PROP EQUIVALENCES; NO CLOSING
  TUPLE PRODUCED."
- `unified-parent-coupling/` — conditional
  `commonCriticalMapClosingProducer_of_unifiedParentCoupling` kernel-checked;
  constructing `UnifiedFrontierParentCoupling` is OPEN.
- `frontier-continuation-dispatcher/` — "kernel-green bridge and
  branch-complete parent interface; all three content arms remain open."

---

## 3. Bank and audit infrastructure

- `bank-clean-lean-certificate/` — 15-equality core is exact UNIT
  (crosschecked Singular + msolve); rational unit certificate proven; the
  geometry-facing Lean theorem is NOT yet built. Subdirs: `compact-fallback/`
  (`BankCleanFirstBranchSmoke.lean` compiles), `def-sharded/`, `staged/`,
  `microsharded/` (resource-fallback replay generators, source-complete,
  largely unbuilt).
- `bank-clean-unit-independent-audit/` — no report; 56 files. Independent
  exact-algebra audit confirming 15/16/17-row unit certificates across
  variable orders and finite-field lifts.
- `bank-clean-metric-audit/` (2026-07-15) — "STRUCTURALLY BANK-CLEAN;
  SIMULTANEOUS METRIC EQUALITIES CROSSCHECKED UNIT; KERNEL CERTIFICATE AND
  UNIFORM WIRING OPEN."
- `robust-all-center-marco/` (2026-07-15) — "101 CORRECTED STRUCTURAL SHADOWS;
  524 SOUND ROW-MINIMAL CUTS; FIRST 100 BANK-MATCHED; TERMINAL SHADOW
  BANK-CLEAN AND EXACT-CAS UNIT."
- `robust-all-center-cegar/` (2026-07-15) — "OLD SEED REJECTED; REPLACEMENT
  FINITE STRUCTURAL WITNESS SAT BUT ALREADY COVERED BY FORMALIZED
  PRODUCER-BANK CONSUMERS."
- `robust-two-blocker-census/` — "PROVEN LOGICAL TRICHOTOMY; EXHAUSTIVE STATIC
  COUNTS WITHIN THE 930-RESIDUE SURFACE; NO 930 CRITICAL-MAP BRANCH COUNTS."
- `second_center_query/` — `FIVE_ROW_UNIT_CORE_SYNTHESIS.md`: the four
  row-count-5 `CROSSCHECKED_UNIT` cores do NOT collapse to one motif (four
  distinct collision contracts).
- `second_center_metric_cegar/` — no report; metric-aware CEGAR for two fixed
  card-12 Q-C placements.
- `seven-row-unit-core-lean/` — no report; `SevenRowUnitCore.lean` states the
  normalized 21-equation system inconsistent; `EquilateralCoreGrobner.lean`
  proves `equilateralCoreIncompatible … : False` with `#print axioms`.
- `global-k4-extension-unit-replay/` — retained `O,D,E,I,F` 5-row subsystem
  matches the already-kernel-checked `FourPointTwoCircleBisectorOrderCore`
  (two orientations); consumer audit closed, producer OPEN.
- `global-generator-audit/` — recovered provenance; fresh SAT evidence the
  23-family bank may be stale; owns a replay validator only.
- `global-k4-extension-audit-35pt/` — no report; replays all-center-K4
  obligations of the exact 35-point model.
- `row-core-bank-match/` — no direct bank match for the fixed (5,5,5)
  11-equality core (even with role aliasing).
- `row-core-cegar/` — exact match census; the core occurs once in (5,5,5),
  never in (4,5,6); the current bank already kills the saved (5,5,5) by a
  smaller core.
- `current-bank-u1-match/` — theorem-discovery only; no live producer.
- `current-core-motif-audit/` — "EXACT RELABELING AUDIT; NO SMALL
  CONTRADICTION PRODUCER FOUND."
- `current-marco-cores/` — closed computational implication: uniform consumer
  after one radius-row extension (11 shards need h5, etc.).
- `fresh-continuation-marco/` — fresh equality/MARCO audit on the pinned
  1M-retry checkpoint; bank preflight documented.
- `six-frontier-bank-deficits/` — "EXACT SYNTACTIC / METRIC-CLOSURE ANALYSIS";
  no producer.
- `six-frontier-structural-core/` — bounded finite audit + conditional
  scratch-Lean validation (`MECStraddlingTwoRowValidation.lean`); not a proof.
- `ordered-row-core-synthesis/` — "EXACT COMMON PACKET ON THE THREE FIXED
  SHADOWS; LIVE PRODUCER OPEN."
- `strict-witness-bank-search/` — no bank theorem constructs
  `StrictWitnessBankCompletion`; no adapter found.
- `remaining-pattern-map/` — former 87,916-case remainder has a missed
  production-bank classifier.
- `strict-model-css-audit/` — the pinned 29-point strict model does NOT admit
  a total `CriticalShellSystem` (exactly 2 sources uncovered).
- `uniform-row-core-math/` — "NO SINGLE UNAVOIDABLE MOTIF; ORDERED BANK
  CONSUMERS SUPERSEDE BOTH NEW ALGEBRAIC CORES."
- `residue930-bridge/` — "EXHAUSTIVE WITHIN THE CURRENT FINITE
  SUPPORT/EQUALITY ABSTRACTION"; no field claimed from live hypotheses.
- `bank-route-refresh/` — "NO DIRECT BANK CLOSURE; EXACT PRODUCER ANTECEDENT
  IDENTIFIED."

---

## 4. Other lanes

### Continuation / dispatcher / joint-transition consumers

- `continuation-bank-match/` — forced-alternation theorem "PROVEN in checked
  scratch" + theorem-bank match analysis.
- `continuation-geometry-classifier/` — "PROVEN scratch classifier; no
  contradiction claimed."
- `continuation-cap-order-classifier/` — "KERNEL-CHECKED
  NORMALIZATION/NEGATIVE RESULT; NOT A PRODUCER."
- `joint-transition-core/` — "kernel-green scratch composition; the eliminator
  remains unproved."
- `low-hit-residual/` — "kernel-green scratch reduction; the geometric
  producer remains open."
- `cross-survival-eliminator/` — "KERNEL-CHECKED SHARP ONE-ROW NORMAL FORM;
  THE ARM REMAINS OPEN."
- `global-source-selection/` — "KERNEL-CHECKED EXACT APEX-ALIGNMENT NORMAL
  FORM; THE CROSS ARM REMAINS OPEN."
- `off-frontier-continuation/` — full live surface yields no closing producer;
  sharper gap isolated; kernel-checked countermodel.
- `off-frontier-two-hit-geometry/` — positive off-frontier two-hit NOT proved;
  not a consequence of the exact fragment.
- `global-critical-continuation/` — "TOTAL `CriticalShellSystem` IS NOT
  LOAD-BEARING; ALL-CENTER K4 IS THE FIRST ISOLATED MISSING LAYER; smallest
  one-step continuation KERNEL-CHECKED"
  (`secondApex_support_strictInterior_card_ge_two`,
  `secondApex_two_globalK4_continuations`).
- `global-producer-contract/` — "CONSUMER CONTRACT KERNEL-CHECKED; ALL-EIGHT
  FINITE-SHADOW SURVIVOR BANKED; LIVE GLOBAL PRODUCER OPEN."
- `k4-continuation-selector/` — exact 24-center deficit table; one-row
  outside-pair consumer kernel-checked; deterministic membership selector
  OPEN.
- `full-geometry-producer/` — "KERNEL-PROVED TWO-CENTER CAPACITY NORMAL FORM;
  NO FRONTIER ARM CLOSED" (`CapFiveApexRigidity.lean` built);
  `TRACTABLE_FRONTIER_REPORT.md`: kernel-checked branch reduction, terminal
  open.

### Non-equilateral / reverse-mixed / equilateral cluster

- `non-equilateral-continuation/` — kernel-checked; arm not closed by bank.
- `non-equilateral-geometry-consumer/` — kernel-checks strongest terminal +
  isolates missing producer; does not prove `False`.
- `non-equilateral-parent-producer/` — proposed universal producer needs
  geometry; not derivable.
- `non-equilateral-full-parent-reduction/` — sharper choice-order-correct
  packet; does not yet contradict `NonEquilateralOutput`.
- `mixed-parent-producer/` — "CHOICE-FREE PRODUCER AND EXACT THREE-SHAPE
  RESIDUAL KERNEL-CHECKED; FULL PARENT ELIMINATION OPEN."
- `mixed-parent-coupling/` — "MINIMAL PRODUCER SHARPENED; PARENT PRODUCER
  STILL OPEN."
- `mixed-profile-eliminator/` — blocker-payload + third-bisector terminal
  kernel-checked; reverse-mixed profile locally realizable; parent
  global-coupling OPEN.
- `reverse-mixed-residual-reduction/` — attacks three choice-free apex-shell
  shapes.
- `reverse-mixed-radius-consumer/` (2026-07-15) — tests whether the
  deleted-apex omission/distinct-radius pattern closes the reverse-mixed
  residual.
- `equilateral-second-generation/` — "KERNEL-CHECKED NORMAL FORM AND
  OVERSTRENGTH AUDIT; NOT A TERMINAL"; proposed stronger target shown FALSE.

### Blocker / apex / MEC geometry

- `blocker-cap-geometry/` — "PROVEN CAP-LOCATION SPLIT; EXACT THREE-CENTER
  FALSIFIER" (robust branch does not force the blocker into the surplus cap).
- `blocker-apex-alignment/` — adaptive blocker–apex alignment kernel-checked;
  selector-uniform alignment for arbitrary CSS is FALSE / not banked.
- `blocker-distinct-radius/` (2026-07-15) — "KERNEL-CHECKED EXACT PRODUCER
  EQUIVALENCE, ROLE-COLLAPSE, AND UNIFORM CAP-FIVE OPPOSITE-APEX ROLE
  IMPOSSIBILITY; NO FULL-PARENT PRODUCER OR DIRECT CONTRADICTION FOUND."
  `PACKET_REORIENTATION_REPORT.md`: kernel-checked physical cap/apex
  normalization; same-pair frontier transport impossible.
- `endpoint-blocker-geometry/` — endpoint branch decided exactly on
  `CriticalPairFrontier` (card five: both blockers ≠ both surplus-cap
  endpoints).
- `endpoint-continuation/` — current surface does not force endpoint
  membership; kernel-checked interior-cycle countermodel.
- `mec-boundary-critical-rows/` — three MEC-boundary rows do not produce
  prescribed failures; sharp two-arm dichotomy.
- `common-support-geometry/` — decision on the proposed common-support-point
  producer (`∃ f ∈ row₁ ∩ row₂`).
- `common-system-parent/` — "KERNEL-PROVED POLARITY AND ROW COLLAPSE; PINNED
  FINITE-SHADOW COUNTERMODEL; NO K-A CLOSURE."
- `common-deletion-consumer/` — `CommonDeletionTwoCenterPacket` not terminal;
  stronger unconditional continuation kernel-checked.
- `double-survivor-consumer/` — "PROVEN SHARPER BRANCH REDUCER; NO K-A-PAIR
  CLOSURE." Subdir `descent-history-incidence/`: "AMBIENT LIFT REFUTED; EXACT
  HISTORY INVARIANT KERNEL-CHECKED; CURRENT PRODUCTION CONSUMERS STILL NOT
  FORCED."
- `second-apex-joint-fiber/` — "kernel-checked normal form plus exact
  fixed-shadow discovery; K-A-PAIR remains open."
- `second-apex-double-survivor/` — no report;
  `SecondApexDoubleSurvivor.lean` proves
  `firstApex_marginal_inter_secondClass_card_le_one`,
  `exists_pair_double_deletion_survives_secondApex` (kernel-checked).
- `apex-alignment-consumer/` — "KERNEL-CHECKED FAVORABLE-SYSTEM NORMALIZATION,
  EXACT TERMINAL PACKET, AND SHARP DISTINCT-RADIUS PRODUCER EQUIVALENCE;
  FULL-PARENT PRODUCTION OPEN."
- `apex-strict-pair-completion/` — exact theorem-discovery inside the pinned
  fixed-card-12 finite shadow; not a live producer.
- `alternate-apex-descent/` — "SECOND-APEX COMPLETION EXACT IN THE PINNED
  SHADOW; NEWNESS CONDITIONAL KERNEL-CHECKED; IMMEDIATE-TERMINAL ALTERNATION
  DOES NOT CLOSE."

### Bi-apex / cap-local / incidence audits

- `biapex-continuation-grid/` — multiple symmetric four-center global-K4
  continuation normal forms kernel-checked; no current metric core fires;
  missing global coupling shown by exact local models.
- `biapex-continuation-current-bank-refresh/` — "complete; pinned checks
  pass."
- `biapex-continuation-shadow-audit/` — "EMPIRICALLY VERIFIED within one fixed
  finite-incidence abstraction; no live producer" (11 SAT / 12 indeterminate,
  0 UNSAT shards); carries a stale-matcher correction note vs the current
  bank.
- `cap-local-transport-model/` — "EXACTLY VERIFIED WITHIN THE STATED SYMBOLIC
  MODEL": the strongest local surface does NOT force the target.
- `cap-local-transport-proof/` — "ACTUAL FRONTIER BRANCH CONSUMER
  KERNEL-CHECKED; DIRECT PRODUCER STILL OPEN"
  (`CapSeparatedDirectedCross.lean`).
- `generic-marginal-pair-count/` — "KERNEL-CHECKED FINITE NEGATIVE FOR THE
  PAIR-COUNT/INCIDENCE PROJECTION. NOT A EUCLIDEAN OR K-A-PAIR COUNTERMODEL."
- `critical-map-geometry/` — "STAGED QF_NRA UNRESOLVED; ONE FIXED SHADOW
  EXACTLY ELIMINATED BY A CHARACTERISTIC-ZERO IDEAL-MEMBERSHIP CERTIFICATE."
- `critical-map-incidence/` — "PROVEN LEAN NORMAL FORM + EXACT STRENGTHENED
  FINITE SHADOW; NOT A LIVE K-A CLOSURE CLAIM."
- `incidence-surplus-producer/` (2026-07-15) — "EXISTING PRODUCER BOUNDARY
  CONFIRMED; MINIMALITY-ONLY UPGRADE REFUTED; FULL METRIC PRODUCER OPEN."
- `second-cap-incidence-coupling/` (2026-07-15) — "EXACT SYMBOLIC NEGATIVE FOR
  THE PHYSICAL REORIENTATION AND BOTH LOCAL FRONTIER DIRECTIONS. NOT A
  COUNTEREXAMPLE; ALL-CENTER GLOBAL K4 REMAINS THE OMITTED PARENT LAYER."
- `five-row-hinge-kernels/` — `FivePointHingeCycle.lean` proves one shared
  normalization + all four collision contracts (kernel-checked);
  `ProductionAxiomAudit.lean`.

### Sinks / adapters / negative boundaries

- `robust-classifier-target/` — "TWO REALIZABILITY-SAFE CLASSIFIERS
  KERNEL-CHECKED; DIRECT GLOBAL COUPLING REMAINS OPEN."
- `robust-survival-bridge/` — "PROVEN SHARP LOCAL NORMAL FORM; NO CUMULATIVE
  RECURRENCE OR EXISTING CONSUMER"; `production_audit.lean` prints axioms of
  production lemmas.
- `robust-live-transport/` — "PROVEN negative compatibility result plus
  conditional consumer."
- `tetrahedron-bank-adapter/` — "kernel-checked conditional consumer; not a
  K-A-PAIR producer or closure."
- `textbook-geometry-bridge/` — "NO DIRECT PRODUCER; SHARP HYPOTHESIS
  MISMATCH" (textbook MEC facts do not apply to blocker circles).
- `u5-bounded-support-bridge/` — RVOL U5 two-hit mechanism does NOT map to a
  producer; `OneRowConfinementAdapter.lean` kernel-checks that the confinement
  field gives `False`.
- `arc-overtake-frontier-audit/` — "CONSUMER AVAILABLE; NO DIRECT FRONTIER
  PRODUCER; SMALLEST FORCING THEOREM IDENTIFIED."
- `one-row-producer-audit/` — proposed q-shell route is not a routine
  consequence; two pinned exact Euclidean regressions.
- `strict-oppcap-cross-classifier/` — "PROVEN"
  (`StrictOppCapCrossClassifier.lean`). Subdir `directed-cycle-geometry/`:
  exact negative — strict convex/Moser-cap order alone does NOT rule out the
  directed 3-cycle (exact rational 9-point countermodel).
- `nom44-support-localization/` — "KERNEL-CHECKED TERMINAL NORMAL FORM; EXACT
  STRICT-CONVEX NEGATIVE BOUNDARY; UNIFORM PRODUCER OPEN."
- `rank1-producer/` — "PROVEN NEGATIVE NORMAL FORM; LIVE PRODUCER OPEN."
- `joint-profile-elimination/` — no report; `JointProfileElimination.lean`
  proves `false_of_three_carrier_bisector_centers`,
  `false_of_same_xa_profile_pair : False` (kernel-checked).
- `joint-profile-geometry/` — no report; exact five-point audit for paired
  equilateral continuation profiles.
- `leaf-packet-rebase/` — no report; `@[simp] withPacket_*` rebasing helpers
  (kernel-checked).
- `third-row-profile-bank/` — no report; `false_of_same_side` +
  distinctness/radius lemmas (kernel-checked).

### Standalone top-level files

- `REPORT.md` (lane root) — central "ATAIL critical-row coupling checkpoint
  (2026-07-13)"; content-bearing open statement is the card-≥-2 lower bound;
  48 leaves remain open on the kernel.
- `residual_456_mec_obstruction_report.md` — **PROVEN**: the exact four-row
  (4,5,6) residual cannot satisfy MEC disk + nonobtuseness + cyclic order;
  claims a kernel-checked, sorry-free Lean artifact (core axioms only).
- `residual_456_report.md` — the (4,5,6) round-5 residual is externally
  EXACT-REALIZABLE in strict convex position (interval checker + Z3 QF_NRA);
  that residual is NOT excluded.
- `residual_555_round20_kernel_analysis.md` — PROVEN (exact Euclidean, not
  yet Lean-kernel checked) split-bridge contradiction; U5 Gram route PROVEN
  NEGATIVE; the generic Lean theorem/reflected consumer CONJECTURED /
  UNVALIDATED.
- `residual_555_round19_integration_map.md` — "PROVEN in checked scratch;
  deterministic finite-shadow replay integrated. No live `sorry` is closed."
- `urow_cap_multiplicity_proof_attempt.md` — FAILED TO DERIVE
  `URowCapMultiplicityFields`; first missing antecedent (row-provenance
  equality) identified; no theorem claimed.
- `apex_class_finite_profile_assessment_2026-07-14.md` — checked complement
  classification; first missing producer identified.
- `card_four_parent_boundary_assessment_2026-07-14.md` — checked terminal
  interface (sorry-free); common provenance alone cannot close card-four;
  minimal exact finite falsifier.
- `stage1_biapex_survival_bank_assessment_2026-07-14.md` — "RESEARCH
  SPECIFICATION / NO CLOSURE CLAIM"; same-radius double-deletion classifier
  now kernel-checked.
- `endpoint_spending_cycle_analysis_2026-07-14.md` — "CHECKED SCRATCH
  CONSUMER; LIVE PRODUCER OPEN" (no `sorryAx`/`native_decide`).
- Supporting kernel-checked cores / countermodels / axiom audits without
  per-file reports: `same_radius_double_erase_classifier.lean`,
  `coincident_blocker_four_shell_classifier.lean`,
  `card_five_cap_or_mutual_consumer.lean`, `critical_pair_frontier.lean`
  (+ axiom audit), `live_arc_overtake_producer.lean`,
  `live_critical_provenance.lean`, `one_point_cap_mec_kernel.lean`,
  `opposed_equal_chord_mec_core.lean`,
  `boundary_chord_straddling_mec_core.lean`,
  `six_point_two_circle_arc_overtake_production_axiom_audit.lean`,
  `four_point_two_circle_bisector_order_axiom_audit.lean`,
  `stage1_aligned_incidence_boundary.lean`,
  `stage1_one_hit_incidence_countermodel.lean`,
  `stage1_prescribed_apex_deleted_k4_dichotomy.lean`.
- `common_system_metric_probe.py/.json`, `compare_common_system_checkpoint.py`,
  `test_common_system_metric_probe.py` — common-system metric-probe harness.

---

## 5. Flags — hardening toward CHECKED/PROVEN (none closes K-A-PAIR)

No lane flips the top-level obligation OPEN → PROVEN. Notable newly landed or
hardened results (mostly dated 2026-07-15):

- `residual_456_mec_obstruction_report.md` — fresh PROVEN result with an
  explicit sorry-free kernel-checked Lean artifact (strongest genuinely
  closed item in this survey). Note the companion `residual_456_report.md`
  finds a *different* (4,5,6) round-5 residual exact-realizable.
- `unique-row-producer` — the (6,5,4) branch hardened from finite-shadow-only
  to exact real exclusion of all fourteen fixed shadows plus four
  source-indexed survivors (certificate `6a37fbfd…`, independently replayed).
  Still nonconverged CEGAR; producer OPEN; generated Lean cores unbuilt.
- `blocker-distinct-radius` (07-15) — new kernel-checked exact producer
  equivalence + uniform cap-five opposite-apex role impossibility.
- `parent-transport-extraction` — `robustFourCenterPacket_of_cardFive` newly
  kernel-checked; `false_of_cardFive_robustFourCenterPacket` remains
  CONJECTURED.
- `robust-live-bank-adapter`, `chosen-tuple-selector`,
  `robust-all-center-marco` (all 07-15) — additional kernel-checked sinks /
  prop-equivalences / exact-CAS-UNIT terminal shadow.

Recurring caveat across the corpus: the single missing ingredient is
repeatedly named the **total all-center global-K4 / `CriticalShellSystem`
coupling** (see `robust-four-center`, `global-critical-continuation`,
`second-cap-incidence-coupling`, `biapex-continuation-grid`); local
convex/MEC/cap/no-IsM44 data is proven insufficient by multiple exact
countermodels. `global-critical-continuation` additionally shows the *total*
critical-shell system is not load-bearing — all-center K4 is the first
isolated missing layer.
