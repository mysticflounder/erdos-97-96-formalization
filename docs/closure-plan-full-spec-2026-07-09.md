# Full Closure Specification — Problem 97/96 (2026-07-09)

Authoritative route plan from the current source state and last fully mined
kernel state to
`proof-blueprint verify-publish` green on `Problem97.erdos97_rhs` and
`Problem96.erdos96_rhs`. The executable task register is
`docs/closure-matrix-2026-07-09.md`; this document owns route rationale and
dependency order. The full-plan audit is
`docs/audits/2026-07-09-full-closure-plan-audit.md`.

Source-current snapshot (`proof-blueprint index --refresh` and `status`, final
audit recheck 2026-07-09):

- the source index is in sync and contains exactly five declarations with
  `sorry`, all of which were on both publish-target spines in the last fully
  mined graph; and
- no off-spine source declaration contains `sorry`.

Last fully mined kernel graph (build fingerprint `04729e61b704`):

- `Problem97.erdos97_rhs`: 23/1676 project nodes open;
- `Problem96.erdos96_rhs`: 27/1684 project nodes open;
- both targets reach the same five source declarations containing `sorry`;
- `sorryAx` appears as the synthetic unapproved kernel axiom reached through
  those declarations, not as a sixth source obligation.

| # | Leaf | Current source | Textual holes | Front |
|---|------|----------------|---------------|-------|
| 1 | `U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair` | `U1LargeCapRouteBTail.lean:2657` | 1 | A |
| 2 | `u1_largeCap_routeB_tail_liveData_false` | `U1LargeCapRouteBTail.lean:3525` | 79 | A |
| 3 | `isM44PinnedSurplusGeneralMResidualsExcluded` | `RemovableVertexAxiom/PinnedSurplusBank.lean:265` | 1 | B |
| 4 | `isM44EndpointResidualsExcluded` | `RemovableVertexAxiom/Base.lean:10055` | 2 | B |
| 5 | `isM44NonSurplusContainmentErasedPinTripleResidualsExcluded` | `RemovableVertexAxiom/Continuation.lean:107` | 4 | B |

The 87 textual holes collapse to the five declarations above. The matrix
decomposes them into producer families and also records non-`sorry`
prerequisites such as Census554 cover verification and final publication
gates.

**Reproducibility checkpoint.** The focused pinned-surplus build is green, and
proof-blueprint reports build fingerprint `04729e61b704` with 6014/6014 mined
symbols fresh.  It sees exactly one uncommitted Lean path,
`PinnedSurplusBank.lean`; this plan accompanies that path's commit.  The five
source declarations remain open, so this fresh mine is checkpoint evidence,
not a passing publication gate.

## Execution contract

Every matrix row must identify an existing spine consumer before adding a new
`sorry`. New helper statements land sorry-free; if a genuinely new open
theorem is unavoidable, its consumer must land in the same change so the new
declaration is immediately on the kernel spine. No wrapper-only reformulation
counts as progress.

For a Lean row, acceptance is:

1. no other top-level build or direct Lean compile is active in this project;
2. `lake-build <smallest affected module target>` succeeds;
3. `proof-blueprint index --refresh` reports the source index in sync;
4. after the build graph is fresh, `proof-blueprint spine <consumer-symbol>`
   shows the intended dependency;
5. `proof-blueprint axioms <new-terminal-symbol>` shows only core axioms and
   the explicitly approved `Lean.trustCompiler` boundary when
   `native_decide` is used; and
6. the row's targeted tests in the closure matrix pass.

Only the final publication row runs the full project build, refreshes kernel
references, and invokes `proof-blueprint verify-publish` on both targets.

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
- The (5,5,4) Python census space (`scratch/census-554/census554_lib.py`)
  encodes C1 center-K4, C2 two-circle, C4 strict convexity, and one-hit at
  V/W over the 11 labeled points. Its header records those cuts as proved
  necessary, and the Lean finite mirror reproduces the Python candidate
  counts. `Problem97.Census554.exists_card11SelectedCube_cubeOk` now assembles
  the theorem-level transport from the geometric card-11 leaf hypotheses to
  every `CubeOk` clause. At card 11 every point of `A` is labeled, so no
  additional unlabeled-point confinement condition is needed.

### A.1 Card-11 slice — ACTIVE PRE-LEASE RUN, INCOMPLETE

Pipeline (`scratch/census-554/frontier_loop.py`): lazy motif-embedding cover +
CEGAR mining at genuine frontiers, to UNSAT.

The 18:32 audit snapshot was paused at 5,431 rows / iteration 1154. A later
process resumed it. At 19:40 PDT, lock-consistent file evidence showed 5,444
raw bank rows and the log had reached the frontier at iteration 1240. Direct
process-list access was sandbox-blocked, so this status is grounded in current
bank/log mtimes and content. There is still no adjudicated terminal result.

