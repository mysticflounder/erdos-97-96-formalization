<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Dead Ends — Erdős 97 removable-vertex / U-lane

> **Provenance (2026-07-06).** Copied from the historical companion repo
> `p97-rvol` during the 2026-07-05 U-lane import; this file in
> `erdos-97-96-formalization` is now the canonical copy. Entries were written
> from p97-rvol's perspective: "this repo" in the body means p97-rvol
> (`RVOL.P97.*`); most cited symbols now also exist here under
> `Erdos9796Proof.P97.*`. The p97-rvol docs referenced below
> (`live-status.md`, `upstream-closure.md`, `postmortems/`, `audits/` from
> that repo) were not copied — consult `../p97-rvol/docs/` for the
> historical record. The live frontier is tracked in this repo: see
> `u-lane/97-slot3-certificate-closure-plan-2026-07-06.md` and
> `four-point-subpacket-plan.md`.

Don't-repeat log: the durable lessons from failed/closed routes, clustered by the
obligation they attacked. This is not a status file. Before citing any apex1 /
U2.B solver result, read p97-rvol's
`docs/postmortems/2026-06-27-apex1-family-vacuity.md` and
`docs/audits/2026-06-27-solver-verdict-encoding-implication-audit.md`
(historical repo).

## Conventions (read once; entries reference these by tag)

### (Q) — the consolidated open incompatibility
The single open obligation behind U1.3, U2.B, and the c5d3b family is the
**global per-vertex-K4 forced-repeated-circle incidence** question: does
{global convex-independence of `A` + K4 (a ≥4-point equidistant class) at every
vertex + the `IsM44` cap cardinalities} forbid a surplus-cap point class from
escaping its opposite cap — equivalently, forbid ≥4 surplus-cap points sharing a
common apex-distance (a class `T` with `T ⊄ Cᵢ`)? It has appeared under many
names — NEW-1, L6c, producer-payload, `U5GlobalIncidence`, OQ-1 (the
unit-distance face), "the surplus-cap escape" — all the same object. It is
irreducibly metric / ∃ℝ-flavoured (n=10 coordinates are cyclotomic-algebraic, a
positive-dimensional real variety); no in-repo route, no literature lead.
- **UD vs SD:** the unit-distance reading (OQ-1 / Q-min / O1 / Leg-3 / Gap-A) is
  strictly WEAKER than Problem 97 (the same-distance reading SD = `erdos97_rhs`).

### (D-caps) — caps are chord-separation sets, not circles
`OnArcOpposite` (`Foundation.lean`) is a signed-area half-plane test, NOT circle
membership. Only the 3 Moser vertices lie on the MEC boundary; interior cap
points are strictly inside the closed MEC disk (`disk_mem`, `dist · center ≤ R`).
Consequence: there is no "adjacent-cap circle," so every two-circle ≤2-point
reduction (`two_circle_common_point_eq_endpoint`, radical-axis, vesica) has no
foothold on a cap unless a genuine circle is independently present. Proving a cap
concyclic ("every cap point equidistant from its opposite apex") IS U1.3
(`U1EndpointEquality`); using it to unblock anything is circular.

### (D-msolve) — solver / encoding semantics
- msolve tuples: `[-1]` = ℂ-empty (UNSAT over ℂ); `[1, n, -1, []]` =
  positive-dimensional; `[0, …]` = zero-dimensional. Parse the whole tuple — a
  positive-dimensional / non-vanishing Gröbner output is NOT a contradiction, and
  complex Gröbner bases cannot see real-emptiness.
- SMT scope: continuous QF_NRA over a FREE frame with full-K4-everywhere is not
  solver-decidable (z3/cvc5 time out — even the (4,4,4) known-result gate). Fixed
  exact-rational frames are tractable but UNSOUND for the general verdict;
  partial-K4 is SAT even at (4,4,4). Use exact-rational / symbolic only —
  decimal-literal frames give spurious ~1e-16 SAT.

### (REF) — file:line references are indicative only
Both repos were restructured into subdirectories, so filenames and line numbers
drift; the **Lean symbol name is the stable handle**. Entries were written when
"this repo" = `p97-rvol` (`lean/RVOL/P97/`, now historical) and the sibling
dependency = `erdos-97-96-formalization` (`lean/Erdos9796Proof/P97/`, e.g.
`N9EndpointN4e.lean` → `N9Endpoint/N4e.lean`). Since the 2026-07-05 import,
the route-B-tail closure modules exist here under `Erdos9796Proof.P97.*`.

---

## Cluster 1 — U1.3 / U2.B surplus-cap escape (LIVE frontier)

**Status.** The three open spine leaves are U1.2
(`u1ExactnessFromMinimality_holds`, `RVOLSpine.lean:92`), U2.B
(`noStrictAdjacentEscapeAtOppApex1_holds`, `:121`), and U3
(`u3DeletionSaturation_holds`, `:165`). U1.3 and U2.B both reduce to the SAME
single open obligation = (Q), the surplus-cap escape exclusion. The deleted
target `U2NonSurplusSqueeze.oppApex1_adjacent_hits_of_K4` (old `RVOLSpine.lean:117`)
must not be recreated.

**The reduction (PROVEN, grounded — kept).**
- `u1EquilateralTransfer_proof` (`U1TwoShortCapReduction.lean`): `IsM44 ∧ U1.3 →
  equilateral`. Contrapositive: in any non-equilateral M44, U1.3 is FALSE, and
  the surplus-cap escape is the mechanism by which it fails.
- The non-surplus squeeze `u2FullDistanceClasses_of_capContainment` (p97-rvol
  `U2SqueezePort.lean`, kernel-pure / axiom-clean `{propext, Classical.choice,
  Quot.sound}`): given N4e cap-containment `hcont1`/`hcont2` (the ≥4
  apex-equidistant class at each non-surplus apex ⊆ its cap, at the K4-radius
  `r`), U2.B follows by cardinality alone (`|class| ≥ 4` from K4, `|cap| = 4` from
  `IsM44` ⟹ `class = cap`). The sibling squeeze (`exact_cap_class_at_vi` →
  `n6_equilateral_moser_triangle` → `n7_circle_placement`, sibling
  `N9Endpoint/N67.lean`) then gives U1.3 (sup), equilateral, and shared-radius all
  FREE downstream. So **U2.B is ONE open obligation**: produce N4e cap-containment
  at the K4-radius for the two non-surplus caps. (This supersedes the older "(sub)
  done / (sup)=U1.3 open" split: the operative interface `N4eCapContainment` is
  the vertex-centred `{dist vᵢ x = r, card ≥ 4} ⊆ Cᵢ`, UNCONDITIONAL via the N4d
  Form-trichotomy glue `n4eCapContainment_of_n4c_n4d` — not the U1.3-conditional
  reverse containment.)

