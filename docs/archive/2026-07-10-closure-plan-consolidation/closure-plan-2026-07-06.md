<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Master closure plan (2026-07-06)

> **Historical record — archived 2026-07-10.** This was the master plan at its
> 2026-07-06 snapshot. It is not a dispatch authority. The single current plan
> is the [2026-07-09 closure plan](../../closure-plan-full-spec-2026-07-09.md)
> together with its [closure matrix](../../closure-matrix-2026-07-09.md).
> This record is retained for its solver evidence, rejected routes, and dated
> decisions.

The complete route from the then-current kernel state to `verify-publish`
passing on both targets, with every gate, decision point, and open uncertainty
named at that snapshot.

Historical ownership: this document then owned cross-cutting strategy, gates,
dispatch-ready specs, and the uncertainty register. The two lane plans —
[`u-lane/97-slot3-certificate-closure-plan-2026-07-06.md`](../2026-07-16-doc-sweep/u-lane/97-slot3-certificate-closure-plan-2026-07-06.md)
and [`four-point-subpacket-plan.md`](../2026-07-16-doc-sweep/four-point-subpacket-plan.md) —
owned per-lane execution logs. Corrections they should fold in are in §11.
Audit basis: the three 2026-07-06 audit docs under
[`docs/audits/`](../../audits/). The sorry-level companion —
[`sorry-closure-ledger-2026-07-06.md`](../2026-07-16-doc-sweep/sorry-closure-ledger-2026-07-06.md) —
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

Current source checkpoint: the `m = 5` exact-shape, metric-shadow, and row-zero
path is fully proved.  The sole remaining source leaf is the proposed named
residual, `isM44PinnedSurplusGeneralMResidualsExcluded`, stated for
`5 < S.surplusCap.card` in `PinnedSurplusBank.lean`.

Build-speed checkpoint: `RemovableVertexAxiom.lean` is now a thin coordinator.
The stable declarations live in
`Erdos9796Proof.P97.RemovableVertexAxiom.Base`, while producer-side work should
build `Erdos9796Proof.P97.RemovableVertexAxiom.PinnedSurplusProducer`; neither
imports the generated row-zero bank.  The checked row-zero consumer lives in
`Erdos9796Proof.P97.RemovableVertexAxiom.PinnedSurplusBank`.  Use the bank
shard only when validating the certificate handoff.  The RowZeros certificate
globs are now listed explicitly in `.blueprint.toml`'s mining skip list before
the next proof-blueprint refresh.

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
3. Relaxed submask production at m ≥ 6: **the earlier closure claim here is
   superseded.**  Empty generator residue classifies the facts needed *after a
   singleton leaf has been chosen*; it does not prove that an arbitrary
   geometric submask assignment satisfies any leaf.  The reproducible finite
   check in `scripts/pinned-generalm-certificate-coverage.py` enforces the
   current candidate-submask domains, cyclic cross-separation, and the global
   point-pair class-count bound.  All 15 fixed `.v/.w` rows have uncovered
   models when every nonfixed mask has at least 2 labelled members, and again
   when it has at least 3.  All 15 become covered only at labelled cardinality
   4, recovering exact-bank completeness.  See
   `certificates/surplus/reports/pinned_surplus_generalm_certificate_coverage.{json,md}`.

Current source split: the exact-shape and metric-shadow producers now require
`S.surplusCap.card = 5` and are fully proved.  `PinnedSurplusBank.lean` closes
that regime through the checked row-zero bank and exposes the sole larger
regime obligation as
`Problem97.isM44PinnedSurplusGeneralMResidualsExcluded`, with hypothesis
`5 < S.surplusCap.card`.