**Correct interpretation of a future solver UNSAT:** CaDiCaL UNSAT would be an
EMPIRICALLY VERIFIED coverage result for the exact emitted Python CNF and the
bank snapshot used to emit it. It would say that every candidate cube in that
encoding contains an encoded bank-motif instance. It would not, by itself,
prove the geometric card-11 theorem or close a Lean leaf. The permanent
terminal publisher now re-solves the persisted CNF, requires `drat-trim`
verification, emits core CNF and LRAT artifacts, takes a lock-consistent bank
snapshot, and records source row, canonical motif, support injection, emitted
pattern, and clause provenance. It writes the completion marker last. Unit
fault gates and a real tiny CaDiCaL/`drat-trim` integration test pass. The
active process predates that frontier-loop rewrite, however, so its in-memory
terminal function is the old prototype. Any marker from this run is provisional
until rechecked and re-published by the new gate. The mandatory consumer command
`uv run python -m census.census_554.verify_completion --root scratch/census-554`
rejects the legacy marker schema and independently rechecks all hashes and DRAT.

The complete card-11 discharge chain has seven obligations:

1. freeze the terminal bank and cover-instance snapshots, with digests, and
   independently validate every certificate used by the cover;
2. prove that the geometric card-11 data induces a `CubeOk` cube, including
   the necessity of C1/C2/C4/one-hit at exactly the centers where imposed;
3. replay per-pattern certificate deadness in Lean for every bank motif used;
4. define motif containment and prove that every injection of a motif's
   support into `Fin 11` extends to a total injective relabeling of `Fin 11`;
5. apply the proved similarity/relabeling theorem
   `Problem97.Census554.motif_transfer`;
6. kernel-check that the motif-closed bank covers every `CubeOk` cube; and
7. package the resulting contradiction and wire the card-11/card-at-least-12
   split into the actual Front-A leaves.

Obligations 2, 4, and 5, plus the mathematical checker core needed for
obligation 3, are complete. A.2 tracks the remaining artifacts.

Operational code now has a shared lifetime driver lease, a separate bank
transaction lock, max-suffix PID allocation, canonical dedupe, exact precommit
certificate validation, a crash-recovery journal, fsynced atomic certificate
publication, and fsynced atomic bank replacement. The child publisher used
this path successfully for `pat_05443`. Cross-process and fault-injection tests
pass. The active process started before the lifetime lease loaded, so lease
enforcement begins at restart. Permanent migration is partial:
`census/census_554/` owns the protocol, terminal gate, structural auditor,
combinatorial core, and self-contained smoke/tests, while the driver, miner,
verifier, changing bank, and large certificate artifact remain under
`scratch/`. See
`docs/audits/2026-07-09-census-554-parallel-work-audit.md`.

Stop conditions that would revise this section: a frontier cube with no
minimal dead pattern (a genuinely ALIVE cube ⇒ the census finds a candidate
11-point counterexample-consistent class system — a mathematical finding, not
a tooling failure), or systematic certify failure.

### A.2 Card-11 Lean transfer — specified steps

Ordered; each step names a buildable artifact. Status is controlled by the
corresponding closure-matrix gate, not by prose completion claims.

1. **Finite space defs in Lean**: the 11-point profile, candidate classes
   (C1/C2/C4/one-hit filter) as decidable defs mirroring `census554_lib.py`.
   **Mirror BUILT 2026-07-09**: `lean/Erdos9796Proof/P97/Census554/Space.lean`
   (`OnehitOk`/`IsCandidateClass`/`candidateClasses`/`Cube`/`CubeOk`, all
   decidable); encoding validated by kernel-`decide` smoke anchors — the
   per-center class counts (210, 43, 16, 210) match
   `len(census554_lib.candidates(p))`.
   **Status: DEFINITIONS AND GEOMETRIC NECESSITY BRIDGE COMPLETE (matrix
   A11-GEO-*).** `Census554/GeometryBridge.lean` now provides:

   - `Card11CapLabeling.nonempty_of_card_eq_eleven`, which constructs an
     injective `pointOf : Fin 11 → ℝ²` with range `D.A`, puts the three Moser
     apices at labels 0/1/2, and maps the canonical blocks 3--5, 6--8, and
     9--10 exactly onto the `(3,3,2)` strict cap interiors;
   - `Card11SelectedCube.ofGlobalK4` and `Card11SelectedCube.cube`, which choose
     one proved-nonempty `SelectedFourClass D.A (pointOf p)` per label and pull
     its support back through `pointOf`;
   - `image_cube_eq_support` and `equidist_of_mem_cube`, the exact
     schema-neutral facts needed to construct the future `RealizesCube`
     relation without repeating geometric reasoning;
   - `cube_card`, `center_not_mem_cube`, and `cube_inter_card_le_two` for C1/C2;
     `pair_hit_centers_card_le_two` for C4; and
     `onehitOk_of_capProfile` for the two V/W one-hit conditions; and
   - `Card11SelectedCube.cubeOk` plus
     `exists_card11SelectedCube_cubeOk`, which package the complete necessity
     bridge from the card-11 two-large-cap hypotheses to `CubeOk`.

   The targeted `lake-build` succeeds. The source contains no
   `sorry`/`admit`/declared axiom, and live axiom queries for
   `Card11CapLabeling.nonempty_of_card_eq_eleven`,
   `Card11SelectedCube.cubeOk`, and `exists_card11SelectedCube_cubeOk` report
   only `propext`, `Classical.choice`, and `Quot.sound`. Step 3/A11-COVER-REL
   now defines `RealizesCube` and proves the selected-cube adapter directly
   from `L.injective` and `S.equidist_of_mem_cube`.
