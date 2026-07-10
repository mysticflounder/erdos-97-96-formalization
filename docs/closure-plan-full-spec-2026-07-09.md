# Full Closure Specification — Problem 97/96 (2026-07-09)

Authoritative step-by-step plan from the current kernel state to
`proof-blueprint verify-publish` green on `Problem97.erdos97_rhs` and
`Problem96.erdos96_rhs`. Every claim is cited to source read on 2026-07-09 or
carries an ambiguity marker. No step in this document is asserted from memory.

Kernel state (proof-blueprint spine, 2026-07-09): 28/1680 nodes open, 5 sorried
symbols:

| # | Leaf | File | Front |
|---|------|------|-------|
| 1 | `U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair` | U1LargeCapRouteBTail.lean:2657 | A |
| 2 | `u1_largeCap_routeB_tail_liveData_false` | U1LargeCapRouteBTail.lean | A |
| 3 | `isM44PinnedSurplusNonVExactShapeProducer` | RemovableVertexAxiom/PinnedSurplusProducer.lean:302 | B |
| 4 | `isM44EndpointResidualsExcluded` | RemovableVertexAxiom/Base.lean | B |
| 5 | `isM44NonSurplusContainmentErasedPinTripleResidualsExcluded` | RemovableVertexAxiom/Continuation.lean | B |

Two fronts. Front A is the two-large-cap (¬M44) branch; Front B is the M44
branch. They are disjoint on the spine (the `removableVertexOfLarge` case
split: `of_isM44PinnedSurplus` vs `of_nonIsM44`).

---

## Front A — two-large-cap lane (leaves 1, 2)

### A.0 Verified structure (2026-07-09 source reads)

- Leaf 1's hypotheses carry `9 < D.A.card` with **no upper bound**
  (U1LargeCapRouteBTail.lean:2672); surplus cap `> 4` at `i`, second cap
  `≥ 5` at `j ≠ i`, `¬ IsM44`, center-K4 via `D`, critical shell.
- `capProfile_eq_554_of_card_eq_eleven` (line 2158) pins the cap profile to
  (5,5,4) exactly when `D.A.card = 11` — "the finite profile handoff used by
  the (5,5,4) census" (line 2155 comment).
- The (5,5,4) census space (scratch/census-554/census554_lib.py header) is an
  exact port of the necessity-audited constraint set (C1 center-K4, C2
  two-circle, C4 strict convexity, one-hit at V/W — "all PROVEN necessary"),
  over the 11 labeled points; at card 11 every point of A is labeled, so
  class confinement is automatic for this slice.

### A.1 Card-11 slice — RUNNING

Pipeline (running 2026-07-09, `scratch/census-554/frontier_loop.py`):
lazy motif-embedding cover + CEGAR mining at genuine frontiers, to UNSAT.

Product on UNSAT: no center-K4 class system exists on the (5,5,4) 11-point
profile, conditional on exactly two discharge obligations:

1. **Per-pattern deadness** — one Nullstellensatz certificate per banked row
   (exact rational identity; already independently recheckable; 5397+ rows).
2. **Motif-transfer lemma** — deadness of an equidistance pattern is invariant
   under relabeling + similarity (gauge moves points 0,1 to (0,0),(1,0)).
   Empirically validated 135/135 (scratch/census-554/motif_transfer.log).
   **PROVEN in Lean 2026-07-09** — `Problem97.Census554.motif_transfer`,
   sorry-free, core axioms (see A.2 step 4). Obligation 2 is DISCHARGED;
   obligation 1 is the A.2 step-2 replay (checker built and validated
   end-to-end; data pipeline in progress).

Stop conditions that would revise this section: a frontier cube with no
minimal dead pattern (a genuinely ALIVE cube ⇒ the census finds a candidate
11-point counterexample-consistent class system — a mathematical finding, not
a tooling failure), or systematic certify failure.

### A.2 Card-11 Lean transfer — specified steps

Ordered; each step is a buildable artifact. {{UNVALIDATED}} until the step's
build passes.

1. **Finite space defs in Lean**: the 11-point profile, candidate classes
   (C1/C2/C4/one-hit filter) as decidable defs mirroring `census554_lib.py`.
   **Mirror BUILT 2026-07-09**: `lean/Erdos9796Proof/P97/Census554/Space.lean`
   (`OnehitOk`/`IsCandidateClass`/`candidateClasses`/`Cube`/`CubeOk`, all
   decidable); encoding validated by kernel-`decide` smoke anchors — the
   per-center class counts (210, 43, 16, 210) match
   `len(census554_lib.candidates(p))`.
   Necessity side still open: each filter clause must cite the existing Lean
   lemma that makes it necessary at the leaf ({{NEEDS_RESEARCH}} — collect
   exact lemma names per clause; one-hit is proven at apices V,W only, per
   census header).
