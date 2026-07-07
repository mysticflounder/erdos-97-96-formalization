<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Master closure plan (2026-07-06)

The complete route from the current kernel state to `verify-publish` passing
on both targets, with every gate, decision point, and open uncertainty named.

Ownership: this doc owns cross-cutting strategy, gates, dispatch-ready specs,
and the uncertainty register. The two lane plans —
[`u-lane/97-slot3-certificate-closure-plan-2026-07-06.md`](u-lane/97-slot3-certificate-closure-plan-2026-07-06.md)
and [`four-point-subpacket-plan.md`](four-point-subpacket-plan.md) — own
per-lane execution logs. Corrections they should fold in are in §11. Audit
basis: the three 2026-07-06 audit docs under [`audits/`](audits/). The
sorry-level companion —
[`sorry-closure-ledger-2026-07-06.md`](sorry-closure-ledger-2026-07-06.md) —
enumerates every `sorry` in the tree (including in-proof case sorries and the
off-spine pair) with a route and acceptance test each.

Kernel state (fresh spine, 2026-07-06, post `[mining].skip` unblock):
`Problem97.erdos97_rhs` 928/950 nodes closed; five sorry obligations open;
`Problem96.erdos96_rhs` reaches the identical five (its upstream bridge is
closed — no 96-specific work remains); two off-spine sorries in
`U2OppCap2Escape.lean`; live axiom closure per target = core + `sorryAx` +
`Lean.ofReduceBool` + `Lean.trustCompiler`.

## 0. Closure criteria

`proof-blueprint verify-publish` passes on both targets, meaning all of:

1. Five obligations closed (§§2–6) — no `sorryAx` on either spine.
2. `Lean.trustCompiler` approved in `.blueprint.toml [axioms]` — **DONE
   2026-07-06** (approved by Adam; §8).
3. ~~The two `U2OppCap2Escape.lean` sorries wired or deleted~~ — **DONE
   2026-07-06**: whole file atticked (`attic/U2OppCap2Escape.lean`) per
   Adam; dead-ends.md entry; import surface preserved via
   `U2NonSurplusOneHit` (ledger §2.6).
4. Mined graph fresh at the final check.

## 1. Obligation map

| # | Obligation (`Problem97.…`) | Site | Route | Residual uncertainty |
|---|---|---|---|---|
| 1 | `isM44EndpointResidualsExcluded` | `RemovableVertexAxiom.lean:324` | endpoint certificate stack (built), wiring remains | LOW |
| 2 | `isM44PinnedSurplusResidualsExcluded` | `RemovableVertexAxiom.lean` | m-split: exact bank (m=5) + relaxed vocabulary (general m) | MEDIUM, enumerable (§3, U1) |
| 3 | `isM44NonSurplusContainmentErasedPinTripleResidualsExcluded` | `RemovableVertexAxiom.lean` | probe RESOLVED-SAT → census extension (§4) | LOW — mechanical pipeline |
| 4 | `…MetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair` | `U1LargeCapRouteBTail.lean:2383` | split: (5,5,4) census (\|A\|=11) + workstream D (\|A\|≥12) | \|A\|=11 MEDIUM; \|A\|≥12 HIGH (§7) |
| 5 | `u1_largeCap_routeB_tail_liveData_false` | `U1LargeCapRouteBTail.lean:3251` | active in-tree branch split (ledger §2.5); COMP-1-blocked leaves still need a producer | HIGH on blocked leaves, gated on §7 |

## 2. Obligation 1 — endpoint residuals

Everything below the wiring exists and builds (oleans verified 2026-07-06):
117 certificates, `Patterns.All` (incl. sharded `EpQ1008`), `ShadowBank`,
`ShadowSearchShards.All` + `ShadowSearchCoverage` (incidence bridge closed:
`endpointShadowOK` → bank membership), `Soundness`/`AggregateSoundness`/
`BankSoundness`, `Variables`/`PolynomialGeometry`/`NormalAxisVariables`/
`MetricShadow`/`GeneratorZeros`, `RowZeros.{Direct,Product}.All`, and a
`RowZeros/Bank.lean` composition layer. None of it is imported by a spine
module yet.

