# Math-professor analysis: the aggregate-occurrence frontier (2026-07-24)

Verbatim report of the background math-professor agent dispatched 2026-07-23
on the global aggregate occurrence theorem for
`Problem97.ATailFrontierLiveClosure.false_of_frontierLargeOppositeCapsBiApexRobustResidual`.
Probe scripts preserved in this directory (`cover14.py`,
`cover14_metric.py`, `cover14_metric_big.py`, `check14.py`); its CEGAR core
bank snapshot at `cover14-cores.snapshot-2026-07-24.txt` (the live bank at
`/tmp/cover14-cores.txt` was still accumulating past 590 cores, zero
survivors, when snapshotted at 588).

Claim-status labels below are the professor's own (PROVEN / PROVEN-shape /
EMPIRICALLY VERIFIED / CONJECTURED / OPEN) and have not been independently
re-audited except where this lane's own artifacts corroborate them
(oracle cross-validation in `metric_oracle.py --self-test`; the lcap14
CEGAR loop reproducing the metric-infeasibility picture on the full
production surface).

---

# Analysis: the aggregate-occurrence frontier of `false_of_frontierLargeOppositeCapsBiApexRobustResidual`

Scope: read-only analysis plus scratch computation. No production file was touched, no `sorry` is closed. Scratch artifacts (session scratchpad, not deliverables): `/private/tmp/claude-1000/-Users-adam-projects-math-projects-erdos-97-96-formalization/d4fa82b5-5541-499b-a62a-7f77e86add50/scratchpad/{cover14.py, cover14_metric.py, cover14_metric_big.py, check14.py}`, core bank at `/tmp/cover14-cores.txt`, CEGAR log at `.../tasks/br5sgzmur.output` (still accumulating at submission time).

Preflight per instructions: read the three `cardge14-*` REPORTs, `docs/front-a-biapex-robust-closure-prompt-response-2026-07-20.md`, the 2026-07-21 exact-five audits, the 2026-07-23 handoff; checked the four mining registries and `nthdegree docs search --lean` for shell-cover consumers. **No carrier-wide shell-cover consumer exists in any bank** — the only "cover" hits are the apex radius-class localization lemmas (`oppApex1_exactRadiusClass_cover`, per-point K4 covers in the N-step), which are inputs here, not the aggregate.

## 0. Notation

A ⊆ ℝ², n = |A| ≥ 14, strictly convex position, cyclic boundary order. Caps: S (surplus, endpoints O₁,O₂), C₁ (endpoints O₂,P, opposite vertex O₁), C₂ (endpoints P,O₁, opposite vertex O₂); |S|+|C₁|+|C₂| = n+3; L-branch gives |S| ≥ 5, |C₁| ≥ 6, |C₂| ≥ 6. **At n = 14 the profile is exactly (5,6,6)** [PROVEN, arithmetic from the cap-sum identity]. For y ∈ A and r > 0, the complete class is Cl(y,r) = {x ∈ A : d(y,x) = r}. "K4 at y" = some r > 0 with |Cl(y,r)| ≥ 4. Robust(y) = `FullyDeletionRobustAt`; its negation on carrier points is `HasCriticalDeletionAt` [PROVEN equivalence, `DeletionRobustness.lean`].

Define the **witness-destruction relation** W ⊆ A × A: y ∈ W(x) iff K4 fails at y in A∖{x}.

## 1. The W-relation: complete rigid structure (Task 4 core; all PROVEN)

**Lemma A (critical-center rigidity — Lemma 1 of the 2026-07-20 doc, generalized off the H-image).** If y ∈ W(x) for some x, then y has a *unique* K4-capable radius r_y; E_y := Cl(y,r_y) has exactly 4 points; x ∈ E_y; and W⁻¹(y) = E_y exactly.
*Proof.* Any class of size ≥4 at y avoiding x survives deleting x, so every K4-class at y contains x; distinct radii classes at one center are disjoint (each point has one distance to y), so the radius is unique and equals d(y,x); size ≥5 would survive the deletion; conversely deleting any x′ ∈ E_y leaves 3 at r_y and ≤3 elsewhere. ∎
This settles the task's flagged case: *two 4-classes through x at y is impossible* — distinct-radius classes at one center cannot share x. The production proof at blocker centers (`selectedFourClass_support_eq_shell`, `source_mem_selectedFourClass`) is verbatim this argument; only the packaging at arbitrary critical centers is new.