2. **Certificate checker**: verified Lean checker for the banked certificate
   format (Σ cᵢ·gᵢ = 1 over ℚ) + generated pattern data. Kernel-checked via
   `decide`/`native_decide` under the bv_decide standard (verified decision
   procedure, no `@[implemented_by]` in closure).
   **Feasibility measured 2026-07-09** (`scratch/census-554/certs/`, 5,401
   files at measurement): median cert 54 KB, p90 7 MB — but p99 351 MB, max
   2.3 GB, 70 GB total. 4,929 certs ≤ 10 MB sum to 2.7 GB (transferable);
   **475 heavy multi_pair certs carry 72.8 GB** and cannot be replayed
   through the kernel as-is. Smallest certs are all `base` kills, largest
   all `multi_pair`. Named residual: a shrink strategy for the heavy tail —
   re-lift with different order/strategy, split multi_pair kills into
   per-pair sub-certificates, or re-mine alternative patterns at the
   affected cubes ({{NEEDS_RESEARCH}}; blocked on nothing, independent of
   the running loop).
   **Format verified 2026-07-09** (`certs/pat_02213.json`, schema
   `census554_pattern_certificate.v1`): `variables` (gauged coordinate
   names), `generators` (polynomial strings), `generator_tags` ([c,a,b] =
   the generator is d²(c,a)−d²(c,b)), `coefficients` (one per generator;
   identity Σ cᵢ·gᵢ = 1), `rab_pairs` (Rabinowitsch t-var generators, empty
   for base kills), `python_exact_identity: true` (exact Fraction recheck
   passed at banking). The Lean checker must RE-DERIVE the generators from
   `pattern` + gauge (not trust the strings) and then verify the identity;
   `IsDead` (MotifTransfer.lean) then follows by evaluation, giving
   emptiness per banked pattern.
   **Verified poly layer BUILT 2026-07-09**:
   `lean/Erdos9796Proof/P97/Census554/PolyCheck.lean` — computable sparse
   ℚ-polynomials (`Mon`/`SPoly`, add/neg/mul/const/normalize) with
   evaluation-soundness lemmas; payoff theorem
   `SPoly.eval_eq_zero_of_normalize_eq_nil` (normalize-to-nil ⟹ evaluates
   to 0 everywhere) is sorry-free, core axioms only.
   **Checker bridge BUILT 2026-07-09**:
   `lean/Erdos9796Proof/P97/Census554/CertCheck.lean` —
   `coordVar`/`coordPoly`/`d2Poly`/`CertTag`/`envOf`/`checkCert` with
   soundness theorem `isDead_of_checkCert` (accepted certificate ⟹
   `IsDead P`), sorry-free, core axioms only. **End-to-end validated on
   real banked data**: `isDead_P02213` replays cert `pat_02213.json`
   (base kill) via `native_decide` (core axioms + ofReduceBool/
   trustCompiler, both approved) — tag/gauge/variable conventions match
   the bank exactly, first attempt. Step 2's mathematical core is
   COMPLETE.
   **Data pipeline BUILT + probe-measured 2026-07-09**
   (`scratch/census-554/gen_lean_certs.py`; probe modules under
   `lean/.../Census554/Bank/`, uncommitted): hand-written tokenizer,
   per-cert validation (exact generator-string round-trip; coefficients
   are verbatim Singular output so they get semantic round-trip + the
   exact Fraction identity Σcᵢgᵢ=1 re-derived from pattern+tags), chunked
   `SPoly` literals (≤128 terms/def — a ~5,000-term literal dies at
   maxRecDepth). 21/21 probe certs validated; generated theorems replay
   via `native_decide`, axioms = core + ofReduceBool/trustCompiler.
   **Measured cost** (scales with coefficient term count, ~60–80 ms/term):
   small modules 6.5 s each with batching amortizing overhead to
   ~0.1 s/theorem; fleet-median 55 KB cert → 88 s; 572 KB multi_pair →
   753 s. **Projection**: certs ≤ 1 MB (4,277 = 79% of fleet) ≈ 145–150
   CPU-hours — feasible batched at 8-way. The > 1 MB tail (1,136 certs),
   and especially the ~410 certs > 16 MB, are NOT viable by naive replay —
   this sharpens the heavy-tail residual: re-mine smaller certificates
   for those patterns or redesign the checker's `normalize`
   (quadratic insert-merge) before replay.