Checkpoint 2026-07-09: the first general-`m` reduction is proved on both
orientations.  `exists_pinnedRightExtraCriticalPacket` and
`exists_pinnedLeftExtraCriticalPacket` select an extra surplus-interior point
outside the pinned four-class, prove that class survives the required erasures,
and use minimality to produce a `U3LocalizedNoQFreePacket` and
`U3FixedTriplePacket` at a blocker center distinct from the pinned apex.  The
fixed triple gives the exact full critical shell, the two-circle bound gives a
triple label outside the pinned class, and `U3FixedTripleAuditFrame` supplies a
selected candidate plus two off-circle auxiliaries.  The on-spine theorem also
derives `CriticalShellSystem A`.  Each audit center has a proved exact
q-deleted-four/q-critical-three dichotomy, but no bounded-support confinement.
The direct finite consumer is now proved as
`U3FixedTripleAuditFrame.false_of_rowwiseConfinedQDeletedClasses`; each
orientation extractor exposes
`∀ H : U3FixedTripleAuditFrame ..., ¬ H.RowwiseConfinedQDeletedClasses`.
The remaining hole is therefore the exact producer
`H.RowwiseConfinedQDeletedClasses`: resolve every q-critical row and prove
bounded-support inclusion for each q-deleted four-class.  A stronger direct
contradiction from the same data is also acceptable.  This is not packet
extraction or an `m = 5` reduction.  U2/U5 Mode A and non-surplus containment
are unavailable unless established independently, because their existing
route is downstream of this residual.

Uncertainty: HIGH for general m.  A valid closure now needs one of: a proof of
the exact rowwise proposition above, including q-critical-row elimination and
q-deleted-class confinement; a stronger audit-frame obstruction; stronger
geometric constraints that exclude every recorded floor-2/floor-3 countermodel;
or a broader certificate family whose finite coverage is verified on the
weaker interface.  A DFS over the existing 135 exact completions is not a
completeness proof for general-m submasks.

Probe checkpoint 2026-07-10: `census/global_confinement/` first exhausted the
canonical adjacent labeled placement at `n = 11,12` under the current
L2/PROVEN, Q3, cyclic-separation, overlap, and point-pair cuts.  Q-critical
audit rows remain incidence-compatible in `2654/3276` tests at `n = 11` and
`6082/7090` at `n = 12`.  Simultaneous q-deleted survival is mixed at `n = 11`
(`3933` SAT, `3347` UNSAT) and SAT on all `24815` admitted `n = 12` frames;
confinement is UNSAT on every admitted frame at both sizes.  The follow-up
covered all 12 ordered surplus placements at `n = 11` and all 20 at `n = 12`.
The zero-extension types `(0,0,2,2)` and `(0,2,0,2)` persist at every placement
and size.  A filtered `n = 13` follow-up covers all 30 ordered placements for
those two types: all 600 `(0,0,2,2)` and 1,200 `(0,2,0,2)` scenarios are UNSAT,
with no capped search.  This satisfies the larger-cardinality probe gate but is
still bounded evidence.  The follow-up core pass explains all 2,888 zero-type
rows across `n = 11,12,13` before DFS: 1,444 have a fixed pin/dangerous
incompatibility from overlap or cross-separation, and 1,444 leave `Moser-2` with
an empty candidate domain after Q3/overlap/cross-separation filtering.  Core
extraction is complete.  The overlap atom already has
`SelectedFourClass.inter_card_le_two`; the finite-order cyclic-separation core
is now generalized as `SurplusCOMPGBank.btw_sep` over `Fin n`.  The remaining
formalization requires a carrier-to-boundary-index bridge, an adapter into the
existing K-Q3-1 same-side two-circle kernel, a Lean proof of K-Q3-5, and a
geometric selected-class-to-L2-code bridge before the verified LOCAL certificate
can exhaust the Moser-2 branch.  The resulting two type exclusions are
dangerous-row case leaves, not the full producer.

A source-indexed representative scan encoded the retained no-q-free blocker
fact and found all 517 placement/type packets SAT, both for the joint shell
system and after selecting a K4 at every center.  The completed shell/audit
coupling then adjudicated all 4,993 q-critical scenarios and 15,440 six-center
q-deleted frames: q-critical is 4,198 SAT / 795 UNSAT, and q-deleted survival is
12,894 SAT / 2,546 UNSAT.  The 67 initially capped searches were all resolved by
targeted 1M/3M/10M-node retries.  In Lean, `CriticalShellSystem` stores
`no_qfree`, exposed both before and after erasing the blocker center.  These
checkpoints remove the placement, shell-interface, and shell/audit coupling
gaps, but the surviving incidence assignments still do not produce
`RowwiseConfinedQDeletedClasses`.  The next proof-facing steps are to formalize
those zero-type rejection families through the named bridges and to mine the
shell/audit failures and surviving assignments for a new geometric necessity
lemma covering the other row types; see the full closure spec for the low-level
action list.

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