2. **Certificate checker**: verified Lean checker for the banked certificate
   format (Σ cᵢ·gᵢ = 1 over ℚ) + generated pattern data. Kernel-checked via
   `decide`/`native_decide` under the bv_decide standard (verified decision
   procedure, no `@[implemented_by]` in closure).
   **Feasibility remeasured 2026-07-09** by the permanent structural auditor at
   5,443 unique cert paths: median 54,787 B, p90 7,193,804 B, p99 365,247,505 B,
   max 2,281,208,887 B, 157 files over 100 MiB, and 78,158,578,373 B total.
   About 4,900 certs at most
   10 MB account for only a few GB; roughly 475 heavy `multi_pair` certs carry
   most of the bytes and cannot be replayed
   through the kernel as-is. Smallest certs are all `base` kills, largest
   all `multi_pair`. Named residual: a shrink strategy for the heavy tail —
   re-lift with different order/strategy, split multi_pair kills into
   per-pair sub-certificates, or re-mine alternative patterns at the
   affected cubes. The terminal checker now invokes `drat-trim -c/-L`, maps
   core exclusion clauses back to exact manifest rows, and records core source
   cert sizes. Apply shrinking only to that core; exact full-bank replay is a
   freeze audit, not part of terminal SAT-proof publication (matrix A11-CORE
   and A11-CERT-*).
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
   **Data-pipeline PROTOTYPE BUILT + probe-measured 2026-07-09; NOT
   INTEGRATION-COMPLETE** (`scratch/census-554/gen_lean_certs.py`; probe
   modules under `lean/.../Census554/Bank/`, all uncommitted at audit time):
   hand-written tokenizer,
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
   CPU-hours — feasible batched at 8-way. The greater-than-1-MB tail (1,136
   certs at that later live checkpoint),
   and especially the ~410 certs > 16 MB, are NOT viable by naive replay —
   this sharpens the heavy-tail residual: re-mine smaller certificates for
   those patterns or redesign the checker's `normalize` (quadratic
   insert-merge) before replay.
   **`normalize` redesign DONE 2026-07-09**: `SPoly.normalize` is now
   sort-merge (`Mon.canon` map → `List.mergeSort` by monomial → linear
   adjacent-merge `mergeAdj`), eval-soundness reproven via
   `List.mergeSort_perm` + permutation-invariance of the evaluation sum,
   core axioms only; all 21 committed Bank modules replay unchanged.
   Measured on the largest committed module (Pat05043, 7.3 MB): 381 s →
   343 s wall (−10%) — literal elaboration dominates at this size, so the
   checker fix alone does NOT rescue the >16 MB tail; re-mining/splitting
   remains the named residual there.

   The committed generator now puts batch output in a disjoint namespace,
   emits the standard Lean file header, and no longer leaves the duplicate
   `PatBatchProbe` module in `lean/`; 21 representative replay modules are
   committed. Those repairs have not completed integration: move the supported
   generator and tests to `census/census_554/`, add self-contained fixtures,
   and retain the documented ignored-artifact policy for raw heavy payloads
   before fleet generation. **Step 2 status: checker soundness COMPLETE;
   permanent generator integration and terminal cover-core replay OPEN.**
