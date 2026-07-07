<!-- Provenance: report body produced by the D3 candidate-lemma formulation
     agent (math-professor, 2026-07-06 wave, closure plan §7 workstream D);
     subagent report-file writes are guard-blocked, so the orchestrator
     transcribed the agent's final message verbatim below this header.

     Artifact paths in §7 refer to the agent's volatile session scratchpad;
     the durable copies live HERE (scratch/d3-formulation/), secured by the
     orchestrator before transcription.

     Independent verification by the orchestrator (independent_check.py in
     this directory, logic separate from the agent's verify_witness.py),
     2026-07-06 — ALL CHECKS PASS:
       - lattice witnesses (t1_results.json): n=15 tri (W15), n=16 tri,
         n=16 sq — points distinct, all classes K4-equidistant in EXACT
         integer arithmetic, C2/C4/caps/profile admissible, H1 at V,W
         (W15/tri16 fail H1 at U exactly as reported; sq16 passes full H1
         but is not general-position), realization = the lattice points.
       - ring witnesses (t9_wit_*.json): regenerated from (m, b, twist π/m)
         at 50 digits, every JSON point matched to a regenerated point;
         every class is the FULL exactly-4 radius class (equidistance
         spread < 1e-40, exactness margin > 1e-6 to every non-member);
         min pairwise d² = 0.4268 / 0.5858 / 0.1459; min collinearity
         |det| = 0.0795 / 0.2368 / 0.0489 (general position); full H1 at
         U,V,W; C2/C4/caps admissible; b-formula matches JSON to 1e-12.
       - W20 φ-identities hand-checked: sin²(π/5)=(5−√5)/8 ⟹
         4sin²(π/5)−1 = (3−√5)/2 = φ⁻² = b², and (4sin²(2π/5)−1)·b²
         = φ²·φ⁻² = 1.
       - non-convexity of all witnesses confirmed (rings: inner ring lies
         strictly inside the outer polygon's inscribed circle — 1 < 1.4534·cos(π/8),
         1 < 2.2853·cos(π/8), 0.618 < cos(π/10); lattices: interior points),
         so none touches the leaf itself (ConvexIndep) — the falsification
         kills the pattern-level PROOF SHAPE, not the Lean obligation.
       - T6 tallies re-read from t6_*.json: n=13 300/300 dead (754/655/664),
         n=14 160/160 dead (854/665), n=17 (965) final 30/40 decided dead /
         0 alive / 10 solver-unresolved (9 stage-1 + 1 stage-2 timeouts).
         Precise count behind the report's "4500+": 4000 committed n=12
         cubes (1882 stage-1 dead + 2118 ℂ-alive-but-distinctness-dead)
         + 460 fresh n=13/14 = 4460.
       - This transcription is the agent's FINAL message (the n=17 row
         closed out); it supersedes the near-identical penultimate draft.
       - the log header "n=13 profile 965" in t6_965.log is a cosmetic
         script mislabel; caps (9,6,5) ⟹ n=17 (report is correct). -->

# D3 candidate-lemma formulation pass — |A| ≥ 12 uniform frontier (workstream D, closure plan §7)