3. **Cover check**: `decide`-level verification that the banked pattern set
   (after motif closure) excludes all candidate cubes. Format: either replay
   the SAT UNSAT as a generated Lean enumeration, or export DRAT and
   re-derive by direct finite enumeration in Lean. {{NEEDS_RESEARCH}} — the
   candidate cube space size determines which is feasible.
4. **Motif-transfer lemma** in Lean: equidistance-pattern deadness is
   similarity-invariant. This is the single new mathematical lemma of Front
   A's card-11 slice. Shape: if a labeled pattern has no realization with
   gauge (0,0),(1,0), then no injective relabeling of it has any realization
   at all. **PROVEN 2026-07-09**: `Problem97.Census554.motif_transfer`
   (`lean/Erdos9796Proof/P97/Census554/MotifTransfer.lean`), built via the
   existing `normSim` similarity toolkit
   (`U2/SimilarityNormalization.lean:72-122`); `#print axioms` = core only
   (propext, Classical.choice, Quot.sound), no sorry. The file also fixes
   the `Pattern`/`IsGaugedRealization`/`IsDead` vocabulary steps 2–3 consume.
   Not yet imported by the leaf — wiring is step 5.
5. **Leaf discharge at card 11**: from steps 1–4 + `D.K4` +
   `capProfile_eq_554_of_card_eq_eleven`, derive `False` under
   `D.A.card = 11` at the leaf, and case-split every Front-A obligation on
   `card = 11` vs `12 ≤ card`. Per A.2b this wiring does not exist and is
   built from scratch (the profile lemmas currently terminate unconsumed).

### A.2b Leaf wiring facts (U1LargeCapRouteBTail.lean, mapped 2026-07-09)

- All ~79 case sorries (lines 3792–5887) live inside **one** declaration:
  `u1_largeCap_routeB_tail_liveData_false` (line 3525) — leaves of a nested
  ordered-subcube case tree over source-point identity and label
  permutations, plus 7 top-level `rcases` leaves. Leaf 2 IS that case tree.
- The kernel spine additionally shows leaf 2's compiled proof reaching
  leaf 1 (`DoubleApexOffSurplusSharedRadiusPair`) through the
  `false_of_center_p_t2_t20 → … → exists_removableVertex_of_twoLargeCaps`
  chain, so closing Front A requires BOTH leaf 1 and the 79 case leaves (or
  a refactor of the case tree).
- The declarations at lines 6075/6127 are thin re-exports into
  `Erdos9796Proof.P97.U1LargeCapRouteBTail`, not duplicates; the only real
  sorry is at 2702.
- **The card-11 handoff is not wired**: `capProfile_eq_554_of_card_eq_eleven`
  terminates in profile facts ((5,5,4), interiors (3,3,2), and the
  `MultiCenter/CapProfile.lean` vocabulary translations) with no further
  consumers. No `D.A.card = 11 → False` packaging, no card-11-vs-≥12 split
  of the leaf exists anywhere in the tree. A.2 step 5 therefore includes
  building that split and contradiction packaging from scratch.

### A.3 Card ≥ 12 residual (per scratch/census-12-gate/STATE.md and
scratch/d3-formulation/report.md, digested 2026-07-09)

Cap profiles at card 12 (sum 15, parts ≥ 4, at least two parts ≥ 5):
(6,5,4), (5,6,4), (5,5,5); {4,4,7} excluded (STATE.md:33-45). Only (6,5,4)
was measured ("654_all"; the "_all" cut set includes one CONJECTURED
narrowing, STATE.md:192-208). Readout = **no convergence**: fresh
window-shapes never saturate; canonical family-size estimate ~5e20
(STATE.md:286-297). Bank: 256/256 certificates verified, incl. the
offline-resolved pat_00255. The (5,5,5) profile is designated secondary and
was never run to depth; (5,6,4) deliberately unmeasured (same combinatorial
family as (6,5,4)) (STATE.md:47-52).

**Three provably different regimes above card 11:**

