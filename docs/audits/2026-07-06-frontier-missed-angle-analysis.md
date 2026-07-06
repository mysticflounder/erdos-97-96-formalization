<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Missed-angle analysis of the open frontier (2026-07-06)

Provenance: produced by a math-professor analysis agent during the 2026-07-06
project audit, then spot-verified (binder inventory at
`U1LargeCapRouteBTail.lean:2383`, `candidateMaskOK` mask-cardinality
requirement at `SurplusCOMPGBank.lean:388-391`, |A|=12 core-census memory
records) by the auditing session. Claims carry PROVEN / CONJECTURED /
EMPIRICALLY VERIFIED / HEURISTIC labels; anything unverified beyond those
labels should be treated as conjecture per project policy.

Context at audit time: 5 sorry-backed obligations on the
`Problem97.erdos97_rhs` spine — 3 slot-2 census residuals in
`lean/Erdos9796Proof/P97/RemovableVertexAxiom.lean`
(`isM44EndpointResidualsExcluded`, `isM44PinnedSurplusResidualsExcluded`,
`isM44NonSurplusContainmentErasedPinTripleResidualsExcluded`) and 2 slot-3
residuals in `lean/Erdos9796Proof/P97/U1LargeCapRouteBTail.lean`
(`DoubleApexOffSurplusSharedRadiusPair`,
`u1_largeCap_routeB_tail_liveData_false`); 2 off-spine sorries in
`U2OppCap2Escape.lean`. Working plan:
[`../u-lane/97-slot3-certificate-closure-plan-2026-07-06.md`](../u-lane/97-slot3-certificate-closure-plan-2026-07-06.md).

---

## 0. Two state corrections that change the picture

**(0a) The |A|=12 minimal-core census undercuts workstream A's banking gate
as written.** Project memory (math-prover, 2026-07-06, recorded
well-validated) over sampled |A|=12 constrained center-K4 cubes ((6,5,4) and
(5,5,5) slices, 2000 each): minimal infeasible cores form hundreds of classes
with no flattening (10 cubes→35 classes … 70→146, 66–76% singletons); the
single proven `u1TwoLargeCapObstruction` pattern covers only ~7% (287/4000).
Recorded verdict: a finite bank of core lemmas is dead at |A|=12; only the
uniform metric-rigidity route remains for |A|>11. The slot-3 plan still frames
the uniformity gate as an open either/or. These are consistent only in this
narrow sense: the exhaustive (5,5,4) census can still close the **|A|=11
slice** by per-cube certificates; the **|A|≥12 tail cannot be pattern-banked**
(EMPIRICALLY VERIFIED at |A|=12 samples; the census is a sample, not
exhaustive, so "dead" is strong evidence, not proof). Execute workstream A
with that expectation and start the uniform-rigidity track in parallel (§F3,
§order-of-attack).

**(0b) Binder inventory of the slot-3 residual: minimality is NOT available
inside it.** `DoubleApexOffSurplusSharedRadiusPair`
(`U1LargeCapRouteBTail.lean:2383`) carries
`hcritical : Nonempty (CriticalShellSystem D.A)` but neither
`hnoRem : ∀ x, ¬IsRemovableVertex D.A x` nor the strong-induction IH. Those
live one level up (`u1_largeCap_routeB_tail_false` gets `hnoRem`; the IH stops
at `removableVertexOfLarge_of_nonIsM44`). PROVEN by source read. Any proof
route for the residual that wants removability or descent requires re-plumbing
binders down the tail chain — mechanical and in our control, but decide it
deliberately, not mid-proof.

## F1. Pinned surplus (obligation 2): m-uniformity gap at center `.u`, with a decisive unattempted experiment