**The open obligation (= (Q)).** Exclude a ≥4-point apex-equidistant class `K` at
a non-surplus apex that contains surplus-cap interior points (`T ⊄ Cᵢ`): the
K4-radius `r` need not equal the cap's isosceles anchor distance `d`, and the
surplus cap (card ≥ 5) can host escapees. This is ABSENT at (4,4,4) (no surplus
cap), so the proven n=9 endpoint never faced it. **Sanctioned direction (Adam,
2026-06-27):** PORT the proven sibling N4d → N4e → N8 cap-containment machinery,
ADAPTED to the two size-4 opposite caps of an (m,4,4) frame — NOT a FiniteN9-style
algebraic certificate. Live working doc:
[`u-lane/97-u2b-apex1-n9-cap-containment-port-scope-2026-06-27.md`](u-lane/97-u2b-apex1-n9-cap-containment-port-scope-2026-06-27.md).
- **Retracted lever:** a FiniteN9-style exact algebraic-number certificate over
  the n=10 cyclotomic field (degrees 72/144/360/504) was the last unrefuted idea
  as of 2026-06-23. It is RETRACTED (Adam, 2026-06-27): the n=9 endpoint is proven
  structurally, not by a certificate, so apex1 needs no certificate — port the
  structural machinery instead.

**U2.B ≡ U5-t1.** The U2.B surplus-escape kernel is the same global-K4 incidence
content as U5 t1 `confined_class_exists`. Banked grounded progress (sorry-free,
kernel-pure): the squeeze reduction above (`U2SqueezePort.lean`,
`U2NonSurplusOneHit.lean`), and the escape-promotion bridge
`U5DangerousTriple.candidate_of_not_mem_boundedSupport`
(`U5GlobalIncidenceSupport.lean`) — free + non-circular, its `hexact`
(exactly-3-on-circle) produced from `U3LocalizedNoQFreePacket.no_qfree`.

### Closed routes to U1.3 / U2.B (do not re-attempt)

**docstring route** — K4-at-apex + `cap_arc_midpoint_inequality_v1/v2/v3` is
machine-refuted insufficient. The three midpoint lemmas are PROVEN but one-sided
(`⟪x−vᵢ, y−vᵢ⟫ ≥ 0` only); `K4 = HasNEquidistantProperty 4 A` is a whole-`A`
per-point existential (some radius per point, witnesses unpinned to the cap).
Exact falsifier: a non-equilateral unit-MEC frame, 4 in-disk cap-side points, all
named facts holding, ¬equidistance SAT (`scratch/u13_equidist/`). The missing
fact is exactly the K4-witness-set = cap pinning.

**apex-distance monotonicity (Build B)** — FALSE as a local geometric fact. The
apex one-hit bound `N8a3AdjacentCapDistanceStrict` (an unproven `abbrev`) is
refuted by an exact Frame-I witness: 4 surplus-cap points at common apex
squared-distance 49/16, all in the closed disk, on the cap side, pairwise
distinct, convex (cocircular ⟹ convex for free). Strict monotonicity fails
maximally. Do not re-attempt any apex-centred one-hit / monotonicity bound as a
LOCAL fact. (This is a DIFFERENT center from the endpoint monotonicity the sibling
engine actually uses — see Build A.) Artifacts: `scratch/u13_buildB/`.

**endpoint-monotonicity (Build A)** — necessary-but-insufficient. The endpoint
engine (`card_le_one_of_subset_sameRadius` + `E3L20{a,b}`, `OrderedSideChain`) is
size-agnostic and PROVEN; via the `coreSelector_v1` reduction it even pins, at the
non-surplus apex pre-equilaterally, `|T|=4 ∧ I_v ⊆ T ∧ |T∩C_u|=1 ∧ |T∩C_w|=1`.
But the containment-producing Form-A counting tail (`N4dFormAEndpointPairKill.lean`)
does NOT lift: it hardcodes `|interior|=2` and the 9-partition; at surplus
interior `m−2 ≥ 3` the cover budget inflates (fitting the surplus points into two
Moser-centred circles would make the surplus cap a distance class = cap-on-circle,
FALSE for the long cap), so `{v1,v3} ⊆ K` fails. The surplus points joining the
apex class IS the escape; Build A bottoms out here. "No sieve repair" is solid;
"no counting argument of any kind" is CONJECTURED.

**continuous SMT (QF_NRA)** — exhausted; see (D-msolve). Free-frame + full-K4
times out (z3/cvc5), including the (4,4,4) known-result gate. The (5,4,4) v2-class
gate at 600 s/leaf, 10 workers: 91 UNSAT (Case A, sound exclusions) / 0 SAT / 35
timeout (the escape leaves); cvc5 3/3 timeout on representative escape leaves. The
large-budget explicit-class gate (direction 2) is spent. Partial-K4 / fixed-frame
results are unsound for generality. Artifacts: `scratch/u13_global/`,
`scratch/u13_combo/`.

**global isosceles counting (route a)** — CLOSED-NEGATIVE. The matching upper
bound is proven and tighter than the open Dumitrescu eq.(5):
`Dumitrescu.base_apex_double_count` (sibling `Dumitrescu/L2.lean`, axiom-clean)
gives `iCount(A) ≤ n(n−1)`. K4-everywhere already gives `iCount ≥ 6n`; the
honestly-provable escape boost is 0; even the max-conceivable single-apex boost
ties only at n=10 (n = m+5, m ≥ 5 ⟹ n ≥ 10). No `lower > upper`. The
`iCountAt_ge_seven/_ten` lemmas need a 4-class-plus-extra-pair or 5-class the
escape does not supply. The `IsoscelesCount` / Dumitrescu machinery lives in the
SIBLING repo (per (REF)). The favourite-degree first-moment variant is separately
dead — bounded `≥4n−14` from below (wrong direction); and the unit-distance target
it rests on, `I_c < 4n`, is ≈ the 35-year-open Erdős–Fishburn conjecture
(`I_c = 2u_c + O(1)`), strictly STRONGER than Erdős 97, and even granting it would
yield only a *firewall* ("no convex PerVertexK4 set exists"), not the RVoL
removability/replacement step the spine needs.