**Lemma B (taxonomy).** Every y ∈ A is exactly one of:
- **Robust**: ⟺ (∃ class ≥5) ∨ (∃ two distinct K4 radii, automatically disjoint) ⟺ W⁻¹(y) = ∅ ⟺ y is outside the image of *every* legal `CriticalShellSystem` [`FullyDeletionRobustAt.centerAt_ne`].
- **Non-robust (NR)**: unique K4 radius, |E_y| = 4, W⁻¹(y) = E_y, and y is a *latent blocker for exactly the 4 members of E_y* — a legal H choosing y for any x ∈ E_y exists (production rebase ladder).
Sufficiency directions are production Lean; necessity is Lemma A. O₁, O₂ ∈ Robust (B-fields); every other point is a priori free.

**Theorem C (minimality shell cover).** D.Minimal ⟹ W(x) ≠ ∅ for every x (this is exactly no-removable-vertex), hence

  **A = ⋃_{y ∈ NR} E_y**, |NR| ≥ ⌈n/4⌉, and Σ_{x∈A} |W(x)| = 4·|NR|.

In particular the robust Moser vertices O₁, O₂ (and P if robust) each lie **on the exact critical 4-shell of some non-robust center**. Every legal H is precisely a selector of W; fibers H⁻¹(y) ⊆ E_y. [PROVEN: chain of `not_isRemovableVertex_of_minimal` → `exists_criticalSelectedFourClass_of_minimal` + Lemma A. The *cover packaging* is new; no bank consumer exists for it.]

**Answer to Task 4's central question.** The "simultaneous escape over all n deletions" *is* the W-relation, and its full content is Theorem C. Pigeonhole on it alone does **not** force a positive cross-incidence: I verified this computationally (§5) — there is a card-14 structure satisfying the cover, fibers, apex robustness, interleaving, one-hit, and the frontier-pair fields, with no distinct row through any repeated-fiber pair and no ordered pattern. The cover becomes contradictory only jointly with the metric layer. This confirms the audits' negative results while locating exactly what survives them.

## 2. Task 1: functional graph, counting, and where convex position bites

PROVEN inventory: H : A → NR total, fixed-point-free, im(H) ∌ O₁,O₂; fibers ⊆ E_b so |im(H)| ≥ ⌈n/4⌉ = 4 at n = 14; H restricted to NR is total, so cycles of length ≥ 2 exist (`exists_blocker_cycle`); along a cycle b₁→…→b_k→b₁, d(b_i,b_{i+1}) = r_{b_{i+1}}; a 2-cycle forces r_a = r_b = d(a,b). Repeated fibers exist (two omitted values ⟹ excess ≥ 2).

**Quantified counting slack (PROVEN, so do not pursue raw counting).** Convex position gives per-pair capacity: at most 2 carrier centers equidistant from any pair (no-3-collinear on the perpendicular bisector), at most 1 for cyclically adjacent pairs (empty arc side, §3). Refined capacity at n = 14: 14·1 + 77·2 = 168 co-radial pair slots. Demand from the forced structure: 6 per NR center + ≥10 per robust center ≥ 92 (at |R| = 2), ≤ 140 even if all centers were robust. Slack ≥ 28 and generically ≥ 76; for general n capacity grows as n² against demand O(n). **Raw incidence counting can never close this branch, at any n.** The multiplicity count is equally slack: Σ|W(x)| = 4|NR| forces double-covered points at n = 14 (16 > 14) but a perfect 4-shell partition is combinatorially consistent whenever 4 | n. The bite is therefore *not in the counts but in cyclic-order patterns of the forced equalities* — confirmed by §5, where every combinatorial survivor dies on a small metric order-pattern.