Remaining steps:

1. Row-zero coverage: confirm `RowZeros/Bank.lean` (or add it) discharges
   `CertificatePayload.evaluationZeros` for **every** row — direct and
   product-sum — from `EndpointMetricShadow`.
2. Residual instantiation: from `EndpointEscapeLeftAt`/`RightAt`, produce the
   `EndpointMetricShadow` and the finite-mask interface facts (mask-card,
   no-self, one-hit, circumcenter, no-three, pair-count, separation) via the
   closed one-hit theorems and the ten-label distinctness dictionary.
3. Wire: `BankSoundness.false_of_endpointShadowInBank_of_payload_zeros` into
   `isM44EndpointResidualsExcluded`; import chain lands the cert corpus on
   the spine.

Acceptance: spine diff showing the obligation ✓ (not a build log — the cert
modules are invisible to the spine until step 3's import).

Uncertainty: LOW. m-uniformity is safe (both payload classes at non-surplus
Moser apices; ≤2 anonymous members, absorbable — proven ingredients). The old
"do all 117 patterns encode only these two classes" caveat is substantially
closed by the generator classification: 3510 distance generators + 115
Rabinowitsch, zero unclassified. No named residual expected.

## 3. Obligation 2 — pinned surplus residuals (m-split, stated explicitly)

The obligation quantifies over all IsM44 packets (m ≥ 5). The exact ten-mask
bank is faithful only at m = 5 (|A| = 10), where the ten labels exhaust A.
This is a hard fact, decisively probed (all artifacts verified):
lifted support uses non-{v,w} centers on all 134 solved rows; {v,w}+separator
is nonunit for all 135; the relaxed singleton split recovers unit on all 135
leaves. Therefore:

**Regime m = 5 (land first — strict narrowing).** Exact route as in the lane
plan: residual → pinned payload → `isValidPinnedFragment` →
`pinnedSurplusCOMPGBankBridge` → `ExactBridge`/`GeometryBridge` → payload
zeros. Wiring shape: an m-split theorem proving the full statement from
(m = 5 case) + (named general-m residual), with the residual following the
house placeholder pattern (`abbrev …Statement` + sorry-backed theorem).
Proposed name: `isM44PinnedSurplusGeneralMResidualsExcluded`. The wiring
commit must state the m-range each proved component covers.

**Regime m ≥ 6 (the named residual's route).** The relaxed singleton
vocabulary, not the exact masks:

1. Per-row required-fact enumeration — **DONE 2026-07-06, residue EMPTY**
   (`scripts/pinned-generalm-required-facts.py`;
   `certificates/surplus/reports/pinned_surplus_generalm_required_facts.{json,md}`;
   135/135 files pass validation, output byte-identical across runs). All
   3041 nonzero-coefficient generators fall in exactly four fact categories:
   exact v-center (269), exact w-center (338), Rabinowitsch separator (133 —
   present and nonzero on every leaf that has one), erased-center facts with
   both witnesses inside the leaf's `common_erased_masks` (2301). No fifth
   category; zero residue instances. 72 distinct (center,witness) bits are
   used; per-use classes: case_common 1782, path_entailed 2537, split_yes
   283 (zero overlap) — split_path bits act as case hypotheses, confirming
   the case-split reading.
2. Separator transport: the separator zero-evaluation needs τ := 1/|u−v|²
   (resp. u,s1), i.e. exactly the pairwise distinctness the payload already
   has (`pinnedSurplusTenLabels_pairwise_of_mem`, closed). Mirror the
   endpoint `GeneratorZeros` forced-collapse treatment.
3. Relaxed submask production at m ≥ 6: sub-mask facts are ⊆-monotone
   (one-hit/no-three survive relaxation), so the payload needs only its
   *labeled* witnesses in each class — the anonymous-witness gap the exact
   masks had at `.u` does not arise by construction. Step 1's enumeration
   confirms every needed fact is one of the four categories above, all of
   which the closed lemma families cover by kind (register U1 RESOLVED).

Uncertainty: LOW — the fact checklist is complete with an empty residue;
what remains is Lean transport work (relaxed DFS completeness theorem +
per-leaf application of the four fact kinds), not open enumeration.

## 4. Obligation 3 — erased-pin triples (gate: the two-hit probe)

State: the reduction to one-sided payloads is closed; the two adjacent
upper bounds (`leftAdjCount ≤ 1`, `rightAdjCount ≤ 1`) at interior centers
are not yet lemma-shaped, and proof attempts are gated on the falsifiability
probe (adopted in the lane plan; never dispatched). Dispatch-ready spec:

- **Question:** is the (two same-side adjacent-interior hits) configuration
  satisfiable under the full local pin?
- **Configuration:** IsM44 frame; center p a non-surplus strict interior;
  selected class {x, y, y′, ·} with card 4 at p; x the erased surplus
  interior; y, y′ same-side adjacent interiors; convex position; in-disk;
  cap-side constraints.
- **Encoding ((D-msolve)):** exact-rational frame with the (v,w) gauge;
  equal squared distances from p to the four class members; signed-area
  orientation constraints for convex position and cap sides; per-pair
  Rabinowitsch distinctness. No floating point, no QF_NRA free frames.
- **Smoke gates (mandatory before the real run):** (i) drop the second
  adjacent hit → must be SAT (known-realizable one-hit configuration);
  (ii) reproduce one known kill from the pinned bank → must be UNSAT.
- **Outcome — RESOLVED 2026-07-06: SAT (PROVEN, constructive).** Both smoke
  gates passed; exact rational witnesses for left two-hit (counts (1,0,2,1),
  class {s2,Q1,Q2,u} at p = Pu) and right two-hit ((1,0,1,2), mirror),
  independently re-verified. Full report + artifacts:
  `scratch/two-hit-probe/report.md`. Consequences: `leftAdjCount ≤ 1` /
  `rightAdjCount ≤ 1` at non-surplus strict-interior centers are FALSE as
  stated — stop lemma attempts; the `hl`/`hr` hypotheses of
  `exists_left_right_primitive_packet_cases_of_erasedPinTriple_counts`
  (`SurplusM44Packet.lean:6429`) are not dischargeable by any one-hit lemma,
  and `AdjacentChainOneHitData` is unproducible at interior centers
  (Moser-vertex centers keep their closed one-hit bounds). Operative route:
  extend `SurplusSeededShadow`'s seeded family with the two-hit rows
  ((1,0,2,1), (1,0,1,2); unprobed census follow-ups (0,1,2,1), (0,0,2,2),
  surplus-side ≥3-hit), emit through the existing emitter, reuse the seeded
  consumers; the witnesses are ready-made emitter smoke anchors.
- The lower bounds stay routed into the seeded census and ride obligation
  2's relaxed-vocabulary treatment (same mask-hypothesis caveat).

Uncertainty: LOW — the route is census extension, a known-shape mechanical
pipeline (register U2 closed).

## 5. Obligation 4 — DoubleApex (|A|-split)

`capTriple_caps_card_ge_four` (closed) makes (5,5,4)/|A| = 11 the minimal
two-large-cap case; there is no (5,5,3) slice.

**|A| = 11 slice — exhaustive (5,5,4) census.** Spec:

1. Canonicalization MUST respect the surplus designation: the two 5-caps are
   not interchangeable in the leaf (q ∈ capAt i). A symmetric
   canonicalization silently under-enumerates.
2. Smoke-gate the encoding against the known sampled verdicts
   (`u12_metric_sample100_verdicts.jsonl`, 27 KB, plus `u12_metric.py` and
   `certify_globalcount_table.py`, in
   `../p97-rvol/scratch/u1_2_faithful/twolargecap_core/` — historical repo,
   read-only; port with the §7 D2 batch) before the exhaustive run.
3. Per-cube certificates in the existing checker format. Reuse
   `EndpointCertificate.Checker` iff the systems are equality-only; any
   ℝ-inequality content is a decision point, not a workaround (register U8).
4. One on-spine consumer theorem mapping the leaf hypotheses into the census
   family. Binder note (audit 0b): the leaf carries `hcritical` but neither
   `hnoRem` nor the IH — the census route does not need them; any route that
   does requires deliberate binder re-plumbing down the tail chain.
5. On landing, split the obligation: card-11 closed by census + named
   card-≥12 residual (proposed: `DoubleApexOffSurplusSharedRadiusPairCard12Up`)
   — strict on-spine narrowing either way. An ALIVE cube redirects: the
   caps/convex/shell content must enter the certificates; report before
   proceeding.

**|A| ≥ 12 — workstream D (§7).** No other route: descent/deletion is
proven-dead (monotonicity dead-ends; K4 not downward-hereditary), the finite
bank is empirically dead at |A| = 12, and bisector/radical-axis counting is
fully spent in the existing kill (the 11-label no-collision table satisfies
all incidence constraints).

## 6. Obligation 5 — liveData (active branch split; tripwire stands)

Status corrected 2026-07-06: the lane is no longer parked. The working tree
carries an active ~2300-line f2CriticalRow branch split (84 fully-ordered
label-assignment leaves; 12 closed by row consumers; 72 leaf + 7 terminal
sorries open at snapshot) — anatomy, coordination requirements, and
acceptance in ledger §2.5. Parking still applies to *certificate hunts*: the
older equality leaves are SAT under the finite core vocabulary — no
certificate exists to hunt. The COMP-1-blocked leaves need a new producer:
a sixth critical row + consumer, a collision/no-collision producer, or a
packet-label-centered surface avoiding the `hocc_f2_f1_0` incompatibility
(proven in-file). Tripwire: the moment §5's census or §7's work yields any
bounded forced-subsystem statement, test it as a liveData producer — the
DoubleApex leaf and the liveData cubes share the six named points and the
critical-row vocabulary, so one producer may serve both slot-3 obligations.

## 7. Workstream D — uniform metric-rigidity (the |A| ≥ 12 route)

The only route currently believed to cover |A| ≥ 12, hence the actual
frontier of the whole proof. Basis (|A| = 12 minimal-core census, math-prover
2026-07-06, EMPIRICALLY VERIFIED on samples): (6,5,4)+(5,5,5) slices, 2000
cubes each; minimal infeasible cores form hundreds of classes with no
flattening (10 cubes→35 classes … 70→146; 66–76% singletons); the one proven
pattern covers ~7% (287/4000). Assets from the mining (ranges corrected
2026-07-06 by D2's exhaustive-per-cube mine — 540 Singular-confirmed minimal
cores from 239 dead cubes — superseding the earlier 4-record basis): every
dead core is an equidistance framework on k ∈ {4,…,8} points (k = 7 modal)
with over-determination R−(2k−4) ∈ {−1,…,4} (−1 real but rare, 2/540); every
kill is a forced gauge-pair collapse — each ℂ-infeasible induced subsystem
contains both gauge points (PROVEN, D2 report §7), so the kill forces u = v
rather than free-ℂ emptiness; the −1 cases prove the target lemma cannot be
generic-DOF counting.
Equidistance constraints are point-on-perpendicular-bisector incidences, so
the target is a realizability criterion for near-critical bisector-incidence
patterns with all points distinct.

- **D1 — literature scan: DONE 2026-07-06**
  ([`d1-rigidity-literature-scan-2026-07-06.md`](d1-rigidity-literature-scan-2026-07-06.md);
  verified-citations-only, 7 PROVEN-in-literature / 16 PARTIAL / 5 NO-LEAD /
  0 unverified-memory). Headline: **no theorem transfers directly** — the
  target class (near-critical equidistance frameworks, forced-coincidence
  kills, δ = −1 infeasibles) is not characterized anywhere; two explicit
  literature nulls recorded (EDM completion with equality patterns among
  unspecified entries; any combinatorial criterion for the class). Ranked
  adaptable leads with concrete next steps: (1) ℂ-vs-ℝ saturation dichotomy
  (Wu 1986; Chou 1988) — classify each mined dead core as ℂ-dead vs
  ℝ-only-dead from the existing kill artifacts; this one bit routes D3
  between an ideal-theoretic lemma and a census-shaped route; (2)
  coordinated edge motions (Schulze–Serocold–Theran, arXiv:1807.05376) —
  coordination-class sparsity counts as a D2 invariant; (3) coincident
  deletion–contraction rigidity (Fekete–Jordán–Kaszanitzky 2015;
  Guler–Jackson arXiv:2106.06767) — pair-contracted rank profiles as a D2
  invariant; (4) witness-configuration rank defects (Michelucci–Foufou
  2006) for the δ = −1 cores; (5) EDM linear-section reformulation
  (Alfakih 2018) as the clean restatement to pose D3 in. Leads (2)–(4) feed
  D2's invariant menu directly; lead (1) is a new cheap dispatch on data we
  already have. Post-scan addendum (Adam, 2026-07-06): the in-house **Near
  Enemy Theorem** (`../lean-formalizations`, kernel-checked,
  comparator-audited) gives the exact bisector-energy floor 2n(n−1) with
  attainment — the minimization direction LSdZ don't address. Not a
  realizability criterion, but its formalized supporting chain
  (shared-bisector rigidity, per-constraint polynomial nonvanishing
  witnesses, generic-projection engine) is the ℝ-side certificate shape for
  lead 1 and the natural Lean vocabulary for D3 (D1 report addendum).
- **D2 — invariant separation test: DONE 2026-07-06 — verdict NO clean
  separation** (`scratch/u12-census-port/d2-separation/report.md`; basis: 540
  Singular-confirmed minimal dead cores, exhaustive per cube over 239/1882
  dead cubes, vs 2,551,993 ℂ-feasible induced-control frameworks from both
  slices). Every invariant family — Laman sparsity scalars, δ-profiles,
  circle degrees, SST coordination counts (provably ≡ δ + class structure
  here), FJK/GJ pair-contraction profiles — overlaps between infeasible cores
  and feasible controls, with 4/4 solver-verified witness pairs agreeing on
  the entire 21-scalar vector. The full 28-invariant vector has zero overlap
  but is a lookup table, not a criterion (HEURISTIC: it identifies frameworks
  near-isomorphically; its components fail individually and in every tested
  sub-combination). Control gap CLOSED at the ℂ-alive level:
  `_u12_alive_555.jsonl` never existed (census crashed pre-persist); controls
  re-derived by deterministic sampler regeneration validated against the
  census logs (V1–V5 all pass; attempts/tallies match exactly) + 100/100
  msolve spot-checks. Standing caveat: "alive" = ℂ-equidistance-alive in
  gauge; ALL alive cubes are distinctness-dead, so no control is known
  realizable with 12 distinct points. Two positives for D3: (1) contraction
  profiles carry most of the discriminating power — 430/540 dead profiles
  unattained by any control — a census index key, not a lemma; (2) PROVEN:
  every kill is a forced gauge-pair collapse ("pattern forces u = v" — the
  Near Enemy shared-bisector vocabulary, per the D1 addendum), pointing D3 at
  ideal-theoretic/geometric certificates rather than counting criteria.
- **ℂ-vs-ℝ dichotomy classification (D1 lead 1): DONE 2026-07-06 — every
  mined dead core is ℂ-dead; 0 are ℝ-only-dead**
  (`scratch/u12-census-port/dichotomy/report.md`; 572/572 classified systems,
  two independent exact char-0 engines — Singular reduced GB, msolve —
  agreeing 572/572; smoke 16/16, ordering-independence 9/9). Coverage: Tier A
  = 100% of the record's 266 core classes (verdicts extend to all 465
  instances by the PROVEN class-invariance lemma); Tier B = 262 freshly mined
  instances from the dead files (80 cubes, 43 new classes, all ℂ-dead); Tier
  C = the COMPLETE abstract k=4 universe (44 classes: 10 dead / 34
  saturated-alive, containing all 9 record k=4 classes). Consequence: **D3
  poses ideal-theoretically** — per-core Nullstellensatz certificates
  1 = Σλᵢgᵢ over ℚ exist, are extractable (Singular lift) and
  kernel-checkable by polynomial-identity evaluation (endpoint-bank shape);
  Wu/Chou saturation machinery applies as-is; SOS/Positivstellensatz and
  real-root classification are NOT needed at the mined-core layer.
  Lemma-design levers: 42% of record classes die from a single separator
  (certificate width 1); 32% die with no separator beyond the gauge; the
  Cempty/nodistinct mode split (85/181, pin-convention-dependent) correlates
  exactly with δ≥1 vs δ≤0. New basis facts: a δ=3 record class exists (555,
  k=4); the abstract k=4 universe reaches δ=4; no dead 3-core (PROVEN).
  Precision note: D2's forced-gauge-pair statement concerns its
  pinned-equality-minimal cores; the record's saturated-oracle classes split
  85 Cempty / 181 nodistinct — different minimality notions, no conflict.
  Tripwire hook: §6's bounded-forced-subsystem tripwire should test these
  ℂ-dead cores as liveData producers.
- **D3 — lemma formulation + proof attempt:** all three bounding signals are
  in — D1 (no transfer), D2 (no counting criterion), dichotomy (uniformly
  ℂ-dead ⇒ ideal-theoretic certificate shape, census-shaped with the
  contraction-profile index key). Direction decision (Adam): certificate
  census over cores (endpoint-stack shape) vs a uniform ideal-theoretic
  lemma attempt. Out of scope until that decision.

D1, D2, and the dichotomy are done; together they bound the proof's largest
uncertainty (register U4) from all three cheap sides: no theorem transfers,
no counting invariant decides, and the kill mechanism is uniformly
ℂ-ideal-theoretic. What remains on U4 is the D3 direction decision.

## 8. Global gates and hygiene

- **`Lean.trustCompiler` approval** — **DONE 2026-07-06** (Adam): added to
  `.blueprint.toml [axioms].approved`. Sanctioned by the 2026-06-05
  native_decide policy (both conditions hold: kernel-checked closure
  reported; evaluated checkers are plain verified Lean — no `unsafe` /
  `@[implemented_by]` / `@[extern]` in the evaluated closure, audited).
  Post-unblock note: the `[mining].skip` cert subtrees hide trustCompiler
  from the mined graph — only the live `#print axioms` gate reports it. The
  alternative (kernel-pure sharded `decide` across the full cert corpus) is
  a large regeneration for no policy gain; not recommended.
- **Verification protocol (blueprint unblocked):** after any Lean change —
  `lake-build` the touched root, `proof-blueprint spine` (auto-refreshes),
  `proof-blueprint axioms <target>` on both targets at milestones. Wiring
  claims cite spine diffs. No new off-spine sorries (the spine flags them).
- **Anchor hygiene:** clear the stale anchor on the closed
  `largeK4SurplusCapPacket` (session f46fdf3f).
- **Doc ownership:** cross-cutting state lives here; lane logs in the lane
  plans; per-obligation status is stated in exactly one place.

## 9. Sequencing

2026-07-06 wave (Adam GO) — all four dispatched as background agents: the
two-hit probe (§4), the (5,5,4) census encode+smoke+run (§5), D2 invariant
separation, and the ℂ-vs-ℝ dichotomy classification (§7, D1 lead 1); the D2
census artifacts are ported to `scratch/u12-census-port/` with a sha256
manifest. In flight on the Lean side: endpoint wiring (§2, anchored session),
erased-pin reduction-inputs (§4 lane), liveData branch split (§6). Landed:
D1 scan, §3 step-1 enumeration, trustCompiler approval, U2 attic, the
two-hit probe (SAT — U2 closed), D2 separation (NO clean separation — §7),
ℂ-vs-ℝ dichotomy (all cores ℂ-dead — §7); still in flight: (5,5,4) census
CEGAR. §0 items 2–3 are done; §0 closure now reduces to the five obligations
plus a fresh final mine.

## 10. Solver-run ledger (supersedes the missed-angle table)

| Run | Decides | Status 2026-07-06 |
|---|---|---|
| Endpoint coefficient post-processing | bridge vocabulary | DONE (`endpoint_core_census`) |
| Pinned-135 lift support + uniform-center test | m-uniformity of the exact bank | DONE — exact bank is m=5-only (verified) |
| Relaxed projection → split → singleton ladder | relaxed-vocabulary viability | DONE — 135/135 unit (verified) |
| §3 step-1 required-fact enumeration | general-m derivability checklist | DONE — residue EMPTY (U1 closed) |
| Two-hit probe (§4) | lemma-vs-census shape of the ≤1 bounds | DONE — SAT, exact witnesses (U2 closed) |
| (5,5,4) exhaustive census (§5) | \|A\|=11 slice of obligation 4 | IN FLIGHT — smoke 99/99; pattern-bank CEGAR running |
| D2 invariant separation (§7) | plausibility of a combinatorial rigidity criterion | DONE — NO clean separation (§7) |
| ℂ-vs-ℝ dichotomy (§7, D1 lead 1) | ideal-theoretic vs real-geometric D3 shape | DONE — 572/572 where dead expected: ℂ-dead; 0 ℝ-only (§7) |
| s1_030 lift-support timeout | (cleanliness only) | SUPERSEDED — singleton split covers it |

Not proposed, with dead-end citations: SOS/Positivstellensatz hunts,
QF_NRA free frames, Nullstellensatz on the SAT liveData leaves,
order-type/chirotope encodings, bisector counting, monotonicity routes.

## 11. Corrections for the lane plans (fold in at next touch)

Slot-3 plan: delete the "do not run blueprint commands" paragraph (unblocked
2026-07-06); restate pinned steps 3–4 per m-regime (§3); update workstream A
with the |A|=12 census consequence, the surplus-designation WLOG caution, and
the smoke gate (§5); mark the `EpQ1008`/product-sum entries landed (tree
evidence). Four-point plan: mark the `EpQ1008` "OPEN" paragraph superseded;
adopt the named general-m residual (§3); point the audit gate at §4's spec.
Probe stop-loss (2026-07-06, both plans): mark the `leftAdjCount ≤ 1` /
`rightAdjCount ≤ 1` checklist lines CLOSED-NEGATIVE at interior centers
citing `scratch/two-hit-probe/report.md`; retire `AdjacentChainOneHitData`
for interior centers; the erased-pin count-facts route is census extension.
Both: fold per the §8 doc-ownership rule.

## 12. Uncertainty register

| ID | Unknown | Severity | Resolved by |
|---|---|---|---|
| U1 | ~~Are all §3-step-1 facts derivable at m ≥ 6 from closed lemma families?~~ **RESOLVED 2026-07-06: yes — residue EMPTY**; all 3041 nonzero generators are v/w-center, separator, or erased-submask facts (§3 step 1) | closed | the enumeration report |
| U2 | ~~Two-hit configuration SAT or UNSAT?~~ **RESOLVED 2026-07-06: SAT** (PROVEN, exact witnesses, both smoke gates passed) — one-hit bounds false at interior centers; census route operative (`scratch/two-hit-probe/report.md`) | closed | the probe |
| U3 | (5,5,4) census: all-dead, or an ALIVE cube? | MEDIUM | §5 run — **dispatched 2026-07-06** (smoke-gated) |
| U4 | Does any \|A\|≥12-uniform route exist? | HIGH — the open math | All three cheap probes DONE 2026-07-06 — D1: no direct transfer (5 leads); D2: NO clean combinatorial separation (witness pairs close the counting route; contraction-profile index key); dichotomy: **all mined dead cores ℂ-dead** (572/572, two exact engines) ⇒ D3 poses ideal-theoretically — ℚ-Nullstellensatz certificates, endpoint-bank shape, Wu/Chou applies, no SOS/real-root needed at this layer. Next = D3 direction decision (Adam) |
| U5 | liveData producer surface | HIGH | gated on U3/U4 outputs (§6 tripwire) |
| U6 | ~~trustCompiler approval~~ **RESOLVED 2026-07-06** — approved by Adam, in `.blueprint.toml` | closed | — |
| U7 | Endpoint 117-pattern encode scope | LOW | generator classification done (0 unclassified); residual check is reading 2 base_empty rows |
| U8 | ℝ-only content in census certificates (checker fit) | unknown until emit | census output inspection; decision point if present |

Everything outside U4/U5 is either mechanical, enumerable, or one specified
computation away. U4 is the proof's genuine frontier; D1+D2+dichotomy (all
done) have bounded it from every cheap side — no theorem transfers, no
counting invariant decides, kill mechanism uniformly ℂ-ideal-theoretic —
leaving the D3 direction decision (Adam) as the next move on it.