**decorated order-type / chirotope encoding** — NO-GO for deciding the
entailment. A chirotope (signedArea2 triple signs) carries NO metric information
(oriented-matroid theory); by `u1EquilateralTransfer_proof`, under `IsM44`
`¬U1.3 ⟺ non-equilateral`, a pure equidistance-hypergraph quantity. K4-at-a-data-
point is not order-type-expressible — explicit blindness witness:
`A={(0,0),(5,0),(4,3),(0,5),(−3,4)}` and `A′` (center shifted to (1/10,1/10))
have identical decorated order type yet differ in equidistance-from-a-data-point.
Every purely-combinatorial relaxation of the coupling is provably SAT (zero
discriminating power); the only sound coupling ("4 pts equidistant from p" = "4
concyclic about p") re-introduces the QF_NRA the solvers time out on. The
size-agnostic engine reuse is gated on `hmono` (strict monotonicity), refuted by
Build B at the apex; asserting the same-side-as-apex orientation `P7` as a free
clause is UNSOUND (in the (4,4,4) cert it is DERIVED from the metric
power-of-a-point bound). Bisector-incidence counting is vacuous (K4 demands ≥6n
incidences; Szemerédi–Trotter budget ~n²; at n=10, 60 ≪ ceiling). Only worth
keeping: the (4,4,4) **gate** as a soundness-anchored way to CONFIRM the no-go
(KNOWN-true there, no surplus cap to host the escape) — not a route to decide
(5,4,4). Literature: Mnëv 1988, Shor 1991, BLVSWZ *Oriented Matroids*,
Aichholzer–Aurenhammer–Krasser order-type DB.

**equilateral sub-case** — CIRCULAR for U2.B. `u2FullDistanceClasses_holds`
carries only `ConvexIndep` + `K4` (+ derived `IsM44`), NO equilateral hypothesis;
the equilateral Moser triangle is reachable only via U1.3 or U2.B itself
(downstream). So assuming the equilateral frame to prove U2.B is circular; the
U-lane prose already states "the proof has to be pre-equilateral." The
pre-equilateral deletion sub-tree (`U2a2-1b4c2…`, funnelling to the leaf `d3c1` =
the adjacent-cap one-hit bound `n₂(s) ≤ 1`) ALSO does not close: its prose-stated
local-lever proof is DISPROVEN (explicit convex equidistant interior pairs a₂,b₂
in strict cap order for h ≲ 0.65; tight witness at h=0.5) and the full-branch
(5,4,4) SMT is timeout-inconclusive (SAT only with K4 entirely off; K4 on even 3
rider points → timeout). The equilateral-conditional freedom reductions (escape
radius `r ∈ [3/2, √3)`) are useful only if the equilateral case is reached
non-circularly, which it is not.

**minimality / essential-vertex covering** — DEAD as a forcing lever
(adversarially confirmed). `Minimal D` ⟹ the exactly-4 classes must cover all
vertices, but covering is a member-coverage (not center) condition: it forces only
`≥⌈11/4⌉ = 3` essential centers — a positive-dimensional fragment, not the
over-determined faithful all-vertex regime. Covering leaves `dist(p,u)`
algebraically free and is consistent ONLY with the escape (adding `dist(p,u)=1`
makes the system ℂ-empty; off-circle is posdim). Minimality DOES close the c5d3b
CONSUMER (`qAllowedConfined_holds`, vacuously by premise contradiction: U3 yields
a removable vertex, minimality forbids one) but gives no producer teeth. The
missing fact is the same-circle export (Δ=0) itself = (Q).

**spine discipline (finiten9-drift)** — do not re-target the CLOSED n=9 endpoint.
`FiniteN9Closure`, `counterexample_card_ge_nine`, and the universal reduction are
sorry-free, axiom-clean, and OFF the spine of the open RVoL descent — proving any
of them advances the spine by zero. A 2026-06 session drifted onto "Lemma B / the
finite endpoint" on a subagent's false "live sorry" report (a stale SORRY-GATE
comment, not a live tactic). Before any build/solver/agent launch, confirm the
target lies on the path from the active goal to an open `sorry`
(`proof-blueprint spine`); treat any "X has a live sorry" claim as a hypothesis to
verify (`proof-blueprint axioms` / grep-for-tactic) before acting.

**Net.** U1.3/U2.B = (Q). Every local, combinatorial, and solver lever above is
closed or exhausted; the open work is the structural N4d → N4e → N8 port adapted
to the (m,4,4) caps.

---

## Cluster 2 — ★ / b1a1M cap-subchain monotonicity (closed as a route)

**Status.** Closed as a route — no live spine consumer. The arc-angle approach
and all ★ Positivstellensatz / SOS / case-split routes are PROVEN dead ends. U1k
is bypassed without ★ via `CGN6c_oneSidedDistanceInjective`; the angular core
`b1a1m_G_nonneg_angular` is kept as a grounded sublemma only. The c5d0/c5d1/c5d3b
adjacent-cap kernels that appear inside the original b1a1M entry are covered in
Cluster 3; the b1a1M ★ angular core does not close them (that is "Framing 2",
where the analogous inequality is FALSE).

### b1a1M-arcangle / ★ — arc-angle, SOS, case-split routes

**What was tried:** route `b1a1M` (arbitrary-center cap-subchain chord
monotonicity, micro-stack M0–M5) through `arcAngle_chord_length_strict_mono`; when
that failed, reduce to the inner-product inequality ★ (`⟪E_right−x, x−p⟫ ≥ 0`) and
discharge via closed-cone Positivstellensatz / SOS / geometric case-split / arc
inscribed-angle.

**Why each is dead:**
- **Arc-angle:** `arcAngle_chord_length_strict_mono` needs the compared points
  cospherical about the center. In b1a1M the center is the arbitrary cap vertex
  `p`, and `x, E_right` being NOT equidistant from `p` IS the claim — A3's
  hypothesis is the negation of the goal. See (D-caps). The "Thales with one chord
  endpoint in the disk" generalization is itself FALSE (483k/851k violations).
- **SOS / Positivstellensatz (every degree):** `b1a1M_metric` (PROVEN,
  axiom-clean) reduces b1a1M to ★ via `dist(p,E)²−dist(p,x)² = ‖E−x‖² +
  2⟪E−x, x−p⟫`. ★ is empirically true (0/10M+ samples, min→0) but admits NO
  closed-cone certificate at ANY degree: the closed hypothesis set's closure
  contains degenerate strata where ★ is strictly negative (e.g. `E_left=p=f`,
  `x=−f` antipodal gives `G=−4` while every signed-area / disk-slack constraint
  vanishes). A closed-cone identity would force `≥0` on the whole closed set →
  contradiction. Do not re-run SOS / SDP / nlinarith cert searches for ★.
- **Geometric case-split:** same closure-collapse — the totally-collapsed
  configuration lies on the boundary of BOTH halves of every single sign split; no
  finite polynomial case-split removes it.

**What IS proven (kept):** `b1a1M_metric` (the reduction to ★); and ★ itself has a
valid pen-and-paper proof in the genuine strict/open regime (strict-trig, arc < π,
distinct ordered vertices, disk membership — exactly the open conditions a closed
Positivstellensatz cannot encode). The angular core is PROVEN in Lean as
`b1a1m_G_nonneg_angular` (`CapArcInteriorPoints.lean` / `CapArcInteriorPointsExt.lean`,
axiom-clean) and is kept as a grounded sublemma.

**Lesson:** the (D-caps) cospherical incompatibility blocks arc-angle machinery
wherever the monotonicity center is off-arc; closed-cone certs for ★ are provably
impossible at every degree (do not retry); ★ has a strict/open hand proof, but the
Framing-2 variant (U2a2/c5d3b) is a distinct configuration where the analogous
inequality is outright FALSE.

### b1a1M ★ — consumer audit; bridge deliberately not built

**Decisive (source-verified 2026-06-21):** ★ has NO live Lean consumer wired to a
spine leaf.
- **U1k:** bypassed. `CGN6c_oneSidedDistanceInjective` (PROVEN, axiom-clean) gives
  `dist(p,x) ≠ dist(p,E_right)` — U1k's contradiction is against an *equality*, so
  mere `≠` suffices; strict `<` (= ★) was overkill. The M0–M5 micro-stack was
  built strict-monotone by oversight.