**Census status (2026-07-07, budget-partial).** The CEGAR pattern-bank run
exhausted its 6h wall budget with no stop condition: **1596 unique orbits /
40,524 unique pattern instances** banked (one benign diagnosed zombie
duplicate line), kills all equality-only Nullstellensatz (base 58, pair 403,
multi_pair 1135 — no U8 decision point arises), full bank verified by
independent exact-Fraction re-check (`verify_certs.py`, no Singular/msolve
in the loop; agent run + orchestrator re-run). **No ALIVE cube in 376
witnesses** — the exact engine never even ran as a screen (every witness had
an msolve-dead induced sub-pattern at k ≤ 6); HEURISTIC evidence for
all-dead, not proof. **Coverage is NOT complete**: the SAT gap signal stayed
flat (~0.8 s solves), so UNSAT is not near at this bank size; fully
resumable in ~50-min installments (`uv run python
scratch/census-554/run_census.py 3000 1200`, resumes from `bank.jsonl` +
`failed.jsonl`; protocol + full stats in `scratch/census-554/STATE.md`,
report in `scratch/census-554/report.md`). 52 certify-fail patterns are
persistently blacklisted (none banked — sound; offline-certification
candidates). Checker fit confirmed (U8): the Lean Checker's arithmetic
layer is variable-count generic (Certificate = generator/coefficient
sparse-poly lists over Nat-indexed variables), so census payloads need a
census BankSoundness analog + coverage DFS theorem, not a checker change.
Spec item 5's split (card-11 closed + `…Card12Up` residual) remains the
consumer shape; it activates when the bank reaches UNSAT/coverage-complete.
**Continuation resumed 2026-07-07 (Adam):** installment protocol restarted
from 1596 orbits; the run doubles as the covering-leg bellwether for the
Candidate-C gate (§7). **Through 2026-07-08 (installment 25): 5154 orbits /
135,263 instances** banked + verified, all kills familiar
(multi_pair/pair/base, equality-only), still no ALIVE cube and no UNSAT;
banking rate flat (~70–206 orbits/installment), so coverage-complete/UNSAT
remains far at this bank size.

**Intra-cap classification (2026-07-08, COMPLETE — commit 1571ca0).**
Exhaustive finite classification of all minimal dead patterns whose support
lies inside a single cap (`scratch/census-554/intracap.py`, results +
certificates in `intracap_results.jsonl` / `intracap_certs/`): **exactly
107 minimal dead patterns modulo AUTOS** (S 3, O1 101, O2 3), all at 5–7
generators, none below 5, 0 undecided over the 3,269 candidate-feasible
canonical classes; all 107 Singular-lift certified + exact-Fraction
re-checked, all 107 realizable in a full valid cube, all equality-only (U8
clean; the 3 base kills are the O2 patterns whose support holds both gauge
points). Bank cross-check: the 8 zero-cross-cap banked rows are all
subsumed. This is the only sub-family of the dead set with a *finite
complete* description; the cross-cap bulk (99.8% of the bank) does not
compress to a small template family (4,801 role-labeled shapes over 5,028
orbits; 1,322 unlabeled motifs — see the motif-transfer lead below).