3. **Motif-closed cover bridge and check**: this step has separate mathematical
   and finite-computation parts. The support-injection and relational substeps
   are complete; the remaining parts are open:

   - freeze the terminal bank and exact motif-instance manifest; the permanent
     publisher now records all required provenance and hashes;
   - consume the emitted core CNF/LRAT and mapped core source rows, then
     generate/replay only that certificate core before fleet-wide replay;
   - kernel-check that every `CubeOk` cube contains a dead motif instance; and
   - combine per-pattern deadness, the support bridge, and step 4 to derive
     impossibility of every covered cube.

   **Support bridge PROVEN 2026-07-09:**
   `Problem97.Census554.exists_injective_extension` extends an injection on a
   finite support, and `motif_transfer_of_supportInjOn` consumes the support
   injection directly. The latter was built and its axiom query reports only
   `propext`, `Classical.choice`, and `Quot.sound`.

   **Relational interface PROVEN 2026-07-09**
   (`Census554/CoverRelations.lean`): `CoverRow` keeps computable source ID and
   pattern data separate from `CoverRow.Certified := IsDead row.pattern`;
   `PatternEmbedsUnder row.pattern f κ` stores the total map, its
   `Set.InjOn f (support row.pattern)` proof, and every mapped-mask inclusion;
   `RealizesCube x κ` stores point injectivity and per-class equidistance.
   `RealizesCube.equidist_of_patternEmbedsUnder` supplies the relabeled motif
   equations, and `CoverRow.not_realizesCube_of_embeds` combines a certified
   row with an embedding through `motif_transfer_of_supportInjOn`.
   `Card11SelectedCube.realizesCube` is the geometric adapter. A nonidentity
   two-row smoke example compiles. The source is sorry-free, and live axiom
   queries for the three public endpoints report only `propext`,
   `Classical.choice`, and `Quot.sound`.

   Implement the finite coordinator and generated core data in
   `Census554/Cover.lean`, reusing these relations. Keep the combinatorial and
   geometric conclusions separate:

   - `coverCore_covers : CubeOk κ → ∃ row ∈ coverCore, ∃ f,
     PatternEmbedsUnder row.pattern f κ`; and
   - `not_realizesCube_of_coverCore : CubeOk κ → ¬ RealizesCube x κ`, where
     `RealizesCube x κ` includes `Function.Injective x` and the per-class
     equidistance facts needed by `motif_transfer`.

   `CubeOk κ` alone must NOT imply `False`: combinatorially valid but
   geometrically dead cubes are exactly what the census enumerates.

   First measure direct `decide`/DFS certificate size on the frozen snapshot.
   If that exceeds the build budget, use a generated search certificate or a
   checked DRAT/LRAT-derived artifact; do not trust the current overwritten
   CaDiCaL CNF or stdout verdict. The format-selection experiment and its stop
   thresholds are matrix A11-COVER-FMT. DRAT verification and core/LRAT
   extraction are implemented and integration-tested. The verified-LRAT
   route is selected below; terminal certificate size/check time remains open.

   **LRAT-route base encoder LANDED 2026-07-09**
   (`Census554/CoverCnf.lean`): a variable-for-variable, clause-for-clause
   Lean port of `sat_cover.py`'s base encoding (one-hot selection, C2 NAND,
   C4 Sinz counters) as `baseDimacs`/`baseCnf : Std.Sat.CNF Nat`, with five
   `native_decide` anchors against the Python ground truth (candidate counts
   210/43/16/210×8, 1949 x-vars, 27286 vars, 207969 clauses, 143883 C2
   clauses) and a rendered DIMACS verified **byte-identical** (all 2,821,218
   bytes) to `CoverInstance().dimacs()` on the empty bank. Candidate tables
   are nullary defs so the compiled anchors evaluate in ~13 s (the naive
   per-literal recomputation took 2001 s). Still open on this sub-lane: the
   banked-pattern `y`-layer emitter over the frozen terminal manifest, the
   completeness lemma `CubeOk κ → the derived assignment satisfies the CNF`
   (Sinz counting aux + one-hot + NAND + indicator layers), and the terminal
   `verifyCert_correct` replay.

   **LRAT plumbing VALIDATED end-to-end 2026-07-09** on a real forced-UNSAT
   instance (base CNF + the smoke-gate-3 C2-violation units `272`, `483`):
   `cadical --no-binary --lrat` → 1,951-action ASCII certificate →
   `Std.Tactic.BVDecide.Reflect.verifyCert (baseCnf ++ units) cert = true`
   directly — **no drat-trim conversion, no clause-ID compaction, and no
   detautologization were needed** (cadical's LRAT IDs continue contiguously
   from the 207,971 originals, and `parseLRATProof` accepts the ASCII output
   as-is). The v4.29-targeted `piqd-lrat` port is therefore NOT required.
   A11-COVER-FMT format selection: **verified-LRAT route CONFIRMED**; the
   remaining unknown is only the terminal certificate's size/check time,
   measurable when the loop reaches UNSAT.

   **Sinz completeness core PROVEN 2026-07-09** (`Census554/SinzSat.lean`):
   `sinz_sat` — for any assignment with at most `k` true inputs, the
   canonical counter witness `sinzExt` satisfies every clause of
   `sinzClauses` (all six clause families) — plus the DIMACS↔`Std.Sat.CNF`
   evaluation bridge `evalClauseD_toLit`. Axioms: core only (propext,
   Classical.choice, Quot.sound); no sorry. This is the reusable core of the
   completeness lemma; the remaining composition (one-hot exactly-one, C2
   NAND, C4 counting from `CubeOk`, block disjointness, pattern `y`-layer)
   is still open.

   **Base-CNF completeness PROVEN 2026-07-09** (`Census554/BaseSat.lean`):
   `baseDimacs_sat`/`baseCnf_sat` — an index-level candidate selection
   `idx : Nat → Nat` obeying index-level C2 (`interCard` ≤ 2 pairwise) and C4
   (per-point-pair center count ≤ 2) constraints yields a satisfying
   assignment for the whole base CNF (one-hot + C2 + C4 layers composed via
   threaded `sinzExt` folds mirroring `onehotClauses`/`c4Fold`). Axioms: core
   only; no sorry. Deliberately index-level, not `Finset`/`CubeOk`-level —
   still open: the bridge from `CubeOk κ` down to these index-level
   hypotheses (needs a candidate-enumeration completeness anchor: every
   `IsCandidateClass` mask appears in `candMasks p`), the banked-pattern
   `y`-layer emitter, and the terminal `verifyCert_correct` replay.
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
   The same file now contains the compiled support-injection bridge described
   in step 3. Not yet imported by the leaf — wiring is step 5.