## 3. Task 3: the bisector, and the exact status of the same-cap alignment

**Lemma D (interleaving; PROVEN, assembled from production bridges).** If z₁ ≠ z₂ are both equidistant from a pair {u,v} (all four in A), then u,v separate z₁,z₂ in the cyclic order. *Proof:* same-arc order (u,z₁,z₂,v) gives the strict convex-quadrilateral inequality d(u,z₂)+d(z₁,v) > d(u,z₁)+d(z₂,v), i.e. α+β > α+β with α = d(z₁,u) = d(z₁,v), β = d(z₂,u) = d(z₂,v). ∎ (Engine: `dist_add_dist_lt_diagonal_sum_of_ccw` and its complementary form; this is also the content of `outsidePair_unique_capCenter`.) Corollaries: ≤2 equidistant carrier centers per pair, ≤1 per side-arc, ≤1 total for adjacent pairs; and |E_a ∩ E_b| ≤ 2 for distinct NR centers with equality forcing the shared pair to separate a,b.

**Consequence for alignment 1.** A cap containing neither C nor K lies inside one (C,K)-arc; so "A₀ and a second center in one cap, C,K outside" contradicts Lemma D outright. **`SameCapCollisionPairCore` is unrealizable; any derivation of it is a refutation leaf, never an intermediate stage.** The productive residue of Task 3 is the classification of the unique possible second center z for a fiber pair {C,K} at A₀: z is the ≤1 carrier point on the (C,K)-arc opposite A₀, and it is source-faithful only if (i) z ∈ im(H) with {C,K} ⊆ E_z — then E_{A₀} ∩ E_z = {C,K} exactly — or (ii) z = O₁ with d(O₁,C) = d(O₁,K). Critically, **z lying on the bisector does not put {C,K} into z's K4 class**: sub-K4 classes (size 2,3) are free. That freedom is exactly the gap the countermodels exploit, and my card-14 witnesses realize it.

**Useful new PROVEN-shape fact:** if two NR centers in one cap share two shell points, one shared point lies strictly between the centers inside that cap (Lemma D + cap contiguity). This is a genuine localization usable as a leaf-feeder.

## 4. Task 2: center taxonomy and degrees of freedom

Complete classification is Lemma B; there is no third type. A non-robust p need not be in im(H) for the fixed H (im(H) can be as small as 4 of ≥4 NR points), but every NR point is a blocker under some rebased legal H, and every robust point is a blocker under none. Selector freedom = ∏_x |W(x)|, with Σ_x|W(x)| = 4|NR|. Forced rigidity at n = 14 beyond O₁,O₂ (PROVEN, from production one-hit `U2NonSurplusSqueeze`/`CapApexRadiusRigidity` + cap bounds + the retained frontier fields):
- **O₁ dichotomy:** every O₁-class T satisfies |T ∩ I₁| ≥ |T|−2 with |I₁| = 4, so given the frontier pair q,w in a ≥4 O₁-class and double-deletion survival at O₁, O₁ has **either one exact 6-class = I₁ + one S-side + one C₂-side point, or exactly two disjoint exact 4-classes, each 2+1+1**. A 5-class mode is impossible (it would be the unique K4 class, and deleting q,w kills it).
- **O₂ trichotomy:** exact-5 (3+1+1), exact-6 (4+1+1), or two exact-4s (2+2 in I₂).
- **P rigidity:** any P-class has ≤ |I_S|+2 = 5 points with ≥|class|−2 in I_S; P robust ⟹ unique exact 5-class ⊇ I_S; P non-robust ⟹ E_P has ≥2 points of I_S. (Empirically corroborated: the frontier-constrained SAT witness put O₁ in the two-4s mode.)