- **U1m/U1n:** the open obligation is descent-packet PRODUCTION; CGN6c discharges
  the descent contradiction. ★ is not the open part.
- **U2a2/c5d3b ("Framing 2"):** the monotonicity inequality is REFUTED outright
  (Cluster 3). ★ cannot help.
- **U6:** the only cap-chain-monotonicity row (U6b-a3d) needs distance
  INJECTIVITY (CGN6c shape), not strict ★; and `u6ModeBExit_of_pressureCore`
  bundles a3d into one `hPressure`, so a3d alone shrinks no spine leaf.

**Outcome:** the Cartesian↔angular extraction bridge (Steps 2–3 of the
extraction-bridge route doc, archived under
`archive/2026-06-27-consolidation/u-lane/97-b1a1m-thales-G-nonneg-route-2026-06-21.md`)
is deliberately NOT built — it would produce a ★ that nothing consumes. **Lesson:** before chasing a
"strict monotonicity bottleneck," check whether the downstream consumer needs `<`
or merely `≠`; CGN6c already provides `≠` for cap vertices with no sign
certificate.

**Related (G3 adjacent-cap one-hit `N8a3`):** Routes B (compose `b1a1M_metric`)
and C (reuse `CGN6`) are both CLOSED by the same cospherical / off-chain-center
incompatibilities. The viable path is Route A (rigid-frame coordinate trig, no
closure-collapse degeneracy); its analysis core is landed axiom-clean in
`U2OneHitMonotone.lean` (`n8a3_of_capCoordChain` in the normalized frame).

---

## Cluster 3 — c5d3b adjacent-cap kernels (HISTORICAL — payload closed off-spine)

**Status (HISTORICAL).** The theorem-facing `C5D3B.qAllowedConfined` payload is
CLOSED by `Problem97.C5D3B.qAllowedConfined_holds` (global U3/minimality
contradiction); the C5D3B Lean files are OFF-SPINE (unimported). This cluster is
retained only for the "why local/constructive routes fail" lessons. The c5d0
sibling kernel is genuinely closed locally (`c5d0_qstar_outside_disk` /
`c5d0_contradiction`, axiom-clean); c5d1c0's core is proven
(`c5d1c0_angle_v2_obtuse` etc., axiom-clean inscribed-angle reduction). All other
entries are refutations.

### c5d0-closure — q*-outside-disk shortcut (c5d0 ONLY)

**What was tried:** with `v₁=(cos h,−sin h)`, `v₃=(cos h, sin h)`,
`q=(cos h−√3 sin h, 0)`, `r=2 sin h`, the second intersection `q*` of `B(q,r)` and
`B(v₃,r)` has `‖q*‖²−1 = 4√3 sin h sin(h−π/6)`. The c5d0 packet forces
`|v₃v₂|=|v₃v₁|` (isosceles, apex angle `π−2h`); non-obtuseness
(`MoserTriangleNonObtuse`) gives `h ≥ π/4 > π/6`, so `‖q*‖² > 1` — the packet is
self-contradictory.

**Why closed:** PROVEN axiom-clean (`c5d0_qstar_outside_disk`,
`c5d0_contradiction`, `U2WitnessReflectionKernel.lean`); the abstract-packet →
coordinate-frame reduction stays prose. **Lesson:** the shortcut NEEDS the
center-`v₃` equality `|v₃v₂|=|v₃v₁|` to pin `h ≥ π/4`. It does NOT transport to
c5d1c0 (center-`q` equalities, no center-`v₃` line) or to c5d3b (lacks the
endpoint row `x₃=v₂` entirely).

### c5d1c0-closure — ∠v₂-obtuse mechanism (inscribed-angle reduction)

**What was tried:** for rows `c5c3c`/`c5c4a2`/`c5c4b3`, show the K4-at-`q`
equilateral packet forces `∠v₂` strictly obtuse, contradicting
`MoserTriangleNonObtuse`.

**Why closed:** PROVEN axiom-clean — `inscribedAngle_bridge_identity`,
`c5d1c0_angle_v2_obtuse`, `c5c4a2_qstar_on_O_side`, `c5c4b3_angle_v2_obtuse`,
`c5c3c_angle_v2_obtuse` (`U2C5d1c0Core.lean`). `c5c4a2` is the cleanest row (`q` is
the equilateral apex of `v₁v₃`, so `hQO` is immediate); `c5c3c`/`c5c4b3` step-2
proven, the step-1 cap-bridge stays prose (honored scope). **Caveat:** `hQO` (`q`
on the `O`-side of `v₁v₃`) from the bare metric packet alone is FALSE on a
positive-measure set — the load-bearing constraint is the adjacent-cap `u`
existence, so "non-obtuse vacuity via `hQO`" is logically the adjacent-cap
`u`-exclusion. The c5d2-style two-circle route does NOT transport (`u` lies on
`B(q,D)` only, not `B(v₂,D)`).

**Prose-owner flag:** the c5d1b0/c5d1c0 transport lines write `|qy|=|qv₃|` /
`|qy|=|qv₃|=|qv₂|` as the q-class, but the row ledger `c5c3b1` gives the q-class
as `{v₁,v₂,u,y}` with no `|qv₃|`. {{NEEDS_ADAM_INPUT}} reconcile — likely `|qv₃|`
should be `|qv₂|`/`|qv₁|`. The Lean core is independent (raw coordinates).

### monotonicity-refuted — local distance-monotonicity (★2), FALSE

**What was tried:** close c5d3b (+ siblings) by the interior-center off-arc
monotonicity `(★2)`: `⟪u−v₁, v₁−q⟫ ≥ 0` to exclude the residual witness via
`dist(q,·)` ordering. **Why dead:** `(★2)` reduces to `τ cos(φ+π/6) ≥
cos(h−π/6)`; explicit counterexample `u₀=(τ₀,0)`, `τ₀=cos h+(2−√3) sin h` is a
strict interior cap-`C₁` point lying ON the forbidden circle `B(q,|qv₁|)`, with
margin `(√3−2) sin h < 0`. False even with the equilateral pin; an upper bound on
`|u|` makes it MORE constrained. **Lesson:** do not re-attempt distance
monotonicity to exclude the residual witness in ANY c5d3b-family leaf — this kills
the route for `c5d0c0`/`c5d1c0`/`c5d3b`/`c5d3c-d` at once. Exclusion must come from
(Q).

### vesica-local-sat — given-equilateral two-circle packet is satisfiable