5. **Leaf discharge at card 11**: from steps 1–4 + `D.K4` +
   `capProfile_eq_554_of_card_eq_eleven`, derive `False` under
   `D.A.card = 11` at the leaf, and case-split every Front-A obligation on
   `card = 11` vs `12 ≤ card`. Per A.2b this wiring does not exist and must be
   built from scratch (the profile lemmas currently terminate unconsumed).
   Implement the reusable theorem
   `Census554.false_of_cardEleven_twoLargeCaps` in
   `Census554/Card11.lean`; it consumes the cap frame, geometric bridge,
   `coverCore_covers`, and `not_realizesCube_of_coverCore`, and returns `False`
   without any liveData row hypotheses. Then invoke it in both Front-A
   declarations before their
   card-at-least-12 residual proofs. This step begins only after the step-1
   necessity bridge, step-2 cover-core replay, and step-3 cover theorem are
   kernel-checked. **Status: OPEN (matrix A11-CONSUME).**

### A.2b Leaf wiring facts (U1LargeCapRouteBTail.lean, mapped 2026-07-09)

- All 79 case sorries (lines 3792–5887) live inside **one** declaration:
  `u1_largeCap_routeB_tail_liveData_false` (line 3525) — leaves of a nested
  ordered-subcube case tree over source-point identity and label
  permutations. The exact decomposition is 24 `q = t2[0]` ordered-subcube
  leaves, 24 `t1 = t2[0]` source-slot leaves, 24 `t3 = t2[0]` source-slot
  leaves, and 7 terminal center branches (`q`, `t1`, `t2`-named,
  `t2`-row-failure, `t3`, `u`, fresh). Matrix rows LIVE-* own these families;
  a lower-level agent should factor one consumer per orbit family rather than
  patch 79 leaves independently. The t1 band is not one polarity: six holes
  are the positive `ht1Row_l1` branch when the source slot is `l1 = t1`, and
  the other eighteen are negative `ht1Row_l1` branches. Matrix LIVE-T1
  therefore requires two consumers, not one overgeneralized lemma.
- The kernel spine additionally shows leaf 2's compiled proof reaching
  leaf 1 (`DoubleApexOffSurplusSharedRadiusPair`) through the
  `false_of_center_p_t2_t20 → … → exists_removableVertex_of_twoLargeCaps`
  chain, so closing Front A requires BOTH leaf 1 and the 79 case leaves (or
  a refactor of the case tree).
- The declarations at lines 6075/6127 are thin re-exports into
  `Erdos9796Proof.P97.U1LargeCapRouteBTail`, not duplicate obligations. Within
  the leaf-1 declaration/export pair, the only proof hole is at line 2702;
  this does not discount the 79 holes in leaf 2.
- **The card-11 handoff is not wired**: `capProfile_eq_554_of_card_eq_eleven`
  terminates in profile facts ((5,5,4), interiors (3,3,2), and the
  `MultiCenter/CapProfile.lean` vocabulary translations) with no further
  consumers. No `D.A.card = 11 → False` packaging, no card-11-vs-≥12 split
  of the leaf exists anywhere in the tree. A.2 step 5 therefore includes
  building that split and contradiction packaging from scratch.

### A.3 Card ≥ 12 residual

Evidence sources: `scratch/census-12-gate/STATE.md` and
`census/candidate_d_probe/report.md`, digested 2026-07-09.

Cap profiles at card 12 (sum 15, parts ≥ 4, at least two parts ≥ 5):
(6,5,4), (5,6,4), (5,5,5); {4,4,7} excluded (STATE.md:33-45). Only (6,5,4)
was measured ("654_all"; the "_all" cut set includes one CONJECTURED
narrowing, STATE.md:192-208). Readout = **no observed convergence** over the
measured 65+ iterations: 256 bank rows, 158 window shapes before the two
offline full-cube additions, and 20,322 pre-addition orbit instances; the raw
evidence is `iters12_654_all.jsonl`, `cegar12_654_all.log`, and
`run_census12_654_all.log` (digest in `docs/closure-plan-2026-07-06.md:567-570`).
All 256 current certificate files exist and the recorded full-bank verifier
passed, including offline `pat_00255`. The canonical family-size estimate is
approximately 5e20 (`STATE.md:286-297`). The (5,5,5) profile was never run to
depth; (5,6,4) was deliberately unmeasured (STATE.md:47-52).

**Three provably different regimes above card 11:**

- **Card 12–14 ("the head")** — finite at each fixed cardinality but with no
  known closing cover. Candidate C is CONJECTURED, not an established route.
  Sampled evidence is n=13 300/300 dead and n=14 160/160 dead, with observed
  kills localizing to at most eight-point windows
  (`census/candidate_d_probe/report.md`, sections 3 and 5.C). Against that,
  the sole n=12 profile run did not
  converge, used a cut set containing a CONJECTURED exclusion, and omitted two
  labeled profiles. A head census is therefore an expensive narrowing
  experiment whose success criterion is a checked cover, not merely more dead
  samples.
- **Card ≥ 15 ("the tail") — the pattern-census route is FALSIFIED.**
  Explicit realizable admissible witnesses at n = 15, 16, 20 (three
  independent constructions, 50–60-digit verification) survive every
  equality-shaped strengthening of the leaf's proven combinatorial shadow
  (`census/candidate_d_probe/report.md:56,105`). No pattern bank can cover the
  tail; the uniform-n ideal-theoretic extrapolation is false (same file,
  line 163).