*Formalization decision (2026-07-08, assessed with Adam):* NOT formalized
now — the theorem standalone is off-spine. Deadness half (107 certs) is
checker-shaped (Σ cᵢ·gᵢ = 1, the EndpointCertificate/Checker.lean form) but
a checked certificate alone proves polynomial inconsistency, not "no
counterexample contains this pattern"; the missing piece is the binding
lemma (pattern polys ⇔ leaf cap geometry: `CP.capAt` concyclicity, one-hit
transfer, gauge WLOG — Lean status of the gauge WLOG unverified
{{NEEDS_RESEARCH}}). Completeness half (3,162 aliveness verdicts) feeds
nothing on the spine. Even fully formalized it closes zero sorries today:
the intra-cap family is 8 of 5,000+ bank exclusions, and DoubleApex closes
only via a coverage theorem over a *terminal* census. Conditional
activation: if the P3 census-decision gate (u-lane slot3 plan) commits to
the coverage route, the pattern-certificate binding lemma becomes the first
Lean task and the 107 are the right first corpus (complete, stable, small,
already checker-shaped).

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
  ([`d1-rigidity-literature-scan-2026-07-06.md`](../../d1-rigidity-literature-scan-2026-07-06.md);
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
- **D3 — DECIDED 2026-07-06 (Adam): uniform ideal-theoretic lemma first;
  certificate census over cores (endpoint-stack shape, contraction-profile
  index) is the standing fallback.** Target: the proposed
  `DoubleApexOffSurplusSharedRadiusPairCard12Up` residual — one statement
  covering every |A| ≥ 12 configuration; per-pattern banking cannot finish
  this side (class accumulation is not flattening: 43 new classes in 80
  fresh cubes). Attack shape fixed by the probes: forced-coincidence
  ("pattern forces u = v") proven ideal-theoretically over ℚ with Wu/Chou
  saturation; the attempted general-m pinned route (§3) is a caution rather
  than a precedent: four-kind transport was classified, but finite submask
  coverage failed below labelled cardinality four.  The positive precedent is
  the Near Enemy shared-bisector chain (D1 addendum). Hard constraints from
  the negatives: no counting-invariant criterion (D2); no SOS/real-root
  machinery needed at the mined-core layer (dichotomy). First step
  (dispatched 2026-07-06): candidate-lemma formulation — ranked statements,
  each with an executed falsification test against the landed data (572-row
  dichotomy table, D2's 540 cores + invariants, complete k=4 universe) and
  a proof-attack sketch. Fallback trigger (presented to Adam, who decides
  the pivot): every candidate dies under falsification, or a formulated
  lemma's attack hits a named obstruction with no repair route.
  **Formulation pass DONE 2026-07-06 — the decided shape is FALSIFIED at
  the tail; the fallback trigger fired, in a stronger form than
  anticipated.** Candidate A (uniform saturated-emptiness of admissible
  double-apex patterns, at every separator level L0–L3: Δ / +full-H1 / +Γ
  noncollinearity / +E exactness) is refuted by explicit witnesses: W15
  (15-point triangular-lattice subset, exact integers, census-admissible,
  ℝ-realized by its own points) and W16-tri (n=16, same family) kill L0;
  W16-sq (square lattice, n=16, full-H1 with all 16 classes full exact-4
  radius classes in exact integers) kills L1/L3 with no numerics; two
  concentric-regular-octagon configurations (n=16) and the decagon pair
  with inner radius b = 1/φ (n=20) — general-position, full-H1,
  fully-exact-4, class structure PROVEN via shared-quadratic/φ-identities
  — kill L1–L3 simultaneously.
  Independently verified by the orchestrator (exact-integer + 50-digit
  re-derivation from scratch, `scratch/d3-formulation/independent_check.py`
  — ALL PASS). The same witnesses kill the pattern-level certificate-census
  fallback for n ≥ 15: a realizable admissible pattern contains no dead
  window at any size, so no dead-pattern bank covers the tail, regardless
  of proof technology. All witnesses are NON-convex (verified) — the Lean
  leaf itself (ConvexIndep) is untouched; the tail's mathematical content
  is exactly the convex-position coupling ((Q)-flavored). **Candidate B
  (row-decorated remnant) FALSIFIED 2026-07-07** — the embedding test found
  the critical-row fragment ρ (six named liveData points, five rows,
  no_qfree, shell system γ) embeds in EVERY ring witness, abundantly:
  every enumerated candidate is a solution (572/572, 572/572, 1020/1020;
  220/220/360 strict q ∈ S∖{V,W}); equalities PROVEN by sympy
  minimal-polynomial decisions, complete enumeration, empty near-miss
  window, smoke-gated (planted SAT + 4 mutilation controls); independently
  confirmed by the orchestrator via the single-mult-4 radius-profile +
  total-coverage structure (`independent_check.py` extended — ALL PASS).
  **With A and B both falsified, the ideal-theoretic uniform shape for the
  Card12Up tail is closed outright.** Remaining routes: **Candidate C**
  (head closer, n ∈ {12,13,14}: 4460/4460 sampled patterns dead across
  seven cap profiles, kills localize to ≤ 8-point windows — would split
  Card12Up into census-closable card-12–14 + a named card-≥15 residual;
  covering leg open); **Candidate D** (synthetic convexity-coupled forcing,
  Near-Enemy shared-bisector + M44-squeeze vocabulary — the only shape not
  excluded for the tail; no forcing mechanism identified; obstructions
  D1–D3 recorded). Reports + banked falsifiers:
  `scratch/d3-formulation/report.md`, `scratch/d3-formulation/candidateB/`
  (+ `t9_wit_*.json` / `t1_results.json` — mandatory falsification targets,
  now carrying exact-verified ρ+γ embeddings); dead-ends entry
  `doubleapex-card12up-uniform-pattern-lemma`. **Decision to Adam:**
  (a) head/tail split per Candidate C + optional D groundwork, vs
  (b) holding Card12Up whole pending a D mechanism.
  **DECIDED 2026-07-07 (Adam): D probe first.** Rationale: the primitive
  N8 tuple surface is constant for n ≥ 12 (31 ordered / 19 reflected;
  PROVEN within escape-census.py's capacity model, max support = 3 —
  token-level only; proof-usability of the subpacket normalization
  remains CONJECTURED per leads doc §7, and per-type-kill sufficiency is
  exactly obstruction D1, unresolved). Probe dispatched 2026-07-07
  (`census/candidate_d_probe/`): Q1 per-type convex-order-decorated
  exclusion over the 19 reflected tuples (exact-rational frames,
  exclusions-only trust, escalation ladder, dead-ends-aware — bare
  vesica windows are known SAT); Q2 composition test targeting D1
  (token-level "admissible ∧ no killed type" SAT at n = 12–16); Q3
  budget-permitting: the report's ranked shell-digraph sublemma
  ({V,W} ∪ (K(V)∩O1) ∪ (K(W)∩O2) convex-order completion). Smoke gates:
  k=4 vesica collapse reproduced (G1), convex cocircular non-exclusion
  control (G2), ring-witness incidence control (G3). **C census
  extension deferred pending the probe verdict** — a successful D would
  subsume the head (HEURISTIC), and a failed probe sharpens the
  card-≥15 residual definition either way.
  **PROBE LANDED 2026-07-07, validated** (orchestrator re-verified all
  13 witnesses + both Q2 banks in independent exact arithmetic;
  `census/candidate_d_probe/report.md`). Verdict: the pure per-type
  route for Card12Up is CLOSED — 13/19 reflected classes are REALIZED
  at the decorated minimal window (exact rational witnesses), and Q2
  confirms obstruction D1 token-level (admissible patterns avoiding
  every killed type exist at every n = 12–16, even granting all
  conjectured kills). Extracted structure, PROVEN and leaf-implied,
  free to any successor route (C-split enumeration included):
  m ≤ 2 per packet; vertex-pair packets have s = 0 (kills (2,1,0,1),
  (2,2,0,0) unconditionally — kill mechanism K-A/K-B/K-C, hand-checked);
  s = 2 packets occur only in straddle form. The s ≥ 3 kills ride SUB2
  (one 7-variable NRA sentence, CONJECTURED-UNSAT with infimum-zero
  boundary; z3/cvc5 time out; QEPCAD/Redlog or a collapse-limit hand
  proof would decide it). A viable Candidate D must couple constraints
  ACROSS centers — the Q3 two-center window (unprobed, budget) is the
  smallest such object. **C-split go/no-go returns to Adam.**
  **DECIDED 2026-07-07 (Adam): gated go.** Two no-regret gate items
  dispatched 2026-07-07: (1) Lean-certify the complete dead k=4 window
  universe (10 classes, dichotomy-run certificates, endpoint-certificate
  format — target module `K4WindowBank.lean`, unimported until consumed);
  (2) measure window-shape CEGAR convergence at |A| = 12 with the probe's
  three PROVEN constraints folded in as admissibility cuts
  (`scratch/k4-bank/`, `scratch/census-12-gate/`). Full card-12/13/14
  census commitment waits on the n = 12 convergence readout; the resumed
  (5,5,4) run (§5) is the |A| = 11 bellwether. Of the D lane items,
  Q3 landed 2026-07-08 (below); SUB2-H remains open successor work,
  independent of the census compute.
  **Gate item (1) LANDED 2026-07-07 (validated).** 44 admissible k=4
  classes (exhaustive brute-S₄ — PROVEN), exactly 10 dead CONFIRMED
  (dichotomy Tier C match 10/10; completeness rides the 34 msolve-alive
  verdicts, EMPIRICALLY VERIFIED); all 10 kills are base/equality-only
  with tiny certificates (≤8 generators, degree ≤3), exact-verified twice
  (agent + orchestrator-independent re-derivation incl. generator
  fidelity); `K4WindowBank.lean` sorry-free, builds clean, kernel axiom
  closure exactly core + `Lean.ofReduceBool` + `Lean.trustCompiler`
  (native_decide forced by `Rat`/`Nat.gcd` kernel non-reduction — same
  shape as the EpQ pattern files). Unimported by design pending a
  covering consumer. `scratch/k4-bank/report.md`.
  **Q3 two-center probe LANDED 2026-07-08 (validated;
  `census/q3_two_center/report.md`).** The 87 mirror-reduced (V,W)
  joint classes are COMPLETELY classified: 68 REALIZED (exact ℚ
  witnesses, official encoder, mutation controls) + 4 REALIZED over
  ℚ(√3) (NEEDS-SPECIAL by proof) + 15 KILLED-PROVEN. Two exportable
  leaf-implied joint kills, no ORDER constraints, falsifier gate PASS
  (396 geometric MEC triangles over the W15/W16/W20 witnesses):
  **K-Q3-1** (no two shared K(V)∩K(W) members on one side of line VW)
  and **K-Q3-5** (no shared member in intS at all; parallelogram
  identity vs dV²+dW² ≥ 1 under I-OBT; subsumes K-Q3-3; lemma-level
  z3 cross-checks). Composition retest with the joint kills granted on
  all three Moser pairs, all cap profiles: **SAT at every n = 12–16**
  — the two-center layer does not close D1. Consequence: a viable
  Candidate D must couple MORE than one decorated (V,W) window
  (three-center / order-coupled multi-window), or the gated census
  route carries U4. Also PROVEN en route: right-angle apexes
  (ux ∈ {0,1}) are order-dead at the full window (exit turn vs I-DISK
  complementary), so order-free subsystem SATs do not lift there.

D1, D2, the dichotomy, the D3 formulation pass, and the Candidate B
embedding test are done; together they bound the proof's largest
uncertainty (register U4) from every side: no theorem transfers, no
counting invariant decides, the mined-core kill mechanism is uniformly
ℂ-ideal-theoretic at n = 12, and the uniform-n statement — pattern-level
OR row-decorated — is FALSE at n ≥ 15 (explicit realizable witnesses with
exact-verified ρ+γ embeddings). The ideal-theoretic route for the tail is
closed; the split decision resolved 2026-07-07 (Adam): Candidate D probe
first, with the Candidate C head split deferred as the standing fallback.
The probe landed 2026-07-07 (§7 D3, validated): per-type kills cannot
cover the tail — 13/19 classes realizable at the minimal window and D1
confirmed token-level at every n = 12–16 — so any viable D couples
constraints across centers; three unconditional leaf-implied constraints
(m ≤ 2, vertex-pair ⇒ s = 0, s = 2 ⇒ straddle) were extracted for
whatever route follows. The C-split go/no-go returned to Adam and was
decided 2026-07-07: gated go — k=4 bank + n = 12 convergence gate
dispatched. **Gate readout 2026-07-08: no convergence** over 65+ cumulative
iterations (shape-stale ~0.2, fresh ~2 shapes/iter, census-baseline-like) —
255 orbits / 158 shapes / 20,322 instances banked + all certs verified; two
CERTFAIL events (engine-proven C_EMPTY cubes, in-loop certify 1200 s/call
timed out) resolved offline at 7200 s/call; cuts=none baseline not started.
Full 12–14 commitment remains Adam's call (§7 D3).
The multi-center joint census landed 2026-07-08 on the PROVEN tier:
L2 GLOBAL stabilizes empirically by `n = 25` with a four-row zero-fresh
window `n = 25..28`, cumulative inventory `3375`, and no GLOBAL-only
obstruction observed (`533,761/533,761 SAT`, `0` UNSAT, `0`
INDETERMINATE). So U4's live D shape is no longer "arbitrary >2-center
coupling"; it is a finite triple-support incidence inventory whose
remaining proof work is structural (`LOCAL => GLOBAL`, persistence, then
carry-forward), not further brute-force search.
Formalization checkpoint 2026-07-08: the abstract finite-alphabet and
inventory-transfer layer now lives in
`lean/Erdos9796Proof/P97/MultiCenter/GeneralN.lean`, and the initial
realization-facing bridge now lives in
`lean/Erdos9796Proof/P97/MultiCenter/Realization.lean`. The bridge defines
`CodeInventory` and proves that one-step persistence of a realized-code
predicate gives stabilization of both code and semantic inventories. It also
formalizes the predicate-level GLOBAL⊆LOCAL and LOCAL⇒GLOBAL-above-threshold
interfaces that feed the quantitative completion route, plus the all-parameter
LOCAL⇒GLOBAL form that turns local persistence into eventual GLOBAL stability.
The realization bridge now also has the `max(local-stability-threshold,
completion-threshold)` variant, so those two thresholds no longer need to be
artificially identified in later imports; threshold completion is enough for
eventual GLOBAL stability once LOCAL persistence is supplied.
The next proof step is to instantiate that bridge with the actual census surface:
the profile-level surface `ProfileRealizationSurface` now provides
`profileOccursAtN`, `realizesJointClass`, `localInventory`, and
`globalInventory`, and proves `localInventory_stepPersistent` from a profile
extension principle. Concrete profile-cardinality handoff is also now
formalized in `lean/Erdos9796Proof/P97/MultiCenter/CapProfile.lean`: the
existing U1 card-11 two-large-cap theorem yields the multi-center profile
`profile554`, with closed-cap sizes `(5,5,4)` and interior capacities
`(3,3,2)`. Remaining work is geometric instantiation: prove local extraction
from tail configurations into `JointClass.LocallyAdmissible`, prove the
occurrence predicate is closed under the cap-extension operation, and prove the
GLOBAL soundness/completion hypotheses for the actual census surface. That
yields qualitative eventual LOCAL stability through the existing general-`n`
scaffold; quantitative locking at the observed threshold still requires either
constructive completeness or a faithful certificate import.

Formalization checkpoint 2026-07-09: the finite certificate-import side is now
closed for the L2/full-participant representative surface. A proved-complete
21-cell LOCAL enumerator is identified with all 3,375 typed bank rows, the six
profile-preserving center permutations are checked semantically, and finite
coverage is checked over all 489 generated profile rows. The terminal theorem
is `ProfileClassIncidence.completesL2FullFrom_representativeSurface`; the exact
LOCAL frontier scan is also flat through `n = 64`. This supersedes the prior
"faithful certificate import" item, but not the geometric work: extraction,
configuration-level soundness/realization, persistence, and quantitative
locking at 3,375 remain open.

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
| U1 | Are the §3 facts sufficient at m ≥ 6? Generator classification is complete (residue EMPTY), but leaf coverage is not: all 15 rows have floor-2 and floor-3 countermodels under the current finite constraints. | **OPEN-RESEARCH** | `pinned_surplus_generalm_required_facts` plus `pinned_surplus_generalm_certificate_coverage` |
| U2 | ~~Two-hit configuration SAT or UNSAT?~~ **RESOLVED 2026-07-06: SAT** (PROVEN, exact witnesses, both smoke gates passed) — one-hit bounds false at interior centers; census route operative (`scratch/two-hit-probe/report.md`) | closed | the probe |
| U3 | (5,5,4) census: all-dead, or an ALIVE cube? | MEDIUM | §5 run — **BUDGET-partial, continuation LIVE through 2026-07-08 (inst 25)**: 5154 orbits / 135,263 instances banked + verified, **no ALIVE cube** (HEURISTIC for all-dead), no UNSAT; coverage incomplete (banking rate flat ~70–206 orbits/installment), resumable (§5 census status) |
| U4 | Does any \|A\|≥12-uniform route exist? | HIGH — the open math, but now structurally narrowed | All three cheap probes DONE 2026-07-06 — D1: no direct transfer (5 leads); D2: NO clean combinatorial separation (witness pairs close the counting route; contraction-profile index key); dichotomy: **all mined dead cores ℂ-dead** (572/572, two exact engines) ⇒ D3 poses ideal-theoretically — ℚ-Nullstellensatz certificates, endpoint-bank shape, Wu/Chou applies, no SOS/real-root needed at this layer. D3 direction DECIDED 2026-07-06 (Adam): uniform ideal-theoretic lemma first, certificate census fallback. Formulation pass DONE 2026-07-06: decided shape **FALSIFIED at n ≥ 15** (explicit lattice/ring witnesses, independently verified; the pattern-level census fallback dies with it for the tail; witnesses non-convex, leaf untouched). Candidate B (row-decorated remnant) **FALSIFIED 2026-07-07** — ρ embeds in every ring witness, every enumerated candidate a solution, exact-verified. **Ideal-theoretic uniform shape for the tail CLOSED.** Remaining: C (head 12–14 split), D (convexity-coupled tail, no mechanism). **Split decision RESOLVED 2026-07-07: D probe first** — per-type convex exclusion over the 19 primitive tuples + D1 composition test dispatched (`census/candidate_d_probe/`, §7 D3); C head split deferred as standing fallback. **C-split DECIDED 2026-07-07 (Adam): gated go — k=4 bank + n = 12 window-shape convergence gate dispatched; full 12–14 commitment pending the gate readout.** **Probe LANDED 2026-07-07 (validated): pure per-type route CLOSED** — 13/19 classes REALIZED at the decorated minimal window (exact witnesses, independently re-verified) and obstruction D1 CONFIRMED token-level (evasion patterns at every n = 12–16 even granting all conjectured kills). Extracted PROVEN leaf-implied constraints for any successor: m ≤ 2, vertex-pair ⇒ s = 0 (2 classes killed unconditionally), s = 2 ⇒ straddle-only; s ≥ 3 kills ride SUB2 (CONJECTURED-UNSAT, 7-var NRA). **Q3 two-center probe LANDED 2026-07-08 (validated): 87/87 joint classes classified** — 68 exact-ℚ + 4 ℚ(√3) realized, 15 KILLED-PROVEN (K-Q3-1, K-Q3-5; no ORDER; falsifier gate PASS); composition with joint kills granted still SAT n = 12–16 ⇒ two-center coupling insufficient. **Multi-center joint census LANDED 2026-07-08 (validated): L2 GLOBAL / PROVEN stabilizes empirically by `n = 25`** — cumulative inventory `3375`, project-level fresh count `0` on `n = 25..28`, and `533,761/533,761 SAT`, `0` UNSAT, `0` INDETERMINATE through `n = 28` (`docs/multi-center-joint-census-2026-07-08.md`). Live D shape is therefore a finite triple-support incidence inventory with no observed GLOBAL-only obstruction; the open math is now to prove the structural statements suggested by the data (`LOCAL => GLOBAL`, persistence, carry-forward), not to keep searching for new counterexamples in the proved tier. |
| U5 | liveData producer surface | HIGH | gated on U3/U4 outputs (§6 tripwire) |
| U6 | ~~trustCompiler approval~~ **RESOLVED 2026-07-06** — approved by Adam, in `.blueprint.toml` | closed | — |
| U7 | Endpoint 117-pattern encode scope | LOW | generator classification done (0 unclassified); residual check is reading 2 base_empty rows |
| U8 | ~~ℝ-only content in census certificates (checker fit)~~ **RESOLVED 2026-07-07: none** — every kill in the 1596-orbit bank is an equality-only Nullstellensatz identity (Rabinowitsch pairs stay equalities, consumer sets t = 1/d²), and the pipeline can only emit that shape (an ALIVE cube stops the run instead); Checker arithmetic layer confirmed variable-count generic | closed | census bank inspection + Checker.lean read |

U4 register update, 2026-07-09: the exact LOCAL frontier is flat through
`n = 64`, and the finite L2/full representative-surface enumerator/completeness
bridge is kernel-checked. The remaining U4 content is geometric realization and
general-`n` transport, not finite class discovery or bank coverage.

Everything outside U4/U5 is either mechanical, enumerable, or one specified
computation away. U4 is the proof's genuine frontier; D1+D2+dichotomy+D3
formulation+B embedding (all done) have bounded it from every side — no
theorem transfers, no counting invariant decides, kill mechanism uniformly
ℂ-ideal-theoretic at n=12, and every equality/separator-shaped uniform
statement (pattern-level or row-decorated) is FALSE at n ≥ 15, and the
D probe (landed 2026-07-07, §7 D3) closed the pure per-type route while
extracting three unconditional structural constraints. The C-split was
decided 2026-07-07 (gated go); U4's active work is the two gate items plus
the resumed |A| = 11 census. The two-center coupling layer (Q3) landed
2026-07-08: completely classified (68+4 realized / 15 killed), joint
kills exportable but composition-insufficient — the live D shape for
the eventual ≥ 15 tail is now strictly-more-than-two-center coupling.