**The gap (PROVEN by source read; consequence CONJECTURED pending exhaustive
lemma search).** `SurplusCOMPGBank.candidateMaskOK` requires
`maskCard mask == 4` for **every** center (`SurplusCOMPGBank.lean:388-391`),
and the bridge
`pinnedRightSurplusResidual_exists_validFragment_of_candidate_interfaces`
(`SurplusCOMPGBankGeometry.lean:~5646`) demands
`pointMask pointOf (centerClass center) ∈ candidateMasks sstar center` for all
centers ≠ `.v`,`.w`, where `pointMask` records only the labeled members of the
true class. So the faithfulness bridge needs each of the ten centers' K4
classes to have **all four witnesses among the ten labels**.

- At m = 5 (|A| = 10) the ten labels are all of A — automatic. The 135-row
  bank descends from the rvol (5,4,4) fragment; it is an |A|=10-complete
  object.
- At m ≥ 6 this fails structurally at `.u` (the surplus apex): `.u`'s opposite
  cap **is** the surplus cap, endpoint one-hit does not apply there, and Build
  B's exact witness (dead-ends, Cluster 1) shows 4 surplus-cap points at a
  common apex distance is locally consistent. "Class at u ⊆ ten labels" at
  m ≥ 6 is a global confinement claim of exactly the (Q) family. Bank rows
  lean on it: e.g. row 0 has `u: [Q1,s1,s2,s3]` — 3 of 4 witnesses are surplus
  labels. Same issue in weaker form at `.s1..s3`, and a residual
  ≤1-anonymous-surplus-hit per center at `.Pu/.Pw/.Q1/.Q2`.
- No in-tree confinement lemma for non-Moser-centered classes was found
  (`SelectedClass … ⊆ capByIndex` lemmas exist only for
  `oppositeVertexByIndex` centers). Targeted search, not exhaustive — hence
  CONJECTURED absent.

**Consequence.** As interfaced today, the pinned COMP-G route closes
obligation 2 at |A| = 10 only; the statement quantifies over all IsM44 packets
(m ≥ 5). This is the same anonymous-witness phenomenon as the slot-3
uniformity gate, in slot-2 clothing.

**The missed angle (not in dead-ends; checkable with existing tooling).** The
metric verdicts are ideal-membership certificates; a certificate need not use
all 30 class equations. **Mine the minimal cores of the 135 pinned rows** and
check whether each row's kill uses only equations from centers whose
faithfulness the payload actually supplies at all m: `.v` (pinned class —
PROVEN, `pinnedRightSurplusResidual_selectedClass_eq`), `.w` (exact cap —
PROVEN), plus the payload's Rabinowitsch-encodable `hU1w`/`hU1u` separators
(≠-facts are extra kill power, not obligations). Two outcomes:

- Cores avoid unconfinable centers → regenerate the fragment vocabulary with
  `.u`/`.s*`-relaxed masks (sub-mask semantics; count rules are ⊆-monotone so
  one-hit/no-three survive relaxation), re-run the DFS census and Singular
  pass. If death persists, obligation 2 closes at **all m** with the existing
  architecture.
- Cores need `.u`'s class → obligation 2 provably contains a (Q)-shaped
  constituent at m ≥ 6; the honest structure is an m-split (m=5 via bank;
  m≥6 open-named). Report before more bridge work lands.

First step: post-process `certificates/surplus/pinned_surplus_comp_g_bank.json`
rows through the comp_g_m engine with per-generator lift-coefficient
extraction; classify rows by core center-set.

## F2. Endpoint (obligation 1): uniformity-SAFE — the cheapest full closure available