- **Card 12–14 ("the head")** — closable in principle by census extension
  (Candidate C). Sampled evidence: n=13 300/300 dead, n=14 160/160 dead
  (report.md:33-34, 80); kills localize to ≤8-point windows (report.md:84).
  Obstruction C1: no covering proof mechanism known (report.md:143); the
  n=12 no-convergence readout is the live risk.
- **Card ≥ 15 ("the tail") — the pattern-census route is FALSIFIED.**
  Explicit realizable admissible witnesses at n = 15, 16, 20 (three
  independent constructions, 50–60-digit verification) survive every
  equality-shaped strengthening of the leaf's proven combinatorial shadow
  (report.md:56, 105). No pattern bank can cover the tail; the uniform-n
  ideal-theoretic extrapolation is false (report.md:163).
- **Only non-excluded tail route: Candidate D** — synthetic
  convexity-coupled forcing of a mutual-membership pair, refuted by the
  reflection kernel `oppCap2_escape_gen` (report.md:150-151). Status
  OPEN-DIFFICULT with named obstructions D1–D3 (role diffusion; the M44
  squeeze engine absent by construction at (≥5,≥5,≥4); sound convex
  coupling reintroduces the QF_NRA that timed out). No mechanism identified.

Consequence, stated plainly: **Front A has no complete known route.** Card
11 closes via A.1/A.2; card 12–14 is census-extendable with convergence
risk; card ≥ 15 requires Candidate-D-shaped new mathematics.
{{NEEDS_ADAM_INPUT}} — run the 12–14 head census and name a card-≥15
residual, or hold Card12Up whole pending a Candidate-D mechanism
(report.md:168 poses exactly this choice).

---

## Front B — M44 lane (leaves 3, 4, 5)

### B.0 Verified structure (2026-07-09 source + slot3 doc tail)

All three leaves are producer gaps sharing one core: at M44, `A` is unbounded
(`surplusCap.card = A.card − 5`, PartitionFromMEC.lean:450) and unlabeled
points live in the surplus cap interior. The producers demand, per non-fixed
center, a fully-labeled equidistant 4-class whose mask is in the generated
candidate tables — i.e. **confinement**. The pinned residual supplies exactly
one labeled circle (the `.v` selected class, SurplusM44Packet.lean:4390);
no non-circular producer exists in the repo (slot3 tail, six checkpoints
2026-07-09; independently confirmed against the statements this session).

Concurrent session note: the P2 row-local boundary refactor in
`Continuation.lean` is actively worked in another session. This plan does not
schedule edits to that file.

### B.1 Multi-center joint census: what it is and is not
(per census/multi_center/STATE.md, spec, proof plan, results note,
audit b7431da; digested 2026-07-09)

**It does not feed Front B.** Proof plan Phase 5 (lines 236–260) states the
census and its stabilization theorems "do **not** directly supply the
producer facts required by" the endpoint, pinned-surplus, and erased-pin
exclusions; "the census does not close any current slot-2 spine `sorry` by
itself." Its intended payoff is **Front A's tail** (the >2-center coupling
surface as a finite stabilized alphabet — a confinement/finiteness input to
Candidate-D-shaped arguments), plus the P3 decision gate below.

Status: L2 (three-center joint incidence classes), GLOBAL tier, PROVEN cuts,
swept n=12..32: 977,975/977,975 SAT, 0 UNSAT, 0 INDETERMINATE; cumulative
inventory 3,375 classes, zero fresh on n=25..32. Exact LOCAL frontier scans
are flat against that inventory through n=64. The verdict remains
**STABILIZED-EMPIRICAL** (STATE.md; results note and its 2026-07-09 addendum).

The finite representative-surface bridge is now proved in Lean. A complete
21-cell L2/full LOCAL enumerator is checked equal to the 3,375-row typed bank;
all profile-preserving center permutations and all 489 generated profile rows
are covered; and `ProfileClassIncidence.completesL2FullFrom_representativeSurface`
is kernel-checked. This closes the former enumerator-completeness obligation,
not geometric realization.

The upgrade path still needs the §6 persistence lemma (insert-an-inert-point
monotonicity, obstruction C4-saturation) and a sound configuration-level
LOCAL-to-GLOBAL bridge. The Phase-3 audit defect (commit b7431da) therefore
stands: **T2 (one-step persistence) alone gives only qualitative eventual
constancy; T1 (or an equivalent cap) is REQUIRED for the quantitative
inventory-locking** `inventory(n) = inventory(25)`. The mandatory
CONJECTURED-tier appendix sweep has NOT been run (only an n=12..15 smoke,
11,223/11,223 SAT).