- **Only non-excluded tail route: Candidate D** — synthetic
  convexity-coupled forcing of the shared-radius pair refuted downstream by
  `oppCap2_escape_gen`. The completed Candidate-D probe gives three reusable
  proved cuts (`m ≤ 2`; vertex-pair packets have `s = 0`; `s = 2` is
  straddle-only), but 13/19 decorated minimal-window types are realizable and
  even granting every conjectured per-type kill leaves token-level evasions at
  n=12..16. The next finite research gates are the seven-variable `SUB2-H`
  half-disk statement and then the Q3 two-center sweep
  (`census/candidate_d_probe/report.md`). Neither is currently a proof route:
  SUB2 is CONJECTURED after solver timeouts, and the probe explicitly says
  cross-center coupling beyond per-type exclusions is required.

Consequence, stated plainly: **Front A has no complete known route.** Card 11
has a finite-census closure candidate through A.1/A.2, but it is NOT closed:
the census is paused without a terminal result, and the necessity bridge,
cover-core replay, verified cover check, and leaf wiring remain open. The
motif-support extension is now proved.
Card 12–14 remains a finite but presently nonconvergent census research lane;
card ≥ 15 requires Candidate-D-shaped new mathematics. Neither lane addresses
the independent LIVE-* case families in leaf 2.

**Decision A-HEAD (matrix AHEAD-DEC):** either (a) hold the entire
card-at-least-12 residual while prioritizing Candidate-D/liveData mathematics,
or (b) authorize a head-only narrowing attempt. Route (b) must first remove
the CONJECTURED `all` cuts, run all three labeled card-12 profiles under PROVEN
cuts, then cover all six labeled card-13 and ten labeled card-14 profiles listed
in matrix AHEAD-SPEC. It must define resource and nonconvergence stops before
launch and land a named card-at-least-15 residual as the consumer of a proved
12–14 cover. More dead samples without a cover do not justify the split.

---

## Front B — M44 lane (leaves 3, 4, 5)

### B.0 Verified structure (2026-07-09 source + slot3 doc tail)

All three leaves are producer gaps sharing one core: at M44, `A` is unbounded
(`surplusCap.card + 5 = A.card`, `Cap/PartitionFromMEC.lean:450`) and unlabeled
points live in the surplus cap interior. The producers demand, per non-fixed
center, a fully-labeled equidistant 4-class whose mask is in the generated
candidate tables — i.e. **confinement**. The pinned residual supplies exactly
one labeled circle (the `.v` selected class, SurplusM44Packet.lean:4390);
no non-circular producer exists in the repo (slot3 tail, six checkpoints
2026-07-09; independently confirmed against the statements this session).

Coordination snapshot: other proof-blueprint sessions own the erased-pin,
pinned-surplus, and liveData branches. Before editing any of those files, run
`proof-blueprint anchor list`; do not take a row whose owner is active. Anchors
are advisory, so file changes still require a fresh diff read.

### B.1 Endpoint residual producer (leaf 4)

`isM44EndpointResidualsExcluded` has exactly two holes, at
`RemovableVertexAxiom/Base.lean:10082` and `:10104`. `ResidualCoreData` already
produces the ten point labels, injectivity, point membership, the two fixed
`.v/.w` selected-class masks, and the terminal contradiction from any shadow
that is both in the endpoint bank and a metric shadow. The left and right
holes must each produce exactly:

```text
∃ shadow,
  endpointShadowInBank xLabel shadow = true ∧
  EndpointMetricShadow pointOf shadow
```

Implement mirror theorems in
`EndpointCertificate/GeometryProducer.lean` (matrix END-L and END-R), then
replace each inline `hshadow` proof by one theorem call. The genuine open
content is selection and confinement of the non-`.v/.w` center classes:
exactly four labeled members, same-radius interpretation, center exclusion,
circumcenter/no-three bounds, and `sepOKFor`. Reuse
`endpointLeft_residual_exists_endpointShadowInBank_of_mask_interfaces`, its
right mirror, and the `pointPairClassCount_le_two_of_sameRadius` family; do not
rebuild bank transport. Acceptance: the two Base holes disappear and
`isM44EndpointResidualsExcluded` leaves the spine-open list.

### B.2 Pinned-surplus general-m residual (leaf 3)

The label-complete path is closed.  Both halves of
`isM44PinnedSurplusNonVExactShapeProducer` now require
`S.surplusCap.card = 5` and prove, for each pinned residual and fixed ten-label
geometry, the exact output

```text
∃ supportClass : Label → Finset ℝ²,
  PinnedSurplusSupportClasses pointOf sstar
    (pinnedSurplusCenterClass A pointOf radius wRadius supportClass)
```

where `PinnedSurplusSupportClasses` means (i) same-radius classes at every
center other than `.v/.w`, and (ii) membership of every resulting point mask
in `candidateMasks sstar center`.  The metric-shadow assembly and checked
row-zero contradiction also close this `m = 5` regime.  The focused producer
and bank targets build; `PinnedSurplusProducer.lean` contains no `sorry`.