**Uniformity safety (ingredients PROVEN; assembly is proposed work).** Both
endpoint payload classes are centered at non-surplus Moser apices; each such
center is a chord endpoint of both its adjacent caps, so the closed
convexity-only one-hit theorems
(`leftAdjacentCap_at_opposite_card_le_one_of_convexIndep`, etc.,
`SurplusM44Packet.lean:423,438`) give ≤1 class member in the surplus cap and
≤1 in the other adjacent cap; the remaining ≥2 members sit in the center's
opposite non-surplus 4-cap — fully labeled. Total anonymous members across
both classes ≤ 2, absorbable into the 3 surplus slots via
`exists_surplusInterior_triple_preserving` (PROVEN). Unlike obligation 2, the
117-pattern family has **no m-gap**. (Caveat: confirm each of the 117 patterns
encodes only these two classes plus counting side-conditions — the variable
set is consistent with this but not every pattern's generators were decoded.)

**Missed angles:**

1. **Core-first bridge design (zero solver cost).** The 117 JSONs already
   contain `coefficients`. A pure post-processing pass lists, per pattern,
   which generators have nonzero lift coefficients — i.e. which geometric
   facts the bridge must actually transport. Build the faithfulness bridge
   against the core vocabulary, not the full pattern vocabulary.
2. **Reuse the pinned DFS-completeness architecture.** The pinned side has the
   full proven pipeline: local Boolean rules → `isValidPinnedFragment` →
   generated DFS census + completeness certificate → `shadowInBank`
   (`pinnedSurplusCOMPGBankBridge`, CLOSED). The endpoint side has
   certificates but no enumeration-completeness object. Generate the endpoint
   fragment rules + 117-row bank + completeness certificate in the
   `SurplusCOMPGBank`/`BankDFS` style (a `surplus-compg-shadow.py` sibling);
   expected output an
   `EndpointBank.shadowInBank_of_isValidEndpointFragment` analogue.

## F3. DoubleApex (obligation 4): the radical-axis question answered; the real option set for the uniformity gate

**Radical-axis / perpendicular-bisector.** (D-caps) does not block here — two
genuine circles are present — but the two-circle machinery is already the
mechanism of the proven downstream kill (`oppCap2_escape_gen` via
`twoCircle_midpoint_collinear` + reflection). The open direction is a
**forcing lower bound**, and genuine-circle incidence only gives ≤2 bounds.
The 11-label no-collision globalcount table (EMPIRICALLY VERIFIED) satisfies
every counting/incidence constraint including all circle upper bounds, so no
bisector/radical-axis counting argument can force the pair; only the metric
ideal kills it. **No new lever from this angle; it is already fully spent in
the proven kill.** Per-apex over-cover (≥2 off-surplus co-radial points per
apex) is PROVEN but does not force a *common* pair.

**Uniformity gate options:**

- *(i) Reduction to (5,5,4) via deletion/descent using minimality:*
  foreclosed — dead-ends `descent-construction-antecedent-reduction` and
  `ulane-gamma-multideletion-descent` (PROVEN-dead by monotonicity); the
  failure mechanism (K4 witness repair after deletion) is
  configuration-independent. The leaf also already carries minimality's
  consequences, and per (0b) the IH isn't in the residual's binders anyway.
- *(ii) Uniform metric-rigidity lemma:* the only route currently believed to
  cover |A| ≥ 12 (per the |A|=12 census, §0a). The mined regularity is an
  asset: every dead core is an equidistance framework on k ∈ {4,5,6} points
  with over-determination R−(2k−4) ∈ {−1,0,1,2}, and all kills are
  forced-coincidence rather than ℂ-emptiness; the −1 cases prove the lemma
  cannot be generic-DOF counting. HEURISTIC direction, sharpened:
  equidistance constraints are point-on-perpendicular-bisector incidences, so
  the target is a realizability criterion for near-critical
  bisector-incidence patterns with all points distinct. Concrete first steps:
  (a) literature scan (bisector arrangements, isosceles constraint systems,
  Euclidean incidence rigidity, EDM completions with equality patterns —
  Cayley–Menger rank ≤ 4); (b) EMPIRICAL: compute candidate combinatorial
  invariants (sparsity counts, Laman-style) over the mined dead cores vs
  known-realizable negative controls and test for separation — cheap, and
  decides whether a combinatorial criterion is plausible before any proof
  attempt.
- *(iii)* The genuine third option is not descent but **bounded forced
  subsystems** — which is workstream B. Any |A|-uniform closure of the leaf
  must run through a bounded forced subsystem; the census can only close the
  |A|=11 slice. Treat the (5,5,4) census as slice-closure plus core-data
  harvesting for (ii), not as a route to full closure.

## F4. Erased-pin adjacency counts (obligation 3): probe falsifiability BEFORE proving

The four open count facts (`leftAdjCount ≤ 1`, `rightAdjCount ≤ 1`,
`1 ≤ leftAdjCount`, `1 ≤ rightAdjCount`) split:

- **Upper bounds, interior centers.** Build A's *consumer* is center-agnostic
  and PROVEN in-repo
  (`FiniteEndpoint.OrderedSideChain.card_le_one_of_subset_sameRadius`,
  `N9Endpoint/N4a.lean:109`). The *producers* are endpoint-anchored
  (E3L20-style monotonicity from a chord endpoint;
  `CGN6c_oneSidedDistanceInjective` needs a `MinorCapChainModel`) and do not
  transport to interior centers (cross-cap chain is not a minor-cap model).
  PROVEN-shaped obstruction to *reuse*; the claim itself is neither proven nor
  refuted. The c5d3b `monotonicity-refuted (★2)` dead-end kills a *different*
  statement (interior-point-to-vertex distance), so this is not literally in
  dead-ends — but Build B's meta-lesson (cocircular ⟹ convex for free) makes
  the local version suspect.
- **Missed angle — cheap falsifiability probe first.** Exact-rational SAT
  probe for the (2 adjacent-interior hits) configuration under the full local
  pin (class = {x, y, y′, ·} with card 4, x erased surplus interior, y,y′
  same-side adjacent interiors, center p non-surplus interior, convex
  position, in-disk, cap sides, IsM44 frame). If SAT with margin (expected,
  HEURISTIC), the two ≤1 bounds are **not lemma-shaped** and the two-hit rows
  must join the seeded finite-census family
  (`SurplusSeededShadow` + `SurplusCOMPGBankGeometry` consumers). If UNSAT,
  extract the mechanism and prove. Either outcome redirects the in-flight
  branch work cheaply. (D-msolve) compliance: exact-rational frame, per-pair
  Rabinowitsch distinctness, smoke-gate against a known-SAT relaxation first.
- **Lower bounds** are row exclusions already correctly routed into the
  seeded census. The F1 anonymous-witness caveat applies to the seeded
  consumers' mask hypotheses too and should ride the same F1 audit.

## F5. liveData (obligation 5): stays parked per the plan's non-goals

The older equality leaves are SAT under the finite core vocabulary (rvol
classification), so no Nullstellensatz certificate exists over the current
vocabulary — do not hunt for one. Progress is gated on new producer content
(sixth critical row + consumer, collision/no-collision producer, or a
packet-label-centered surface avoiding the COMP-1 `hocc_f2_f1_0`
incompatibility, which is PROVEN in-file via `false_of_hocc_noCollision`).
Ordering note: if F3(ii)/(iii) produces any bounded forced-subsystem theorem
for the DoubleApex leaf, immediately check whether the same surface feeds the
liveData branch cubes — they share the six named points and the critical-row
vocabulary, so a single producer may serve both slot-3 sorries.

## F6. Unification across slot-2

Confirmed shared structure (PROVEN by artifact inspection): one ten-label
model `{u,v,w,s1,s2,s3,Pw,Pu,Q1,Q2}` with the same `(v,w)` gauge; one generic
checker (`EndpointCertificate.Checker` — schema-agnostic sparse-ℚ identity
checking with `checkProductSum` sharding); one verdict taxonomy (C_EMPTY ↔
`base_empty`, NO_VALID_REAL ↔ `forced_collapse`); the ten-label distinctness
dictionary and general-m triple selection CLOSED and shared. The three
obligations do not admit one theorem, but they admit one **pipeline**:
fragment rules → generated bank + DFS completeness → geometric
payload-to-shadow bridge → per-row metric certificate in checker format.
Obligation 2 has the pipeline minus metric certs; obligation 1 has metric
certs minus the bank/completeness; obligation 3's seeded families build on
obligation 2's consumers. Shared missing pieces: (a) metric-certificate
emission for the 135 pinned rows and any seeded rows (same emitter as the
endpoint certs; expect sharding needs at EpQ1008 scale), and (b) the F1
confinability audit, which gates all label-closed mask hypotheses at
general m. The checker is likewise reusable for the (5,5,4) census (same
kinds), with larger systems (18 free coordinates + up to 55 per-pair
Rabinowitsch variables) — mine minimal cores before lift extraction and emit
sharded from day one.

The two off-spine sorries in `U2OppCap2Escape.lean` are the
`D.packet`-vocabulary twins of obligations 1–2; closing slot-2 makes them
adapter work. Spend nothing on them now.

## Order of attack

1. **Endpoint cert core extraction** (F2.1) — zero solver cost, shapes the
   obligation-1 bridge, validates core-mining end-to-end. Then the endpoint
   bank/completeness artifact (F2.2) and the faithfulness bridge; obligation 1
   is the only obligation with no known uniformity obstruction.
2. **Pinned-bank core mining + `.u`-relaxation experiment** (F1) — the largest
   binary uncertainty on slot-2.
3. **Interior-center one-hit falsifiability probe** (F4) — one solver-day;
   redirects the active branch's checklist work.
4. **Exhaustive (5,5,4) census** (workstream A step 2) — closes the |A|=11
   slice of obligation 4 if all-dead (a strict on-spine narrowing via an
   |A|=11 vs ≥12 split) and harvests cores either way; any ALIVE constrained
   cube is the redirect (caps/convex/shell content must enter the
   certificates). WLOG caution: the two 5-caps are not symmetric in the leaf
   (q ∈ capAt i), so canonicalization must respect the surplus designation.
5. **Uniform-rigidity track** (F3.ii) in parallel — the only current coverage
   for slot-3 |A| ≥ 12, hence ultimately for full closure of obligation 4.
6. **Workstream B** parked until a producer surface exists (F5).

## Solver runs within (D-msolve)

All exact-rational/symbolic; every new encoding smoke-gated first.

| Run | Decides / narrows | Status |
|---|---|---|
| Endpoint coefficient post-processing | which centers obligation 1's bridge must transport | not attempted |
| Pinned-135 minimal-core mining + `.u`-relaxed re-census | m-uniformity of obligation 2 (F1) | not attempted |
| Interior-center two-hit probe | lemma-vs-census shape of the adjacency ≤1 bounds (F4) | not attempted |
| Resolve the 1 TIMEOUT cube in `u12_metric_sample100_verdicts.jsonl` | cleanliness of the uniform-death signal | not attempted |
| Exhaustive (5,5,4) constrained census + per-cube certs | |A|=11 slice of obligation 4 | planned (workstream A) |
| Sparsity-invariant separation test on mined cores | plausibility of a combinatorial uniform-rigidity criterion (F3.ii) | not attempted |

Explicitly **not** proposed, with dead-end citations: SOS/Positivstellensatz
certificate hunts (Clusters 2/5), QF_NRA free-frame runs (D-msolve),
Nullstellensatz on the liveData equality leaves (SAT — F5),
order-type/chirotope encodings (Cluster 1), bisector-incidence counting
(Cluster 1), any monotonicity route matching ★2/Build B scopes.

Structural assumptions used: finiteness of A; convex independence is
hereditary; K4 is not known downward-hereditary; cap-sum identity
c₁+c₂+c₃ = |A|+3 and the PROVEN per-cap lower bound
`capTriple_caps_card_ge_four` (`U1LargeCapRouteBTail.lean:2105-2135`), which
confirms (5,5,4)/|A|=11 is the minimal two-large-cap case — no (5,5,3) slice
exists.