**What was tried:** close c5d3b from its given equilateral `qv₁v₃` packet + two
equal-radius circles `B(q,r) ⊇ {v₁,v₃,q*,u}`, `B(v₃,r) ⊇ {v₁,q,q*,w}`. **Why
dead:** explicit open-condition LOCAL MODEL (re-verified) — `0<h<π/6`, the two
circles as specified, `u_e=q+r(cos(−π/6−e),…)`, `w_e=v₃+r(cos(−π/2−e),…)` become
strict-interior same-side distinct witnesses for small `e>0`; all local hypotheses
hold and PerVertexK4 at `q` is met by `{v₁,v₃,q*,u_e}`. No local/concyclicity
contradiction exists. **Lesson:** the vesica packet is locally consistent; no
local lever closes it (see also (D-caps) — no adjacent-cap circle for a two-circle
foothold). Closure requires (Q).

### radical-axis-producer & middleslot-producer — local techniques inapplicable

**radical-axis:** `dist(v₃,u)²−r² = (4−8 sin(t+π/3))·s²` vanishes only at `u=v₁`
and `u=q*` — the only points of `B(q,r)` at distance `r` from `v₃` are the two
shared intersections, so `dist(v₃,u)=r` is unreachable for `u∉{v₁,q*}`; and since
`v₁,v₃,q*` ALL lie on `B(q,r)`, the radical-axis identity evaluates to zero (no
off-circle endpoint to transport to). Transport step is provably vacuous (D-caps).
**middleslot (O1/Leg3 R-star):** three each-fatal breaks — wrong object (c5d3b
witnesses are strict hull vertices, not SED-pin interiors), wrong regime (SED
`=√3/2 < 1`, below the `R≥1` height engine), wrong hypothesis (the lemma needs a
single GLOBAL unit-distance min-deg-4 graph; c5d3b lives in a per-vertex
`PerVertexK4` set — and a survivor that WERE global unit-distance would have SED
`>1`, killing it). **Lesson:** both local producer attacks are exhausted; the only
reachable producer is (Q).

### incompatiblewalk-descent — no well-founded local monovariant

**What was tried:** close the constructive bounded-support obligation via a
strictly-decreasing Euclidean monovariant on the fresh incompatible walk. **Why
dead:** all four candidate monovariants fail — cap-rank/convex-layer is constant
(strict convexity ⇒ hull depth 0), surplus-cap is base structure, angular is
strict-convexity restated, metric is tunable / non-decreasing. Combinatorial L1
(abstract 4-star cycle) and Euclidean L2 (cycle + vesica) are both SAT; L3 (full
4-stars + strict convex + global PerVertexK4) reduces to (Q). **Lesson:** no
additive-scalar / first-moment measure of the directed star-digraph is
well-founded on the escape recursion; a global descent is legitimate only if it
supplies a genuine well-founded state space — i.e. it is a form of (Q), not a
c5d3b-local shortcut. (Old "+7 DOF" / closed-support emptiness claims were
EMPIRICAL and one was refuted by an msolve denominator bug — do not cite.)

---

## Cluster 4 — OQ-1 / question (Q): routes that cannot force the global incidence

All four entries are PROVEN-dead attempts to force (Q) by elementary geometric or
combinatorial means. (Q) is the single irreducible open obligation; its
∃ℝ-complete variable-radius character (Mnëv universality) is the root explanation
for the uniform failure.

### ptolemy-argument-circular

**What was tried:** Ptolemy equality on `(t₁,t₂,t₃,u)` (with `T={t₁,t₂,t₃}` on
`circle(p,r)`) to force `u` onto `circle(p,r)`. **Why dead:** PROVEN-CIRCULAR —
Ptolemy equality holds iff the four points are concyclic; with `T` already on
`circle(p,r)`, that condition is exactly `dist(p,u)=r`, the target. **Lesson:** any
Ptolemy equality on `(T,u)` is the conclusion in disguise.

### global-topological-trapping

**What was tried:** contradiction from G(A) outerplanarity / G_sym planarity /
Melchior / selection-chord crossings if `u` migrates off `circle(p,r)`. **Why
dead:** each arm fails independently — G_sym is PROVEN non-outerplanar (Mode A
forces a K₂,₃), and whether the uniform-radius G(A) is outerplanar IS the open
problem; planarity gives only n ≥ 6; Melchior needs R < 1/√2 (Mode A has R ≈ 1,
and the R < 1/√2 sub-regime was already exhausted by the Levi-cage n=26 floor);
chord crossings are generic, not contradictions. Root cause: PerVertexK4 is
∃ℝ-complete, so general topology cannot force Δ=0. **Lesson:** do not re-attempt
outerplanar/planar/crossing-count trapping. The only non-dead arm is O1 Leg-3
R-star / middle-slot incidence in the R < 1 sub-band.

### selfstress-signmix

**What was tried:** treat the PerVertexK4 system as a bar-and-radius framework and
use forced self-stress signs under strict convex position — (Q-A) drive directed
stress dimension below n+4; (Q-B) deposit a 5th point on `circle(p,r)`. **Why
dead:** every sign condition from convex position is a finite intersection of open
half-spaces (a cone, never an equation), so it cannot cut a linear dimension or
seed a primal equality (sampling: sign-mix fraction = 1.000). The naive
"incidence gradient in Jacobian row space" test is VACUOUS; the valid
Gröbner-reduce test returns NOT forced; non-planarity blocks the Maxwell–Cremona
lift. **Lesson:** convex position contributes inequalities (open cone) — the wrong
type to force (Q). The sign-mix lemma is a grounded sublemma but a measure-1 open
condition; do not pursue stress-dimension, stress-sign, or polyhedral-lift routes.

### faithful-construction-nogo

**What was tried:** refute (Q) by constructing an all-strict-convex n-point
PerVertexK4 set with `u` off `circle(p,r)`. **Why dead:** PROVEN ceiling (one-way
reduction) — such a witness IS an Erdős-97 counterexample. With
`counterexample_card_ge_nine` and `FiniteN9Closure` both kernel-clean, the first
possible witness is n ≥ 10, so "refute (Q) by faithful construction" ⟹ "construct
an Erdős-97 counterexample." SAT escapes do not help: they impose PerVertexK4 at
only k ≪ n centers (positive-dimensional), whereas the faithful all-vertex system
is over-determined (DOF `−n−3`) and forces point-collapse (n=5 ℂ-empty, n=7
collapses ≥2 points, n=10 patterns UNSAT under distinctness). See (D-msolve).
**Lesson:** accept the ceiling — no construction can refute (Q) without solving
Erdős-97. (Q) is the irreducible open object; all elementary and
global-combinatorial levers are exhausted.

---

## Cluster 5 — N4d q'=E sign-block (HISTORICAL — closed upstream)

**Status (HISTORICAL).** The n=9 endpoint these entries served is proven in the
sibling repo by `FiniteN9Closure` (`N9Endpoint/Closure.lean`, kernel-clean: axioms
= `propext, Classical.choice, Quot.sound` only — no `native_decide`, no
certificate). The `q'=E` b₂ rows were closed there by
`qEqE_b2_column_pinclash_false` (`N4d/QeqEb2PinClash.lean`, a column pin-clash
argument), NOT by any route below. Kept only for don't-repeat lessons.

### signblock — SOS/Positivstellensatz for `0 ≤ f1·f2`