The one remaining leaf is
`isM44PinnedSurplusGeneralMResidualsExcluded`, stated directly with
`5 < S.surplusCap.card`.  Do not route it through exact ten-label masks.  The
empty-residue generator census only classifies facts after selecting a
singleton leaf.  The finite coverage probe
`scripts/pinned-generalm-certificate-coverage.py` finds a model defeating all
available leaves in every one of the 15 fixed `.v/.w` rows at nonfixed
labelled-cardinality floors 2 and 3, even with cyclic cross-separation and the
global point-pair class-count bound.  Coverage returns only at floor 4.

The first larger-regime reduction is now proved, without adding a second
obligation.  The orientation-specific theorems
`CounterexampleData.exists_pinnedRightExtraCriticalPacket` and
`CounterexampleData.exists_pinnedLeftExtraCriticalPacket` choose an additional
surplus-interior point `y` outside the pinned four-class.  That class survives
in the skeleton with `y` and its pinned apex erased.  Minimality then produces
a `U3LocalizedNoQFreePacket D y p`, forces `p` to differ from the pinned apex,
and supplies a `U3FixedTriplePacket D y p t1 t2 t3`.  The on-spine theorem also
constructs `D.Minimal` and a `CriticalShellSystem A` before its sole `sorry`.

This extraction does not reduce `m` or confine the additional surplus points
to the existing ten labels.  The remaining theorem must derive `False` from
the critical-shell system together with either orientation's extra critical
packet.  A route through U2/U5 Mode A or non-surplus containment would be
circular at this source site unless its required input is proved independently.

Matrix PIN-R and PIN-L are DONE; PIN-GENERAL owns the open leaf.  Acceptance:
prove a direct extra-critical-packet obstruction, or establish an independent
confinement/certificate theorem strong enough to imply it.  Remove the sole
`PinnedSurplusBank.lean:318` `sorry` and confirm the named general-m residual
leaves the spine-open list.

### B.3 Erased-pin generated row bank (leaf 5 lane)

Exists in Lean (`ErasedPinFixedSeedDFS.lean`): 330 deduplicated fixed seeds,
26 row definitions, each with a
`*_candidates_false_of_isValidOneSidedSeedRelaxedShapeShadow` exclusion
theorem, plus the generic bridge
`false_of_erasedPinFixedSeedRelaxedShape_pointClasses`
(SurplusCOMPGBankGeometry.lean, built and checked 2026-07-09).

The on-spine theorem contains four holes. Matrix ERASE-P4-U and ERASE-P4-S
own the direct surplus-opposite and surplus-interior contradictions at
`Continuation.lean:183` and `:211`; each already receives an exact
`U5DangerousTriple`, selected candidate, exact radius-class count, and two
off-circle auxiliary points. The missing output is `False`, via either
row-confined classes plus Mode A or a new direct surplus-index contradiction.

Matrix ERASE-P2-R and ERASE-P2-L own the non-surplus ordered-scaffold holes at
`:312` and `:337`. Their current broad local goals assert
`OneSidedSeedCandidateRemainder` from too little data and are FALSE as general
lemmas (the Boolean counterexample permits cross-separation while `.u` is
absent from `candidateMasks`). Do not try to prove those local assertions.
Refactor the consumer to take the already defined side-specific surfaces
`ErasedPinRightFiniteCandidateOrderedScaffoldFacts` and
`ErasedPinLeftFiniteCandidateOrderedScaffoldFacts`, prove those from the
concrete ordered mask interface, and feed the existing
`rightFiniteCandidateSepFacts_of_*` consumers.

Existing finite side:

- `ErasedPinFixedSeedDFS.lean` contains 330 deduplicated fixed seeds and 26
  row-exclusion theorems;
- `false_of_erasedPinFixedSeedRelaxedShape_pointClasses` is the generic checked
  bank consumer; and
- side-specific ordered and separation scaffold adapters are already defined
  in `RemovableVertexAxiom/Base.lean:5997-6247`.

The optional P3 diagnostic gate is not a proof obligation. To run it, first
implement the erased-pin row-to-multi-center-class map (matrix ERASE-P3-MAP),
then execute the CONJECTURED-tier sweep and record whether a proposed new cut
separates every surviving row (ERASE-P3-SWEEP). Any discovered cut becomes a
proof task only after its geometric necessity theorem and exact consumer are
stated. No existing census result closes any of the four holes by itself.

---

## Cross-cutting C — multi-center census (off-spine research)

This work does **not** currently feed a Front-B producer or either Front-A
`sorry`. It remains useful finite-alphabet infrastructure, but it is not a
direct closure task until an explicit consumer theorem is stated.

Empirical status (`census/multi_center/STATE.md`): L2/full, GLOBAL tier,
PROVEN cuts, n=12..32 has 977,975/977,975 SAT, 0 UNSAT, 0 INDETERMINATE, with
3,375 cumulative class keys and zero fresh GLOBAL keys on n=25..32. Exact
LOCAL scans are flat against the same key set through n=64. Verdict:
**STABILIZED-EMPIRICAL**, not a general-n theorem. The CONJECTURED-tier run is
only an n=12..15 smoke (11,223/11,223 SAT); the targeted appendix is open.

Proved Lean boundary:

- the 21-cell independent LOCAL enumerator is complete for the scoped
  L2/full-participant class object;