## 5. Computational results (scratch; all EMPIRICALLY VERIFIED within the stated encodings)

**Probe 1 — combinatorial layer, card 14, profile (5,6,6).** SAT encoding (CaDiCaL) of: per-center equidistance as an equivalence relation; all-center K4 trichotomy; O₁,O₂ robust; NR = complete unique exact-4 class; total fixed-point-free selector H into NR shells (= minimality cover); bisector interleaving (Lemma D); Moser one-hit at all three vertices for both adjacent caps; exclusion of `OrderedCrossRowCore` in both orientations; optionally the frontier pair q,w with both double-deletion witnesses. Smoke tests passed (relaxed system SAT; deliberate contradiction UNSAT). **Result: SAT, including with the frontier fields.** An independent semantic checker (`check14.py`, validating the *intended semantics*, not the clauses — real equivalence classes, taxonomy, cover, capacity, one-hit, pattern absence) passes on the witness. Scope: this is a finite incidence abstraction, not a Euclidean model. **Consequence: no purely combinatorial aggregate theorem exists at card 14, even with the shell cover, interleaving, one-hit, and frontier fields that no prior fixture encoded.** This strictly extends the `cardge14-faithful-carrier-escape-consumer` and Lemma-81-fixture negatives.

**Probe 2 — metric layer (CEGAR).** Each SAT witness's full equality/disequality pattern was tested for a strict-Kalmanson metric: 91 real distance variables, positivity, strict triangles, both strict Kalmanson inequalities for all 1001 cyclic 4-subsets — exactly the metric family production has PROVEN from strict convexity — in Z3 QF_LRA, with unsat-core-guided blocking. **Result: 260 consecutive witnesses metric-infeasible at submission time (0 survivors; loop still running toward budget 1200).** Every unsat core is a pure *equality* pattern on 4–10 support points (3–11 atoms); 184 cores mapped to 158 distinct order-isomorphism schemas; the most frequent are segregated-centers triangle patterns of precisely the `OrderedCrossRowCore` engine shape, e.g. p₀,…,p₄ cyclic with d(p₀,p₃)=d(p₀,p₄), d(p₁,p₀)=d(p₁,p₄), d(p₂,p₀)=d(p₂,p₃) — refuted by the same two production bridge lemmas that power `OrderedCrossRowCore.false`. Scope caveats: SAT side not exhausted; z3 cores are certified only per-witness; the schema bank is diversifying (158/184), so naive CEGAR converges slowly — the industrial pipeline (schema mining → greedy family cover → single UNSAT certificate), i.e. the existing card-11 exact-two architecture, is the right vehicle.

**Interpretation.** The missing aggregate is real and has a definite shape: *combinatorially satisfiable, metrically infeasible, with local refutations*. The Q(√3) regression showed the local layer insufficient without the global fields; these probes show the global fields insufficient without the metric layer; and they show the metric layer needed is (empirically, so far) **only strict Kalmanson on ≤10 cyclically ordered points** — no MEC-disk, no two-circle facts beyond what Kalmanson already implies (I verified Lemma D and the ≤2-circle-intersection bound are strict-Kalmanson-derivable).

## 6. Task 5: precise intermediate lemmas, ranked

**L1 (NR rigidity, general form).** For y with `HasCriticalDeletionAt D y`: unique K4 radius, exact 4-class `E_y`, and `¬HasNEquidistantPointsAt 4 (D.A.erase x) y ↔ x ∈ E_y`. Fields F/R/B/L unused beyond `D`. (a) TRUE: certain. (b) provable now, elementary. (c) consumer distance: base for L2/L5. New Euclidean input: none.

**L2 (shell cover).** `D.Minimal → ∀ x ∈ D.A, ∃ y ∈ D.A, HasCriticalDeletionAt D y ∧ x ∈ E_y` plus the packaging |NR| ≥ ⌈n/4⌉ and O₁,O₂,P ∈ ⋃E_y. (a) certain; (b) now (repackages `exists_criticalSelectedFourClass_of_minimal` through L1); (c) direct.