**What was tried:** close the sign crux `0 ≤ f1·f2` (the one-cosine crux `U·wxb ≥
0 ⟺ cos(t−β) ≤ cosδ`) via `nlinarith`/Z3/SOS (Putinar cone), six formulations.
**Why dead:** the closed hypothesis set's closure carries degenerate strata with
target ≤ 0, so no `Σσᵢgᵢ` certificate exists at any degree — same closed-cone
collapse as the b1a1M ★ family; see (D-msolve). The crux was eventually closed by
`qEqE_oneCosine_crux` via an analytic order argument (NOT SOS). **Lesson:** do not
re-attempt nlinarith/Z3/cvc5/SOS on `f1·f2`, `U·wxb`, `c2 ≤ cosδ`, or `F_max ≤
cosδ`.

### reflPt-upper — `E := reflPt v₂ v₃ q` is the WRONG point

`hEside ⟺ sin(2δ−η) > 0` is FALSE from the packet pins (build-verified refutation
`reflPt_upper_hEside_REFUTED`; `reflPt` lands on the lower partner in all sampled
cases). The reflection across `v₁v₃` is upper but a DIFFERENT point. The sanctioned
closer uses the named cap vertex `b₂ = Z.b2` (for which `hEside` is available via
`c2_vertex_same_open_side_as_v3`). **Lesson:** do not use `reflPt v₂ v₃ q` as an
upper witness.

### hAElt-refuted & I3pair-signblock — the lower-arc keystone and Φ sign-block are dead for b₂