- its accepted keys equal the 3,375-row typed bank;
- all six profile-preserving center permutations and all 489 generated
  profile rows are checked; and
- `ProfileClassIncidence.completesL2FullFrom_representativeSurface` is
  kernel-checked.

This proves completeness of a generated **representative surface**, not
geometric GLOBAL realization. The abstract LOCAL persistence layer is also
already proved: `ProfileRealizationSurface.localInventory_stepPersistent`
follows from `ProfileStepExtends`, and
`JointClass.locallyAdmissible_extendCap` supplies cap-capacity monotonicity.
Therefore "prove T2 persistence" is not one undifferentiated remaining task.

If this lane is resumed, matrix MC-* gives the only dependency order that can
make it closure-relevant:

1. define a concrete geometric `ProfileRealizationSurface` and prove the
   extraction theorem `extractedClass_locallyAdmissible` field by field;
2. prove `GlobalSound` for that surface and the exact profile-occurrence
   extension needed by `ProfileStepExtends`;
3. prove geometric LOCAL-to-GLOBAL completion (`CompletesGlobalFrom`) or an
   independently sufficient GLOBAL upper-bound theorem — this is T1, still
   open mathematics; and
4. state and prove a consumer whose hypotheses are available in
   `DoubleApexOffSurplusSharedRadiusPair` or
   `u1_largeCap_routeB_tail_liveData_false` and whose conclusion supplies a
   field those declarations actually use.

Until step 4 has an exact statement, MC-* is OFF-SPINE RESEARCH and must not
introduce a `sorry`. Forward persistence alone yields only qualitative
eventual constancy; it does not prove `inventory(n) = inventory(25)` or the
geometric shared-radius pair.

---

## Ordering and sizing

There are four independent open-mathematics clusters. None has a complete
known mechanism:

1. **Front-A shared-radius tail:** Candidate-D cross-center convexity coupling
   for `DoubleApexOffSurplusSharedRadiusPair` above the finite card-11 slice.
2. **Front-A liveData families:** the three 24-leaf permutation bands and seven
   terminal center branches in `u1_largeCap_routeB_tail_liveData_false`.
   Closing the shared-radius theorem removes only one downstream dependency;
   it does not close these families.
3. **Front-B endpoint/pinned confinement:** construct labeled same-radius
   classes at every non-fixed center for END-* and PIN-*.
4. **Front-B erased-pin confinement:** the two direct surplus P4
   contradictions and the side-specific P2 ordered-mask producers.

The card-11 finite pipeline contains substantial engineering and finite-proof
work, but it is not uniformly "bounded to 1–3 sessions": final cover format,
cover-core size, and heavy-certificate cost are not known until the run freezes.

**Paused at the final 2026-07-09 audit checkpoint:** the card-11 (5,5,4)
cover loop had 5,431 bank rows and had printed the frontier at iteration 1154.
No process or terminal marker was live at 18:32 PDT. Do not restart it until
the A11-OPS-* permanence, driver-lock, transaction, and terminal-artifact
gates pass.

Execution order is dependency-based, not difficulty-based:

1. **Stabilize operations and ownership.** Resolve the concurrent generated
   rewrite; refresh the mined graph and `anchor list`; move Census554 into
   `census/census_554/`; finish the driver/transaction locks and durable
   terminal gate; do not start a census driver before those rows pass.
2. **Advance bank-independent card-11 proofs.** Build
   `GeometryBridge.lean` and the abstract combinatorial/geometric cover
   interfaces. The support-injection bridge is already DONE. These consume no
   final bank.
3. **Freeze on a terminal census result.** On ALIVE, stop the cover route and
   adjudicate the candidate. On UNSAT, persist the exact CNF/manifest/digests,
   independently verify the frozen bank, and generate a checked cover witness.
4. **Minimize before replay.** Extract the pattern IDs used by the checked
   cover, then generate and replay that core only. Apply certificate shrinking
   or checker optimization only to heavy certificates that survive the core.
5. **Close and wire card 11.** Prove `false_of_cardEleven_twoLargeCaps`, invoke
   it in both Front-A declarations, and leave explicit card-at-least-12
   residuals.
6. **Work the four open-math clusters under their active owners.** END/PIN and
   ERASE rows may proceed independently of Front A. LIVE rows should be
   factored by orbit family, not patched leaf by leaf.
7. **Run optional research gates only when their decision row authorizes
   them.** AHEAD-* is a narrowing experiment; ERASE-P3-* is diagnostic; MC-*
   remains off-spine until an exact consumer exists; SUB2/Q3 are Candidate-D
   research, not claimed closure steps.

The closure matrix is the dispatch surface. A low-level agent takes exactly
one row, verifies that its dependencies are DONE, claims the corresponding
spine branch when applicable, and returns the named deliverable plus its gate
output. It must not silently substitute an easier statement.

## Change control

This document supersedes ad-hoc status narration. Any status change must update
both this plan and `docs/closure-matrix-2026-07-09.md`, cite a source artifact
or kernel query, and distinguish source-current evidence from the last compiled
kernel snapshot. A row is DONE only when its stated consumer and acceptance
gate pass; a successful exploratory script is evidence, not proof closure.