**L3 (interleaving).** ConvexIndep + both-equidistant ⟹ cyclic separation; corollaries: per-pair capacity 2, adjacent-pair capacity 1, shared-shell localization. (a) certain; (b) now, from `CapCrossingKalmanson` bridges; (c) it is the refutation engine for every same-cap-shaped leaf.

**L4 (card-14 apex modes).** The O₁ dichotomy / O₂ trichotomy / P rigidity of §4 as structures over F/R/B/L at `D.A.card = 14`. (a) certain; (b) now, from production one-hit + cap bounds; (c) prunes the enumeration for L5 massively.

**L5 (the aggregate, card-14 slice) — CONJECTURED, the actual target.** Over F/R/B/L with `D.A.card = 14`: the conjunction {L2 cover + L1 rigidity + taxonomy + H + L3 + one-hit + strict Kalmanson} is infeasible; packaged as production wants it: produce `Nonempty (CriticalFiberClosingCore R)` ∨ alternative `IsM44` (each equivalent to False on this branch — the disjunction is the *proof schema*, a case analysis whose leaves are bank schemas). Evidence: 260/260 metric-infeasible, small cores, uniform engine. (a) plausibly TRUE; (b) provable by the existing certificate pipeline (this is structurally the same job as the fixed-card-11 p4/p5 lanes — SAT layer + Kalmanson-schema clauses → UNSAT → LRAT → Lean; the schema refutations use only already-checked bridge lemmas); (c) one step from checked consumers.
FLAG FOR IMPLEMENTER: (i) rerun/extend the CEGAR loop (spec in `cover14_metric_big.py`: SAT layer as in `cover14.py`; metric layer = QF_LRA strict Kalmanson; blocking = z3 unsat cores) to SAT-side exhaustion or a metric survivor; (ii) if exhausted, industrialize: enumerate bounded-support equality patterns, LP-decide each once, emit schema clauses, one global CNF, `drat-trim`, kernel bridge — reusing the unique4-exact-two architecture verbatim.

**L6 (general-n reduction) — OPEN.** The branch is unbounded in n. The bank schemas themselves are cardinality-free (k ≤ ~10 cyclically ordered points; general-n Lean lemmas of existing consumer style). What does not transport is the covering claim "every card-n cover structure contains a bank instance" — at 14 it is the finite certificate; for general n it is genuine combinatorics (pigeonhole on the cover against the order patterns). Do not conflate the two: this mirrors the known schema-transport failure at cards 12/13, and any card-14 closure must be reported as the n = 14 slice only.

**Deprioritized (with reasons, not difficulty):** raw counting (PROVEN slack, §2); the (m,4,4) retriangulation route (needs extra carrier points on the MEC circle — a measure-zero stratum with no leverage from the cover; the Q(√3) model realizes its genuine absence); any route through a robust second center (wrong polarity, PROVEN); iterated one-point escapes (reconfirmed: my witnesses satisfy the escape data with no coupling).

## 7. What next, ranked

1. Land L1–L4 as production Lean (all PROVEN-shape, elementary from existing machinery) — they are the vocabulary of any aggregate.
2. Run L5's decision computation to an answer (FLAG FOR IMPLEMENTER above). A metric survivor would be the sharpest countermodel yet and would name the missing Euclidean fact beyond Kalmanson; exhaustion yields the n = 14 closure path via the house pipeline.
3. Mine the recurring core schemas for the human argument (the dominant segregated-centers triangle is the visible candidate) — that, not the certificate, is the route to L6's general-n covering lemma.

Everything above the empirical section is PROVEN or PROVEN-shape as labeled; §5 is EMPIRICALLY VERIFIED exactly within the stated encodings and budgets; L5 is CONJECTURED; L6 is OPEN. The background loop (`br5sgzmur`) continues past 260 iterations and its final tally will be in the task output file and `/tmp/cover14-cores.txt`.