`hAElt : |v₁ b₂| < |v₁ v₂|` is FALSE — logically independent of the keystone's
hypotheses (counterexample re-verified; `b₂∈I₂` only satisfies `|v₁b₂| < |v₁v₃|`,
not the `v₂`-bound, which belongs to I₃). So `qEqE_lowerArc_sameSign_of_shell` is a
dead lemma for the b₂ rows. The I₃-pair salvage is also dead: `qEqE_capOrder_opposite`
proves `Φ < 0` UNCONDITIONALLY for any distinct I₃ pair, so there is no `Φ ≥ 0` to
clash with (the keystone's `Φ ≥ 0` was an artifact of the impossible `hAElt`).
**Lesson:** do not build a producer asserting `hAElt` for `b₂∈I₂`, and do not
attempt any Φ sign-block variant.

### sharedcircle-a2 & smallS-uniform — wrong-transfer and a refuted (★)

`SharedCirclePointForcesV3` does NOT transfer to a₂ (it needs the unit-radius
equilateral coincidence r=s=1 of the q=v₁ branch; at b₂ rows s<1 and a₂ is itself
a non-v₃ shared point); and `FiniteEndpointShell` carries NO concyclicity field —
"no-5-concyclic" is not a shell hypothesis (a closure contradiction must terminate
in disk-exit, cardinality, or convex-position). Separately, the small-s claim (★)
"b₂ rows close by convex-position alone" is REFUTED by an exact, audited
strict-convex 9-point in-disk completion at v₃=(1,3/4), s=3/4 meeting every b₂ pin
(prior UNSAT was a cosφ-sampling artifact missing the near-right-angle corner).
**Lesson:** do not reuse `SharedCirclePointForcesV3` at a₂; do not invoke a
non-existent "no-5-concyclic" field; (★) is FALSE — do not treat per-base SMT UNSAT
as a uniform theorem, and do not hard-code a threshold s₀ without a machine-checked
continuum-emptiness certificate.

---

## Cluster 6 — U-series kernels, counting & re-architecture

**Status.** All routes here are closed or retired except U1K3, which carries three
open obligations. The "land the MEC foundation first" framing across sub-theme A is
stale (the foundation is built); (D-caps) applies throughout; the active frontier
is (Q) (Cluster 1).

### A — U-series assembly (the "land the foundation first" framing is superseded)

The MEC arc-angle foundation is built and the apex-circle restatement is landed.
The cap-points-on-MEC-boundary bridge those entries depended on is provably FALSE
(a cap-point at distance d from the opposite apex that lay on the MEC would be one
of the two adjacent Moser vertices, emptying each exact-4 cap); the correct ambient
is `ApexApolloniusArc` (`OangleBridge.lean`), with `U2ApolloniusArcs` proved from
`CapTriple.arc_membership`. Only durable lessons are kept.

- **u4c-c1a3c4:** route c4b/c4c/c4d through `U4MoserIncompatibleCore`
  (`U4LargeCapModes.lean`); the bridge they depended on is false. c4a/c4e are
  PROVEN; only U4c-specific companion-selection wiring is open.
- **u3d-affine-form-identities:** do not re-attempt the source identities until the
  squared-distance dictionary (coordinates of `a,b,q`) is in the prose draft (the
  named forms match the partner-apex reductions only up to an unrecovered
  q-coupling shift). Genuine reductions are closed in `U3ShortCapAffineForms.lean`;
  open content rides as the named hypothesis `dict`. Tag U3d-c1d1a1a/c1d2a1a
  `{{NEEDS_UPDATE}}`.
- **u5-mode-a-deletion:** no Phase C. The AP≥3 saturated-short certificate has the
  wrong polarity (proves `muP ≤ 2` non-existence, not the positive removability
  disjunct), is prohibited as a finite replay by the closure plan, and has no
  consumer (the assembly routes through its own inline `hExist`). Coordinates are
  cyclotomic-algebraic — `decide`/`native_decide` not viable. U5 effort goes to the
  `hExist` geometric core in `u5ModeADeletion_of_components`.
- **u5d-d-wallcrack & u3d-redirect:** both bottom out at the PROVEN U5c fact
  `|Cl_r(P,p)| = 4` exactly — no fifth class member exists, and Lemma V draws from
  a *surviving* class, not the destroyed one. Re-routing through U3d-a/U3d-b does
  not vacate U5d-d (cell U3d-e0e IS the dangerous packet, PROVEN non-empty; the
  other drain routes to the same concyclicity incompatibility). The genuine crux is
  an equilateral-free concyclicity theorem = (Q). Do not re-attempt.
- **u5dd-newangles:** NEW-2 (U3a saturation) is CLOSED-circular (the conclusion by
  definition; (D-caps) carry no equidistance equation); NEW-3 (inscribed-angle) is
  CLOSED — the A1 bridge gives only the SIGN of an angle, and the selected `u`
  ranges over a positive-dimensional order stratum, so a finite conjunction of
  sign/order inequalities cannot imply Δ=0 (dimension argument). NEW-1 (global
  forced-repeated-circle counting) is OPEN = (Q); the naive incidence count
  `I(S) ≥ 6(|S|−1)` is provably slack for `|S| ≥ 9`. NEW-1 needs Adam approval +
  a literature scan before any re-attempt.
- **u1m-c1a1c2-two-circle-producer:** `U1OpposedOrderConfig` is a correct PROVEN
  SINK with no feeder from opposed-row data (cap membership is chord-separation per
  (D-caps); endpoint roles are disjoint; radii and `dist(p,q)` are free; the
  "cross-blocking coincidence" forcing a second incidence is likely false in
  generality). Reroute (Adam-approved): U1m-c1a1c2 discharges through its descent
  horn → U1m-c1a1d → U1k.
- **u3-placeholder-masks-full-post-u2:** `U3ShortCapSaturation D` is definitionally
  EQUIVALENT to its parent goal `IsM44 → U2 → Minimal → ∃ removable` — its stub
  fields underscore their arguments (`APCount ≡ 0` makes `ShortCapNonsaturated`
  always-true; `InteriorApices ≡ ∅` makes the interior disjunct vacuously False; the
  partner-failure disjunct is killed by `D.K4`), so the `sorry` at that node is the
  whole subtree renamed, not a reduction. The real geometric content sits in the two
  dropped exits (short-cap Apollonius; U5 fixed-triple export), contingent on
  `OpApolloniusArc` / `Abstract60ApolloniusArc` (zero non-docstring consumers).
  **Lesson:** before treating a blueprint node as a reduced sub-obligation, unfold
  its stub definitions — a def whose args are underscored collapses to a trivial
  value and buys no reduction.
- **order-residual-sat-mining (consumer-only):** SAT/SMT rung-ladder mining for a
  refinement `R` of the `U5StrictOrderViolation := True` placeholder addresses only
  the CONSUMER half (`R → False`); the open crux is the PRODUCER half
  (`U5_4C_positiveDimensional` carrying `R` — the OQ-1 variety classification,
  compute-blocked 0 SAT / 0 UNSAT / 35 timeouts at 600 s). The objective is
  anti-correlated (stronger `R` ⟹ easier consumer UNSAT but harder producer), and
  the one UNSAT the plan produced was an encoding artifact (load-bearing on a
  `relaxed` proxy that collapses `u` onto a fixed circumcenter; its leave-one-out
  core used none of the selected class / residual triple / U2 facts).
  `U5StrictOrderViolation` is an `|A| ≥ 11` object — mining at `|A|=10` is the 4B
  regime where the order disjunct is absent. **Lesson:** refining a `True`
  placeholder needs producibility, not just consumer UNSAT; reject any UNSAT whose
  leave-one-out core is `relaxed`/`omitted`-derived; per (D-msolve) a local-frame
  UNSAT ≠ global contradiction.

### B — U1k counting kernels

- **u1k-b2a1e-cap-restricted-card4 (SUPERSEDED):** `card=4` belongs on the
  A-indexed class `exactClassU_A_p`, not the cap-restricted `exactClassU_p` (which
  has ≤2 members in every genuine model, `exactClass_left/right_subsingleton` from
  CGN6c). The A-indexed re-scope is implemented (`exactClassA`, full leaf assembly
  `b2a1_fires_exit`; `shared_branch_fires_exit` PROVEN, axiom-clean); remaining is
  parent-stack wiring.
- **u1k4-second-cross-edge (U1K4 RETIRED):** no survivor-counting bound exists in
  U1a–U1d (81/256 buckets give a4 empty; U1d bounds Moser coverage from the wrong
  direction), and the self-similar descent was circular (no measure, no base case).
  U1K4 is NOT an independent obligation: a4-empty closes via U1k rank-drop, a3
  re-export via U1l finiteness, a4-non-empty → U1m/U1n. U1K4-as-unconditional-
  existence is the circular global reading (false surplus strength); it was likely
  mis-stated. Do not re-attempt a4c/a4d existence or the descent.
- **u1k3-usable-continuation (OPEN — 3 obligations):** no screen bound from `|W|=4`
  alone. `|W∩C| ≤ 1` is FORCED by U1a/U1d strict side-chain monotonicity (Z3 UNSAT
  at real coords), so any "≥3 candidates beat ≤2 slots" counting argument is
  permanently dead; the screen-is-endpoint-slot route IS U2a2 (downstream, open);
  U1l-dissolution does not transfer ("screened" = skip-candidate, not
  branch-refuted). After the uniform-discard restatement, three obligations remain:
  **(e)** the empty-cap-side closer (HIGHEST VALUE, U2a2-free, stays inside U1),
  **(s)** singleton-unscreened (reduces to U2a2, open), and a genericity
  sub-question deciding which is generic. Priority: (e). Artifacts:
  `scripts/u1k3-metric-certs/`.

### C — U-lane re-architecture & O1/Gap-A (unit-distance lane)

- **ulane-rethink-wallconserved:** the Mode A re-architecture routes (a),(c),(d),
  (e),(g) are graded-dead — each forces Δ=0 from local data (PROVEN-dead,
  NEW-3 dimension argument), uses the wrong-direction count `I(S) ≥ 6(|S|−1)`
  (slack for `|S| ≥ 9`), or re-derives the same incompatibility elsewhere. Per the
  project rule, routes that merely conserve/relocate the open obligation are not
  progress. Route (f) IS (Q); Adam chose O1 (attack the incompatibility directly)
  on 2026-06-03.
- **ulane-gamma-multideletion-descent:** PROVEN-dead by monotonicity — deleting
  more points cannot restore a surviving center's lost class, so K absorbs all
  incompatible successors and it collapses to a global incompatible-hypergraph
  closure. Do not replace the removable-vertex target with direct multi-deletion.
- **ulane-beta-foreign-smaller-witness:** examined-and-empty (CONJECTURED-false,
  not PROVEN-dead) — no construction avoids the same metric circle-incidence
  constraints. Re-open only if a new construction supplies the missing foreign
  witness.
- **o1-gapA-slack-groebner-void:** PROVEN-DEAD by field closure — for any complex
  point of the equality system, the slack `s := sqrt(r−g(p))` exists over ℂ, so
  real-emptiness is invisible to complex Gröbner bases with or without slacking
  (see (D-msolve)). Do not re-attempt slack-Gröbner at any prefix; the correct tool
  is real quantifier elimination (Z3-NLSAT, QEPCAD/Redlog).
- **o1-gapA-d14-local-cramer-forcing:** the useful identity is PROVEN —
  `D14 = 4640·δ₀δ₁δ₂·SignedArea(O₀,O₁,O₂)`, so `D14=0 ↔ P2,P5,P9 circumcenters
  collinear` (NOT the source triples). But forcing does not close: an explicit
  witness `D14=603` satisfies the leaf-local equations while violating the other 13
  rows — forcing requires the full 12-block global web (R-independent, msolve-
  intractable across every encoding). This is a face of (Q): local Cramer forcing
  is provably global. Do not re-attempt leaf-local forcing or Gröbner saturation of
  `D14=0`.
- **descent-construction-antecedent-reduction:** an explicit cardinality-reducing
  descent (delete + witness-replacement) on convex PerVertexK4 sets is a no-go — the
  deletion target is selection-independent (every choice routes to "force a 5th
  witness onto Circ(p,r)" = (Q)), no additive / first-moment / per-vertex-scalar
  measure is well-founded on the escape recursion (the flat `indeg ≡ 4` vector
  saturates `Σ=4n`, `min=4>0`), and the minimal candidate measure
  `Φ = #(tight-class members)` decreases iff the incompatibility holds. **Lesson:**
  any multi-vertex simultaneous-circle discriminant that would drive such a descent
  IS (Q); do not re-attempt a scalar-additive monovariant.
- **blocker-digraph-cardinality (outdegree-one chosen-blocker map):** the proposed
  `q ↦ p(q)` reduction — pick one surviving exact-4 blocked center per
  deletion-failing vertex, take the functional-graph cycle, classify 2-cycles /
  longer cycles to force `card(A) ≤ 9` — COLLAPSES-TO-(Q). Two independent reads
  concur (math-consultant + math-prover, 2026-06-27). The pigeonhole functional
  cycle IS a different finiteness mechanism than the monovariant descents (so it
  is not literally a pre-recorded monovariant dead-end), but it is cosmetic at the
  level that closes: (i) the out-edge choice is selection-independent (PROVEN, see
  descent-construction-antecedent-reduction) — it picks *which* `p` is dangerous,
  not *whether* "force a 5th witness onto Circ(p,r)" = (Q) is needed; (ii) the
  extracted cycle lands at L2 (cycle+vesica), SAT (see incompatiblewalk-descent /
  vesica-local-sat), and the only step to a contradiction adds global PerVertexK4
  = L3 = (Q); (iii) Option C "isosceles / repeated-circle counting" is NEW-1 /
  global-isosceles (CLOSED-NEGATIVE, Cluster 1), dominated by Dumitrescu for
  `|S| ≥ 9`; (iv) the *goal* `card(A) ≤ 9` is an upper bound on `n`, which the
  monotone-in-`n` incompatibility provably does not produce (route (e),
  ulane-rethink-wallconserved). **2-cycle `q ⇄ p`:** mutual exact-4 blocking
  PROVABLY forces the vesica `r_p = r_q = dist(p,q)` and equilateral apexes
  `mid(p,q) ± (√3/2)r·n̂`, but that data is vacuous/circular to consume (the apexes
  need not lie in `A`; the equilateral Moser frame is reachable only via U1.3/U2.B
  downstream). The bare-2-cycle strict-convex *non*-realizability (forcing both
  classes into half-circles drives `p`/`q` interior) is the one sub-(Q) morsel —
  but it is CONJECTURED (the 32-pt strict-convex SAT witness shows the general
  fragment is realizable, so it may be perturbation-evadable), covers `k=2` ONLY
  (`k ≥ 3` radii carry no forced equality, hence no vesica), and does not rescue
  the reduction; at most a cheap solver check would settle its label. **Lesson:**
  Adam's crux "no outdegree-one blocker graph with exact-four critical circles for
  `n > 9`" is (Q) re-packaged as a graph-non-existence claim, at the same
  tractability bar as the support-confinement theorem; do not re-propose the
  blocker-digraph as a distinct cardinality route.
- **angle2-firewall-curve-identity:** searching for a curve-identity generalizing the
  parabola's Angle-2 telescoping firewall is a no-go — firewall curves are exactly
  parabolas (the deg-4 "4-star = full root set" coincidence is essential), and
  radius-free data is per-edge / directional while per-vertex weights are
  radius-coupled (two disjoint dead sectors: no quantity is simultaneously per-vertex
  AND radius-free). Even a hypothetical general analogue yields only a *firewall*
  ("no all-4-regular config"), never the removable-vertex step RVoL needs (= (Q)).
  **Lesson:** any identity-hunt candidate must be simultaneously per-vertex and
  radius-free or it falls into a dead sector; firewall methods do not reach
  removability.
- **u2-oppcap2-escape-rvol-vocabulary (attic, 2026-07-06, Adam decision):** the
  rvol-era escape-branch bundle (`SurplusEscapeExcludedAtOppApex1`, sorried
  leaves `oppCap2_endpointEscape_false` + `surplusEscape_pinnedFamily_sep_false`,
  and their discharge chain up to `noStrictAdjacentEscapeAtOppApex1_reduction`)
  is moved whole-file to `attic/U2OppCap2Escape.lean` — off the publish spine
  (kernel-verified: zero external references; `U1LargeCapRouteBTail` re-derives
  its own `oppCap2_escape_gen` and keeps the transitive imports via
  `U2NonSurplusOneHit` + `U2.WitnessReflectionKernel` directly). The two
  residual STATEMENTS remain mathematically open in that vocabulary; the live
  route is the four-point plan's re-derivation as
  `EndpointEscapeRightAt`/`EndpointEscapeLeftAt` in `SurplusCapPacket`
  vocabulary (endpoint case = finite, certificate-shaped, 117 endpoint
  patterns; pinned-family case = 4-point exact-radius kill). Analysis:
  `docs/u-lane/97-u2b-surplus-escape-branch-analysis-2026-07-01.md`.
  **Lesson:** do not resurrect the attic statements as live obligations; if the
  endpoint-escape content is needed, derive it in packet vocabulary on-spine.
- **doubleapex-card12up-uniform-pattern-lemma (falsified, 2026-07-06):** the
  uniform ideal-theoretic lemma for the |A| ≥ 12 DoubleApex residual — "every
  admissible double-apex constraint pattern (C1 exact-4 classes, C2, C4, H1,
  caps ≥ 4 with two ≥ 5) of order n ≥ 12 is ℂ-dead under
  equality-plus-separator saturation" — is FALSE at every separator level for
  n ≥ 15. Explicit falsifiers (independently verified, exact-integer /
  50-digit; `scratch/d3-formulation/`): W15 = 15-point triangular-lattice
  subset (census-H1) kills the Δ-saturated census-level statement; two
  concentric-regular-octagon configurations (n=16, b = cos(kπ/8)+√(cos²+1))
  and the decagon pair with b = 1/φ (n=20) are general-position, full-H1,
  fully-exact-4 and kill every leaf-extractable strengthening (+ full H1,
  + noncollinearity Γ, + exactness E) simultaneously. Consequence: the
  per-pattern certificate bank/covering (the census-fallback shape) also
  cannot close the n ≥ 15 tail — the admissible pattern family contains
  ℝ-realizable members, so no dead-pattern bank covers it; any uniform-in-n
  pattern-level statement dies regardless of proof technology (Wu/Chou,
  characteristic sets, resultants, syzygies). All witnesses are NON-convex
  (rings: inner ring strictly inside the outer polygon's inscribed circle;
  lattices: interior points) — the Lean leaf itself (ConvexIndep) is
  untouched; the tail's mathematical content is exactly the convex-position
  coupling, per (Q)-flavor. Still open/supported: the n ∈ {12,13,14} head
  (4460/4460 sampled patterns dead across seven cap profiles, kills localize
  to ≤ 8-point windows) and the row-decorated remnant (Candidate B,
  embedding test pending). **Lesson:** any future uniform |A| ≥ 12 proposal
  must kill the banked falsifiers (W15 + the two-ring family,
  `scratch/d3-formulation/t9_wit_*.json`) before dispatch; convexity-free
  pattern abstractions cannot close the tail.