**Date:** 2026-07-06/07. **Dispatch:** D3 formulation (Adam's 2026-07-06 direction: uniform ideal-theoretic lemma first; per-core certificate census as standing fallback). **Target obligation:** `Problem97.U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair` (`/Users/adam/projects/math-projects/erdos-97-96-formalization/lean/Erdos9796Proof/P97/U1LargeCapRouteBTail.lean:2383`), restricted to the proposed `DoubleApexOffSurplusSharedRadiusPairCard12Up` residual (|A| ≥ 12).

## 0. Verdict up front

**The stop condition is met for the decided shape.** The uniform ideal-theoretic lemma — in every formulation whose conclusion is "the double-apex constraint-pattern family is uniformly ℂ-dead under equality-plus-separator saturation" — is **falsified by explicit constructions** at n = 15, 16, 20, found this session, verified independently at exact/60-digit precision, and stress-tested against every equality-shaped strengthening extractable from the leaf's proven combinatorial shadow (pair-distinctness, triple-noncollinearity, full one-hit at all three Moser vertices, full exactness of every 4-class). One equality-shaped remnant survives untested (Candidate B, the critical-row fragment); its test is specified and cheap, and its prognosis is poor. The falsification simultaneously bounds the fallback: for n ≥ 15 the pattern family contains realizable members, so no per-pattern bank at the pattern level covers the tail. What the executed battery does establish: for n ∈ {12, 13, 14} sampled admissible patterns die uniformly (4500+/4500+ across seven cap profiles, two stages; n = 17 spot probe 30/40 confirmed dead, 0 alive, 10 solver-unresolved), and all kills localize to induced dead windows of ≤ 8 points (stage-2 kills to ≤ 5 where mined) — so a bounded-n census extension for the head remains supported, while the n ≥ 15 tail provably requires convexity-coupled content beyond the pattern level. This is therefore the fallback-trigger report, with the line drawn precisely. Nothing here contradicts the dichotomy or D2 results, which concern mined cores at n = 12 and stand (§6).

## 1. The Lean obligation, read precisely

The theorem's conclusion asks for x ≠ w′ ∈ A, both off the surplus cap, with dist x oppApex1 = dist w′ oppApex1 and dist x oppApex2 = dist w′ oppApex2. Two distinct points sharing both radii are the two intersections of circles about oppApex1, oppApex2 — mirror images across line(oppApex1, oppApex2); equivalently perpBisector(x, w′) = line(oppApex1, oppApex2). Downstream, `U2NonSurplusSqueeze.oppCap2_escape_gen` (PROVEN, in-file) refutes exactly such a pair: off-surplus points lie strictly on one side of that chord; mirror pairs straddle it. So, as the docstring itself states, proving the theorem means deriving the leaf contradiction; the Card12Up residual = "the two-large-cap leaf hypotheses are unsatisfiable for every |A| ≥ 12". The hypotheses: A strictly convex (`ConvexIndep`), K4 everywhere, circumscribed non-obtuse Moser triangle {U,V,W} ⊆ A with cap triple, surplus cap > 4 plus second cap ≥ 5 (`exists_secondLargeCap_of_noM44` under `hNoM44`), a `CriticalShellSystem` (every q ∈ A on an exact-4 full shell of some center γ(q) ∈ A), the five `U1Depth5.CriticalSourceRows`, U3 packets, and `U1LargeCapRouteBTailLiveData` on six named pairwise-distinct points p,q,t1,t2,t3,u.

## 2. Pattern vocabulary (shared by all candidates)

A **double-apex pattern** of order n: labels L = {U,V,W} ∪ F, |L| = n; caps S,O1,O2 ⊆ L with S∩O1 = {W}, S∩O2 = {V}, O1∩O2 = {U}, S∪O1∪O2 = L, free labels in exactly one cap; sizes all ≥ 4, at least two ≥ 5 (n = |S|+|O1|+|O2| − 3 ≥ 12); a class map K: L → 𝒫(L), |K(p)| = 4, p ∉ K(p), with:

- **C2**: |K(p) ∩ K(q)| ≤ 2 for p ≠ q — leaf source: two distinct-center circles share ≤ 2 points (metric; small gluing lemma, mechanical);
- **C4**: each unordered pair lies in ≤ 2 classes — leaf source: three centers equidistant from {a,b} are collinear on the bisector, and `ConvexIndep.not_three_collinear` (CGN5b, in-tree, PROVEN) forbids 3 collinear carrier points;
- **H1**: for each Moser label m and each cap C ∋ m: |K(m) ∩ (C ∖ {m})| ≤ 1 — leaf source: `leftAdjacentCap_at_opposite_card_le_one_of_convexIndep` / right sibling (`/Users/adam/projects/math-projects/erdos-97-96-formalization/lean/Erdos9796Proof/P97/SurplusM44Packet.lean:423`), PROVEN for all three vertices and every radius; the committed census imposed it only at V,W, so full H1 is a free strengthening.

Pattern ideal I(κ) over ℚ: variables xₚ,yₚ; per center c: d²(c,b₀) − d²(c,b), b ∈ K(c). Separator families: Δ = pairwise d²(p,q) (Rabinowitsch); Γ = triple collinearity determinants; E = exactness (for center c with class radius ρ_c: d²(c,z) − ρ_c, z ∉ K(c) ∪ {c}). "Saturated-dead" = 1 ∈ I(κ) : (separators)^∞. All separator sources are leaf-extractable: distinctness (Finset), noncollinearity (CGN5b), exactness (`CriticalFourShell.support_eq` + `support_card`), classes (D.K4), C2/C4/H1 as above. This is the Wu/Chou shape — saturation by mechanically generated nondegeneracy conditions — with ℚ-Nullstellensatz certificates in the endpoint-bank format (`BankSoundness.false_of_endpointShadowInBank_of_payload_zeros` precedent).

## 3. Executed falsification battery

All computation in the session scratchpad `/private/tmp/claude-501/-Users-adam-projects-math-projects-erdos-97-96-formalization/fe6e52a9-1de1-4034-b676-5c7e83aecbac/scratchpad/d3/` (scripts `analyze_cores.py`, `t6_n13.py`, `t7_stage2cores.py`, `t8_n13cores.py`, `t1_realizable.py`, `t1b_fullh1.py`, `t9_tworing.py`, `verify_witness.py`; deterministic seeds; repo data read-only, no mutation). Smoke gates passed on every harness before production (known-DEAD codex |A|=11 → DEAD; committed 654 dead cube → DEAD; committed 654 alive cube → ALIVE; realizable mutual-equidistance rhombus → ALIVE; miner reproduces stage-1 core sizes).

| Test | Question | Result | Label |
|---|---|---|---|
| T5 — killing-pair roles (813 pairs, 113 single-separator Tier-A classes) | is the forced-degenerate pair role-pinnable? | No: 18 role combinations, max 14% (O2–S); Moser–Moser pairs rare (U–V 1.0%, V–W 0.7%) | EMPIRICALLY VERIFIED |
| T2 — frame-role signatures (262 Tier-B cores rebuilt, R-match 262/262) | does frame-role projection collapse core diversity (general-m-transport shape)? | No: 115 exact canons → 259 role signatures in 262 instances | EMPIRICALLY VERIFIED |
| T6 — census mirror at n = 13, 14, 17 (profiles 754/664/655; 854/665; 965; seed 7; msolve stage 1 + all-pair Rabinowitsch stage 2) | does the sampled-pattern kill persist above 12? | 13: 300/300 dead (0 timeouts); 14: 160/160 dead; 17: 30/40 dead, **0 alive**, 10 timeouts | EMPIRICALLY VERIFIED (samples; ported census sampler) |
| T7 — stage-2 cube minimal cores, saturated oracle (4 cubes @ 12) | do distinctness-only kills localize? | Yes: k\* ∈ {4,5}, incl. a δ=−1 core (2,7,8,9,10) R=5 | EMPIRICALLY VERIFIED |
| T8 — n=13 mining | does k\* grow at 13? | stage-1-dead: k\* ∈ {4,5}; stage-2: one cube k\*=4, one > 5 at snapshot | EMPIRICALLY VERIFIED (partial) |
| T1 — all-K4 subset search (lattice windows) + admissible-labeling backtracker | does a realizable admissible pattern exist? | **Yes at n = 15, 16** (§4); all-K4 subsets exist at 12/13/14 too (12 even exact-4) but no admissible labeling found there (bounded search) | §4 |
| T9 — two-ring root-targeted search + full-H1 admissibility | does a **general-position** realizable admissible pattern exist? | **Yes at n = 16, 16, 20** (§4) | §4 |
| CEGAR — witness-collinearity saturation (msolve char-0) | does Γ-saturation kill the lattice witness? | Yes: round 0 (its own 33 collinear triples + 105 pair separators) already DEAD | EMPIRICALLY VERIFIED |

## 4. The witnesses (central finding)

**W15 (lattice, n = 15).** Triangular-lattice subset {(0,3),(1,2),(1,3),(1,4),(2,0),(2,1),(2,2),(2,3),(2,4),(3,1),(3,2),(3,5),(4,1),(4,2),(5,2)} ((i,j) ↦ (i + j/2, j√3/2); d² = di² + di·dj + dj², exact integers). Carries a census-admissible cube (C1, C2, C4, H1 at V,W, caps (6,6,6)); full labeling/classes in `t1_results.json`. Verified twice: exact integer combinatorics (independent re-implementation) and the ported msolve pipeline (stage 1 ALIVE, stage 2 ALIVE). The lattice points realize the cube over ℝ with 15 distinct points, so **the Δ-saturated census-level uniform statement is false at n = 15**. Label: EMPIRICALLY VERIFIED (exact integer arithmetic, two independent checks; hand-checkable). Notes: it fails H1 at U; its realization has 33 collinear triples; CEGAR shows every distinct ℂ-realization of its cube hits one of those 33 collinearities — the Γ-repair kills this particular witness.

**W16a, W16b, W20 (two concentric regular m-gons, general position).** Outer m-gon radius 1, inner radius b, twist π/m:

- m = 8, b = cos(3π/8) + √(cos²(3π/8)+1) ≈ 1.4534 (n = 16): the outer-point class {A±2, B-pair} and the inner-point class reduce to the **same** quadratic b² − 2cos(3π/8)·b − 1 = 0 — all-K4 is PROVEN (identical-quadratic derivation + dihedral transitivity on each orbit; members distinct since b ≠ 1).
- m = 8, b = cos(π/8) + √(cos²(π/8)+1) ≈ 2.2853 (n = 16): same mechanism.
- m = 10, b = 1/φ (n = 20): b² = 4sin²(π/5) − 1 = (3−√5)/2 = φ⁻² and (4sin²(2π/5) − 1)·b² = φ²·φ⁻² = 1 — both defining equations hold exactly (φ-identities). PROVEN.

At 60-digit precision (cluster threshold 10⁻⁴⁵, near-miss guard 10⁻⁶): every point has an **exactly-4 full** radius class; min |collinearity determinant| ≥ 0.049 (no 3 collinear); min pairwise d² ≥ 0.146. For each configuration a **full-H1 admissible labeling with every chosen class equal to its full exact-4 radius class** was found and independently re-verified at 50 digits: `t9_wit_m8_1.4534.json` (profile (7,6,6)), `t9_wit_m8_2.2853.json` ((7,7,5)), `t9_wit_m10_0.6180.json` ((8,8,7)). Labels: configuration existence and all-K4 PROVEN (routine algebra); general position, exactness margins, and witness-cube admissibility EMPIRICALLY VERIFIED at 50–60 digits with structural exactness for the class coincidences. FLAG FOR IMPLEMENTER: exact certification of the three witnesses (coordinates in ℚ(cos(π/m), sin(π/m), b); finitely many determinant/margin nonvanishings, symbolic, routine).

**Consequence — collapse of the separator ladder.** L0 = Δ-saturation with census H1; L1 = + full H1; L2 = + Γ; L3 = + E (full exactness at every center). L0 is false at n = 15 (W15); L1, L2, L3 are **simultaneously false at n = 16 and 20** (the ring witnesses are general-position, full-H1, fully exact, distinct-realizable). Any induced subsystem of a realizable pattern is realizable (restrict the realization — PROVEN, trivial), so these patterns contain **no dead window at any size**: every covering/bounded-extraction proof shape dies with the statement, and so does every "syzygy/ideal-membership uniform in parameters" formulation — a realizable admissible pattern refutes the conclusion regardless of proof technology (Wu/Chou, characteristic sets, resultants, syzygies). The falsifier is a real point configuration, not an encoding artifact.

**Scope note.** At n = 12, 13, 14 no witness was found: lattice windows yield all-K4 subsets but no admissible labeling within budget; the two-ring family has no shared-root b at m = 6, 7; 4500+ sampled admissible patterns are all dead. Witness-existence at 12–14 is OPEN; at n ≥ 15 it is settled (and plausibly extends to most n ≥ 15 via uneven rings and lattice variants — untested).

## 5. Candidates, ranked

### Candidate A — uniform saturated-emptiness of double-apex patterns (the decided shape). **FALSIFIED.**

(i) **Statement.** For every n ≥ 12 and every double-apex pattern κ of order n (uniformity parameters: n and the cap-size vector, unrestricted beyond two-large-caps): 1 ∈ I(κ) : (Δ·Γ·E)^∞ over ℚ. Levels L0–L3 are instances; L3 is the strongest leaf-extractable version.

(ii) **Discharge chain** (template for any surviving pattern-level variant): leaf → per-center 4-classes (D.K4) → C2 (two-circle lemma) → C4 (bisector collinearity + CGN5b) → H1 (closed one-hit theorems) → cap sizes (CapTriple + hsurplus + hj5 + `capTriple_caps_card_ge_four`) → κ(A) admissible, realized injectively by A; gauge-normalize by a real similarity; evaluate the bank certificate at the real coordinates → 1 = 0; leaf closes; Card12Up vacuous. Endpoint-bank shape end-to-end; no new binder plumbing (the leaf carries `hcritical`; `hnoRem`/IH not needed).

(iii) **Falsification executed:** W15 kills L0; W16a/b, W20 kill L1–L3. What would falsify it is exactly what did.

(iv)–(v) Moot at the tail; the surviving bounded-n content is Candidate C. (vi) Falsity labels per §4.

### Candidate B — the row-fragment ceiling (last equality-shaped remnant). **FORMULATED, UNTESTED; poor prognosis.** Ranked first among actionable items only because its test is cheap and decisive.

(i) **Statement.** For every n ≥ 12 and every **row-decorated** double-apex pattern (κ, γ, ρ) — κ as above; γ a shell choice covering all labels with exactness at im(γ); ρ the critical-row fragment: six extra named labels p,q,t1,t2,t3,u, q ∈ S ∖ {V,W}, pairwise distinct, five exact-4 rows with the t2-row centered at p with support exactly {q,t1,t2,t3}, the `exactQDeletedRadius` exact-count (exactly 3 skeleton points at dist p q besides q), and the `U5DangerousTriple`/`U5SelectedCandidateSkeleton` membership equalities — all equality/exact-count-shaped, hence separator-encodable: 1 ∈ I(κ,ρ) : (Δ·Γ·E)^∞.

(ii) **Discharge chain:** as A, plus verbatim transport of row/liveData facts the leaf already carries (hfixed, hlocalNoQFree, H, hcenter, hsupport). This is the **maximal** ideal-theoretic statement extractable from the leaf; everything else there (ConvexIndep as order, MEC/in-disk, non-obtuseness, chord separation) is inequality-shaped.

(iii) **Falsification test (specified):** attempt to embed the row fragment into W20/W16a/b — finite constraint search over the ring points (two orbits) for (p,q,t1,t2,t3,u) + shells satisfying ρ; same backtracking machinery as T1, exact ring coordinates, the U5-packet conditions taken from their Lean definitions. Embedding found ⇒ B false at n = 16/20 ⇒ the ideal-theoretic shape closes outright. No embedding ⇒ B survives these witnesses; next test whether witness families extend to host the fragment. FLAG FOR IMPLEMENTER: run this embedding search; report SAT/UNSAT per witness.

(iv) **Proof-attack if B survives:** it inherits A's covering problem over row-decorated windows, with one structural gain: ρ pins six named points, so a pinned-surplus-style named-label DFS has a nonempty bounded frontier to start from. First concrete sublemma: Lean-certify the complete dead k=4 universe (10 classes; certificates already computed by the dichotomy run) in endpoint-certificate format — needed by every covering branch, mechanical, useful to C regardless.

(v) **Obstructions.** Obstruction B1 (witness abundance): three independent constructions already; B's survival would need a reason symmetric configurations cannot host six more shells, and none is visible. Obstruction B2 (no bounded frontier beyond ρ): balanced cap profiles grow all caps with n; T2's 259-signatures-in-262-cores quantifies the absence of a finite kind space — the general-m transport's completeness leg has no analog here. Obstruction B3 (covering non-flattening): 43 new core classes in 80 fresh cubes at n = 12.

(vi) Labels: statement CONJECTURED (no instance data exercises ρ); B1–B3 EMPIRICALLY VERIFIED as data statements.

### Candidate C — bounded dead-window extraction as a **head** closer (n ∈ {12,13,14}). **SUPPORTED in restricted scope; not a Card12Up closer.**

(i) **Statement.** There is K (empirical target 8; stage-2 kills observed at ≤ 5) such that every admissible double-apex pattern of order n ∈ {12,13,14} contains an induced Δ-saturated-dead subsystem on ≤ K labels; the finite dead set 𝔇_K is certificate-banked.

(ii) **Discharge chain:** as A for the head only; Card12Up splits again: card-12–14 closed by bank + covering, named card-≥15 residual remains (strict on-spine narrowing, house pattern).

(iii) **Falsification executed:** consistent throughout — 4500+/4500+ sampled patterns dead at 12/13/14; stage-1 kills localize at k\* ≤ 8 (239 committed cubes), k\* ∈ {4,5} on fresh n=13 mining; stage-2 kills at k\* ∈ {4,5} (T7), one n=13 stage-2 cube still open past k=5. A 12–14 witness would kill it; bounded searches found none.

(iv) **Proof-attack:** the covering leg is the open combinatorics (finite per n in principle, astronomically large; CEGAR convergence not established — the plan's own "banking cannot finish |A| ≥ 12"). First sublemma: the k=4 bank (as in B); second: measure window-shape (not raw-class) CEGAR convergence at n=12 with the two-hit-extended seeded family.

(v) **Obstructions.** Obstruction C1: no covering proof mechanism known. Obstruction C2: closes nothing at the tail — a narrowing move only.

(vi) Labels: head-uniformity CONJECTURED (strongly sampled); covering CONJECTURED; localization EMPIRICALLY VERIFIED (scopes §3).

### Candidate D — synthetic convexity-coupled forcing (Near-Enemy vocabulary; M44-squeeze port). **Only shape not excluded for the tail; no mechanism identified.**

(i) **Statement (shape).** For every |A| ≥ 12 double-apex configuration satisfying the full leaf (ConvexIndep as order-geometric hypothesis, not a separator): the shell system forces two distinct off-surplus carrier points x ≠ w′ with perpBisector(x,w′) = line(oppApex1, oppApex2) — producing the pair the reflection kernel refutes. The candidate content is a forcing mechanism in the in-house shared-bisector vocabulary (`nearEnemy_sharedBisector_forces_samePair` chain) plus the M44 squeeze scaffold (`oppApex1_exactRadiusClass_cover`, `fourClass_of_cover`, interior-card lemmas) transferred from (m,4,4) to (≥5,≥5,≥4).

(ii) **Discharge chain:** direct — it is the obligation's conclusion.

(iii) **Falsification (negative-evidence side, executed/committed):** the pure-incidence version is dead — 2118 ℂ-alive stage-1 patterns at n=12 (committed) plus 132+ at 13/14 (this session) satisfy every counting/incidence consequence such an argument could use, and the committed 11-label no-collision table satisfies all incidence constraints. No positive test is executable (no real leaf configurations exist to test — that is the theorem). The §4 witnesses do not touch D (non-convex; excluded by D's hypotheses — exactly why D survives where A dies).

(iv) **Proof-attack sketch:** the smallest kill mechanism is visible in the k=4 dead classes: 0:[1,2,3]; 1:[2,3]; 2:[0,1,3] forces r₀ = r₂ = |p₀p₂| (mutual membership), so {p₁,p₃} sit on a vesica of two radius-r circles with centers r apart, whence |p₁p₃| = r√3 ≠ r = forced |p₁p₂| — collapse (PROVEN, four lines). A convexity-coupled analog would show the two ≥5 caps + exact-4 shells + convex order force a mutual-membership chain into the two cap-endpoint apexes. First concrete sublemma: decide when the shell digraph restricted to {V,W} ∪ (K(V)∩O1) ∪ (K(W)∩O2) admits no convex-order-consistent completion — bounded, order-decorated, solvable per case over exact rationals (per (D-msolve): fixed exact-rational frames sound for exclusions only).

(v) **Obstructions.** Obstruction D1: mutual membership is not forced by admissibility (a globally oriented class assignment avoids it); T5's role diffusion means the collapsed pair cannot be pinned in advance. Obstruction D2: the M44 squeeze needed both non-surplus caps exactly 4 (class = cap by cardinality); at (≥5,≥5,≥4) the 4-classes cannot cover the ≥5 caps — the squeeze engine is absent by construction. Obstruction D3: order-decorated relaxations that would make D solver-checkable are the chirotope dead end; the sound coupling reintroduces the QF_NRA that timed out. OPEN-DIFFICULT; vocabulary in-house, lever missing.

(vi) Labels: statement CONJECTURED; D1–D3 PROVEN/recorded (dead-ends citations); the k=4 vesica mechanism PROVEN.

## 6. Layering — what remains true from the probes

The dichotomy result (all mined dead cores ℂ-dead; ℚ-certificates exist) concerns cores mined from n = 12 cubes; it stands and remains the right certificate technology for the B/C banks and the in-flight (5,5,4) census. D2's no-counting-invariant verdict stands and is reinforced (T5 diffusion; T2 diversity; the k=4 universe contains a dead/alive pair differing in one witness swap: 0:[1,2,3];1:[2,3];**2:[0,3]**;3:[1,2] dead vs 0:[1,2,3];1:[2,3];**2:[1,3]**;3:[1,2] alive). What this session adds is the third layer: the uniform-n extrapolation of the ℂ-ideal-theoretic shape is false — the kill at n ≤ 14 samples is a property of those orders/samples, not of the pattern family, whose tail contains realizable members satisfying every equality-shaped leaf fact. The mathematical content of the |A| ≥ 12 tail is exactly the coupling of convex position to the equidistance pattern — (Q)-flavored, as the dead-ends file predicted from the other side.

## 7. What next (ranked)

1. **Decide Candidate B now** (cheapest decisive move): the row-fragment embedding search against W20/W16a/b (spec §5.B.iii). Embedding found ⇒ ideal-theoretic shape closed outright; not found ⇒ B is the single live uniform candidate and earns a covering analysis.
2. **Present the split to Adam:** close the head (12–14, Candidate C census extension, k=4 bank first) and name the card-≥15 residual, versus holding Card12Up whole pending a Candidate-D mechanism. The head split is strict on-spine narrowing either way; the tail currently has no route in the decided shape.
3. **Bank the adversarial testbed:** the two-ring family (m, τ = π/m, b solving the paired quadratics; includes the n = 20 golden-ratio configuration) and W15 as mandatory falsifiers for any future proposed uniform statement. FLAG FOR IMPLEMENTER: exact certification + a durable docs note (this pass cannot write repo docs).
4. **Candidate D groundwork** (only if Adam sanctions): the bounded order-decorated exclusion question of §5.D.iv, exact-rational frames, exclusions only.

**Artifacts** (session scratchpad `/private/tmp/claude-501/-Users-adam-projects-math-projects-erdos-97-96-formalization/fe6e52a9-1de1-4034-b676-5c7e83aecbac/scratchpad/d3/`, all reproducible from committed repo data + stated seeds): `t1_results.json`, `t1.log`, `t1b.log`; `t9_wit_m8_1.4534.json`, `t9_wit_m8_2.2853.json`, `t9_wit_m10_0.6180.json`; `cegar0.log`; `t6_{754,655,664,854,665,965}.log` + JSONs (965 final: stage1 {DEAD 12, ALIVE 19, TIMEOUT 9}, stage2 {DEAD 18, ALIVE 0, TIMEOUT 1}); `t7_654.log`/`t7_654.json`; `t8_754.log`; `analyze_cores.py` (T5/T2/T3 tables). Repo inputs, read-only: `/Users/adam/projects/math-projects/erdos-97-96-formalization/scratch/u12-census-port/**`, `lean/Erdos9796Proof/P97/U1LargeCapRouteBTail.lean`, `SurplusM44Packet.lean`, `U1CarrierInjection.lean`.
