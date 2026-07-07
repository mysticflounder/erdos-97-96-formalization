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
2. `Lean.trustCompiler` approved in `.blueprint.toml [axioms]`
   ({{NEEDS_ADAM_INPUT}}, §8) or eliminated (not recommended, §8).
3. The two `U2OppCap2Escape.lean` sorries wired into the spine or deleted
   (adapter work after slot-2 closes; they are the `D.packet`-vocabulary
   twins of obligations 1–2).
4. Mined graph fresh at the final check.

## 1. Obligation map

| # | Obligation (`Problem97.…`) | Site | Route | Residual uncertainty |
|---|---|---|---|---|
| 1 | `isM44EndpointResidualsExcluded` | `RemovableVertexAxiom.lean:324` | endpoint certificate stack (built), wiring remains | LOW |
| 2 | `isM44PinnedSurplusResidualsExcluded` | `RemovableVertexAxiom.lean` | m-split: exact bank (m=5) + relaxed vocabulary (general m) | MEDIUM, enumerable (§3, U1) |
| 3 | `isM44NonSurplusContainmentErasedPinTripleResidualsExcluded` | `RemovableVertexAxiom.lean` | gated on the two-hit probe (§4) | MEDIUM → LOW after one solver-day |
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
- **Outcomes:** SAT with margin (expected, HEURISTIC) → the two-hit rows are
  census-shaped: extend `SurplusSeededShadow`'s seeded family with the
  two-hit rows, emit certificates through the existing emitter, reuse the
  seeded consumers (already closed for the one-sided family). UNSAT →
  extract the unsat core and prove the geometric one-hit lemma it exhibits.
- Either outcome unblocks the four count facts; the lower bounds are already
  routed into the seeded census and ride obligation 2's relaxed-vocabulary
  treatment (same mask-hypothesis caveat).

Uncertainty: MEDIUM; collapses to LOW after the probe (register U2).

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
pattern covers ~7% (287/4000). Assets from the mining: every dead core is an
equidistance framework on k ∈ {4,5,6} points with over-determination
R−(2k−4) ∈ {−1,0,1,2}; all kills are forced-coincidence, not ℂ-emptiness;
the −1 cases prove the target lemma cannot be generic-DOF counting.
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
  already have.
- **D2 — invariant separation test (solver dispatch, independent):** compute
  candidate combinatorial invariants over the mined dead cores vs
  known-realizable controls (the ALIVE sampled cubes from the same census)
  and test for separation. Candidate invariants: Laman-style sparsity counts
  on the equidistance hypergraph, per-subframework over-determination
  profiles, circle-degree distributions. Data source: p97-rvol scratch census
  artifacts (inventoried 2026-07-06; all under
  `../p97-rvol/scratch/u1_2_faithful/twolargecap_core/`, ~1.4 MB total) —
  port into `scratch/u12-census-port/` here before running: dead cores
  `_u12_dead_555.jsonl` + `_u12_dead_654.jsonl`; realizable controls
  `_u12_alive_654.jsonl` (no `_u12_alive_555.jsonl` exists — extract 555
  controls from the census logs or re-derive; verify control coverage at
  port time); uncovered-cube lists `_u12_pattern_miss_{555,654}.jsonl`;
  summaries `_u12_census_654.json` + `_u12_census_{555,654}_full.log`;
  generating scripts for parsing/provenance `_u12_census.py`,
  `_u12_core_mine.py`, `_u12_distinct.py`, `_u12_resolve_distinct.py`,
  `_u12_pattern_cover.py`, `_u12_verify_alive.py`. Verdicts: clean
  separation → a combinatorial criterion is plausible; formulate the lemma
  (D3). No separation → the criterion is not purely combinatorial; report
  with the data — the next escalation (semialgebraic invariants, or a
  different decomposition of the leaf) is a direction decision, not
  something to improvise.
- **D3 — lemma formulation + proof attempt:** only after a D2 signal; out of
  scope until then.

D1 and D2 are cheap, independent, and dispatchable today; they bound the
proof's largest uncertainty (register U4) from both sides.

## 8. Global gates and hygiene

- **`Lean.trustCompiler` approval** ({{NEEDS_ADAM_INPUT}}): add to
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

Parallel now: (1) endpoint wiring (§2, in flight); (2) pinned m-split landing
+ the §3 step-1 enumeration; (3) the two-hit probe (§4, one solver-day);
(4) D1 + D2 (§7, independent dispatches). Next wave: (5,5,4) census encode +
smoke (§5) as solver capacity frees; census exhaustive run after its smoke
gates. liveData stays parked behind the §6 tripwire. The off-spine U2
adapters and trustCompiler approval slot in at any point; both are required
for §0.

## 10. Solver-run ledger (supersedes the missed-angle table)

| Run | Decides | Status 2026-07-06 |
|---|---|---|
| Endpoint coefficient post-processing | bridge vocabulary | DONE (`endpoint_core_census`) |
| Pinned-135 lift support + uniform-center test | m-uniformity of the exact bank | DONE — exact bank is m=5-only (verified) |
| Relaxed projection → split → singleton ladder | relaxed-vocabulary viability | DONE — 135/135 unit (verified) |
| §3 step-1 required-fact enumeration | general-m derivability checklist | NOT ATTEMPTED (zero solver cost) |
| Two-hit probe (§4) | lemma-vs-census shape of the ≤1 bounds | NOT ATTEMPTED |
| (5,5,4) exhaustive census (§5) | \|A\|=11 slice of obligation 4 | PLANNED; smoke gates specified |
| D2 invariant separation (§7) | plausibility of a combinatorial rigidity criterion | NOT ATTEMPTED |
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
Both: fold per the §8 doc-ownership rule.

## 12. Uncertainty register

| ID | Unknown | Severity | Resolved by |
|---|---|---|---|
| U1 | ~~Are all §3-step-1 facts derivable at m ≥ 6 from closed lemma families?~~ **RESOLVED 2026-07-06: yes — residue EMPTY**; all 3041 nonzero generators are v/w-center, separator, or erased-submask facts (§3 step 1) | closed | the enumeration report |
| U2 | Two-hit configuration SAT or UNSAT? | MEDIUM | §4 probe (one solver-day) |
| U3 | (5,5,4) census: all-dead, or an ALIVE cube? | MEDIUM | §5 run (after smoke gates) |
| U4 | Does any \|A\|≥12-uniform route exist? | HIGH — the open math | D1 DONE: no direct transfer, 5 adaptable leads (§7) — leads 2–4 feed D2's invariant menu, lead 1 (ℂ-vs-ℝ dichotomy) is a new cheap dispatch; next signal = D2 separation or dichotomy classification; else honest OPEN report |
| U5 | liveData producer surface | HIGH | gated on U3/U4 outputs (§6 tripwire) |
| U6 | trustCompiler approval | admin | {{NEEDS_ADAM_INPUT}} |
| U7 | Endpoint 117-pattern encode scope | LOW | generator classification done (0 unclassified); residual check is reading 2 base_empty rows |
| U8 | ℝ-only content in census certificates (checker fit) | unknown until emit | census output inspection; decision point if present |

Everything outside U4/U5 is either mechanical, enumerable, or one specified
computation away. U4 is the proof's genuine frontier; D1+D2 are the cheapest
known ways to attack it.