### B.2 Erased-pin generated row bank (leaf 5 lane)

Exists in Lean (`ErasedPinFixedSeedDFS.lean`): 330 deduplicated fixed seeds,
26 row definitions, each with a
`*_candidates_false_of_isValidOneSidedSeedRelaxedShapeShadow` exclusion
theorem, plus the generic bridge
`false_of_erasedPinFixedSeedRelaxedShape_pointClasses`
(SurplusCOMPGBankGeometry.lean, built and checked 2026-07-09).

Missing, per slot3 P2/P4 (the leaf's true residual content):

- **P2 — ordered-row mask-interface producer**: prove every non-fixed
  center's realized point-mask lies in the generated candidate list, from
  mask-interface data carried through the ordered scaffold
  (`ErasedPinFiniteCandidateSepOrderedScaffoldFacts`). The broad
  `hrightCandidate`/`hleftCandidate` helpers are UNPROVABLE as written
  (Boolean probe: cross-separation can hold while `.u ∉ candidateMasks`;
  K4 gives some selected radius, not a four-class at the shared radius
  `dist p x`). Active refactor territory of the concurrent session — not
  scheduled here.
- **P4 — surplus-side producer**: the two direct surplus-index cuts need a
  `U5ModeA`-style global support-confinement producer or a new cut. Rows
  needing >3 surplus labels are not representable in the ten-label
  subpacket without a surplus-extra bridge.
- **P3 decision gate**: sweep the CONJECTURED cut tier over the incidence
  classes matching the blocked sites/surviving rows to NAME the missing
  exclusion cut. Blocked on the unwritten erased-pin row-to-class mapping
  ({{NEEDS_RESEARCH}} in slot3; census-side artifact exists).

### B.3 Leaves 3 and 4 (pinned-surplus, endpoint)

Same residual shape (slot3 tail, six checkpoints 2026-07-09, confirmed
against statements this session): genuine support/metric-shadow producers.
For leaf 3 the two admissible shapes are a support-confinement theorem from
pinned/M44 geometry, or a boundary move downstream to erased-payload
selected-class data without cycling through `PinnedSurplusBank`. For leaf 4
the endpoint bank rows satisfy full `classesShapeOK`, so no vacuous row
exists; genuine non-`.v/.w` selected-class metric production is required.
No census currently feeds either. {{NEEDS_PROOF}} — this is open geometry.

---

## Ordering and sizing (hardest-first; sized in sessions)

**Critical path — open mathematics (no known mechanism; every other item is
bounded work):**

1. **Candidate D** (Front A tail, card ≥ 15): convexity-coupled forcing of
   the shared-radius pair. Named obstructions D1–D3. The multi-center
   stabilization (B.1) + T1/T2 lemmas are the intended finiteness
   scaffolding for it.
2. **Front B producers**: P4 U5ModeA-style confinement; leaf 3/4 producers.
   The P3 CONJECTURED-tier gate (bounded work, below) is the instrument
   that names the missing cut before more producer attempts.

**Running now:** card-11 (5,5,4) cover loop to UNSAT (A.1).

**Bounded, well-specified queue (each item = 1–3 focused sessions unless
marked):**

- A.2 steps 1–5 (progress 2026-07-09: step 1 mirror DONE, step 2 math core
  DONE + end-to-end validated, step 4 DONE — see A.2): remaining are the
  step-2 data pipeline + heavy-tail shrink, step 3 cover check
  ({{NEEDS_RESEARCH}} on enumeration feasibility — may be several
  sessions), and step-5 card-11/card-≥12 split wiring (does not exist
  yet — A.2b).
- B.1 T2 persistence lemma, then T1 quantitative cap (Phase 3a/3b split per
  audit b7431da).
- B.2 P3: write the erased-pin row-to-class mapping, run the
  CONJECTURED-tier appendix sweep, read out the named cut.
- A.3 head census 12–14 ((6,5,4)+(5,5,5)+(5,6,4)): {{NEEDS_ADAM_INPUT}} —
  a narrowing move only; closes nothing at the tail (obstruction C2).

**Sequencing logic:** the bounded queue converts every leaf's residual into
its sharpest named form and banks all machine-closable content; the critical
path is where the theorem actually gets finished. Nothing in the bounded
queue is wasted under any resolution of the critical path.

## Change control

This document supersedes ad-hoc status narration. Any change to the claims
above requires a file:line citation or a kernel query, recorded here.
