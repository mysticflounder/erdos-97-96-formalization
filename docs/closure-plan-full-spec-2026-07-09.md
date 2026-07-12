# Current Closure Plan — Problem 97/96 (2026-07-09)

This is the single active route plan to
`proof-blueprint verify-publish` green on `Problem97.erdos97_rhs` and
`Problem96.erdos96_rhs`. The executable task register is
`docs/closure-matrix-2026-07-09.md`; this document owns route rationale and
dependency order. The full-plan audit is
`docs/audits/2026-07-09-full-closure-plan-audit.md`.

It consolidates the decision-relevant content of the former 2026-07-06 master
plan. That detailed record is [archived](../archive/2026-07-10-closure-plan-consolidation/closure-plan-2026-07-06.md)
and is evidence for rejected routes and dated solver results, not a dispatch
authority.

## Authority and snapshot protocol

The numerical snapshots in this plan and the matrix are dated evidence, not
current truth. Before dispatching or reporting a row, run the matrix's
`CTRL-GRAPH` and `CTRL-OWN` gates and record the timestamp, source-index state,
build/mining fingerprint, open theorem names, and source artifact. Do not infer
currentness from a prior line number, node count, or anchor.

Before proposing a new finite-pattern, row-slot, incidence, or local-metric
contradiction, complete the mandatory theorem-bank preflight: inspect every
registry named in `AGENTS.md`, search the indexed corpus with
`nthdegree docs search --lean`, and record the candidate's normalized
statement, source/import reachability, closure status, field-by-field map from
the live packet, first missing antecedent, circularity check, and immediate
spine consumer. A negative compatibility result is a valid deliverable; a
consumer without its geometric producer is not a closure route.

## Current inventory (updated 2026-07-11)

Six declarations / 88 textual holes after the K-B-END route-(b) split
(commit 136ebb9b; verified by the 2026-07-11 freshness audit,
`docs/audits/2026-07-11-closure-plan-freshness-audit.md`):

| # | Leaf | Current source | Textual holes | Front |
|---|------|----------------|---------------|-------|
| 1 | `U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair` | `U1LargeCapRouteBTail.lean:2657` | 1 | A |
| 2 | `u1_largeCap_routeB_tail_liveData_false` | `U1LargeCapRouteBTail.lean:3525` | 79 | A |
| 3 | `isM44PinnedSurplusGeneralMResidualsExcluded` | `RemovableVertexAxiom/PinnedSurplusGeneralM.lean:704` | 1 | B |
| 4 | `isM44EndpointGeneralMResidualsExcluded` | `RemovableVertexAxiom/Base.lean:9511` | 1 (`:9513`) | B |
| 5 | `isM44EndpointResidualsExcluded` | `RemovableVertexAxiom/Base.lean:9521` | 2 (`:9555`, `:9578`) | B |
| 6 | `isM44NonSurplusContainmentErasedPinTripleResidualsExcluded` | `RemovableVertexAxiom/Continuation.lean:107` | 4 | B |

Leaf 4 is the general-m endpoint leaf created by the split; leaf 5's umbrella
calls it in the `m ≠ 5` branch, so it is a current proof-spine obligation
(matrix rows K-B-END-LABEL / K-B-END-GENERAL). `sorryAx` is the synthetic
kernel marker reached through these declarations, not a seventh obligation.

Historical snapshot (audited 2026-07-09, build fingerprint `002b0247c64e`):
five declarations / 87 holes; P97 spine 23/1827 open; P96 spine 27/1835
open; endpoint umbrella then at `Base.lean:10070` with holes
`:10097`/`:10119`.

The 88 textual holes collapse to the six declarations above. The matrix
decomposes them into producer families and also records non-`sorry`
prerequisites such as Census554 cover verification and final publication
gates.

**Reproducibility checkpoint (dated 2026-07-09).** The focused pinned-surplus
build was green, and proof-blueprint reported build fingerprint
`002b0247c64e` with 6024/6024 mined symbols fresh. It saw two uncommitted Lean
paths, `PinnedSurplusBank.lean` and `U3ToU5Terminal.lean`. The source
declarations remained open, so this was checkpoint evidence, not a passing
publication gate. Re-run `CTRL-GRAPH` rather than reusing these particulars.

## Execution contract

Every matrix row must identify an existing spine consumer before adding a new
`sorry`. New helper statements land sorry-free; if a genuinely new open
theorem is unavoidable, its consumer must land in the same change so the new
declaration is immediately on the kernel spine. No wrapper-only reformulation
counts as progress.

For a Lean row, acceptance is:

1. `proof-blueprint anchor list` and a fresh diff show that no active owner is
   being overwritten; a closed or stale anchor is cleared by its owner, never
   by another session;
2. no other top-level build or direct Lean compile is active in this project;
3. `lake-build <smallest affected module target>` succeeds;
4. `proof-blueprint index --refresh` reports the source index in sync;
5. `proof-blueprint refs --refresh`, then `proof-blueprint refs --check`,
   establish that the mined graph describes that build;
6. `proof-blueprint spine <consumer-symbol>` shows the intended dependency;
7. `proof-blueprint axioms <new-terminal-symbol>` shows only Lean core axioms
   (including `Lean.ofReduceBool`/`Lean.ofReduceNat` when present) and the
   explicitly approved `Lean.trustCompiler` boundary when `native_decide` is
   used;
8. for every `native_decide` terminal, the evaluated decision-procedure
   closure is audited for `unsafe`, `@[implemented_by]`, and `@[extern]`; and
9. the row's targeted tests in the closure matrix pass.

Only the final publication row runs the full project build, refreshes kernel
references, and invokes `proof-blueprint verify-publish` on both targets.

Two fronts. Front A is the two-large-cap (¬M44) branch; Front B is the M44
branch. They are disjoint on the spine (the `removableVertexOfLarge` case
split: `of_isM44PinnedSurplus` vs `of_nonIsM44`).

## Retained decisions from the archived 2026-07-06 plan

The archive preserves detailed logs; these constraints remain active here:

- exact two-hit witnesses refute the former interior one-hit bounds, so the
  erased-pin route must use the specified P4/P2 producers rather than revive
  `leftAdjCount ≤ 1` or `rightAdjCount ≤ 1`;
- the exact ten-label bank closes only the `m = 5` pinned-surplus regime; it is
  not a general-`m` coverage theorem;
- equality-only and pattern-only statements do not close the card-`≥ 15` tail.
  Their known falsifying witnesses are non-convex, so they do not refute the
  actual `ConvexIndep` leaf; they rule out only that relaxed proof surface;
- multi-center work is off-spine until `MC-CONSUMER` has an exact theorem whose
  hypotheses occur at a Front-A leaf; and
- `Lean.trustCompiler` is the approved native-decision boundary, while anchors
  are ephemeral coordination hints rather than durable proof state.

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

### A.1 Card-11 slice — formalized-structure CEGAR active

Pipeline (`scratch/census-554/frontier_loop.py`): lazy motif-embedding cover +
CEGAR mining at genuine frontiers, to UNSAT.

At the 2026-07-09 audit, the 18:32 snapshot was paused at 5,431 rows /
iteration 1154. A later process resumed it; at 19:40 PDT, lock-consistent file
evidence showed 5,444 raw bank rows and the log at iteration 1240. Direct
process-list access was sandbox-blocked. This is historical bank/log evidence,
not a current process claim: recheck A11-RUN before resuming, restarting, or
interpreting a terminal marker. There was no adjudicated terminal result at the
snapshot.

**Durable checkpoint, 2026-07-11.** The algebra bank was frozen at 5,836 raw
rows, SHA-256
`36348d35397a494bee5ac0ab9e423c20802e7aff45fa12f0530df36a57cfc43a`.
A merged separation probe at
`scratch/census-554/separation_probe_runs/transition-bank5836-structural36-20260711T185116Z`
reached a checked `combined-frontier` at iteration 231 with 1,602,162 dynamic
exclusions and 156,278 static instances, hence 1,758,440 total instances. Its
checkpoint SHA-256 is
`a34b5be871dc096fcdccab389955787cd9541c54b59afd609c209b17f7183ff8`.
The immutable ordered replay of every dynamic record passed, the source
database reopened with `integrity_check=ok`, and that terminal source remains
preserved as rollback evidence.

The mandatory theorem-bank preflight then found a convex structural
contradiction before algebra mining: four sparse rows force labels `3`, `8`,
and `10` onto the perpendicular bisector of the distinct foci `1` and `6`.
`Census554/FourRowPerpBisector.lean` packages this as the reusable,
relabel- and superpattern-stable
`FourRowPerpBisectorCore`; the focused build and both public axiom audits use
only `propext`, `Classical.choice`, and `Quot.sound`. This is a convex-carrier
consumer, not an unconditional `IsDead` or Nullstellensatz-bank theorem.

The approved static structural seed artifact has SHA-256
`be498bc8e31f32fa29d12f0a37c2c8776ce80dc16ab8c9d56b00396785372ad9`
and exactly 36 profile-orbit exclusions. The probe snapshots the seed, source
frontier result, and Lean theorem source separately; requires passed build
evidence; and rejects transition-time orbit loss, theorem-source drift, or
evidence downgrade.

The CEGAR refinement oracle now covers the formalized structural core rather
than only this one static seed. The catalog contains all twelve alternatives
in `GeneralCarrierBridge`; eleven are soundly detectable from a raw equality
cube. The exact-off-circle alternative is explicitly disabled because a raw
cube does not supply its required `ExactAt` premise. The eligible surface is
nine unordered theorem families plus the convex five-point and convex
rhombus/equilateral families, with both direct and reversed cyclic-order
detectors. Every emitted record carries a minimized equality pattern,
replayable row/flip closure paths, the exact Lean theorem and source hash, and
its pattern-orbit map. Unordered cores emit unconditional sparse cuts. Ordered
cores emit clauses scoped to the compatible boundary-order selector, becoming
unconditional only when every valid order is excluded. Bank-motif refinement
runs first; the structural scan runs exactly when the candidate has no new
bank embedding.

The oracle snapshot also freezes ten Lean source files and the built
`GeneralCarrierBridge.olean` (SHA-256
`9104b9a9d466801ab0894e5e2ff993d3ec91cbee4411ffb41c3b52342e09b96b`).
`lake-build Erdos9796Proof.P97.Census554.GeneralCarrierBridge` passed with
proof-blueprint build fingerprint `294acadba613`; the terminal axiom query is
exactly `propext`, `Classical.choice`, and `Quot.sound`. The Python catalog,
source snapshots, build artifact, and axiom result are evidence-bound by the
oracle contract, and transition replay fails closed on structural provenance
conflicts or algebra/structural provenance collisions.

A second preservation-first transition published
`scratch/census-554/separation_probe_runs/run-20260711T204242Z-40533-f03a883e`
with all 1,602,162 dynamic records retained, 156,278 static instances,
1,758,440 total instances, and zero target collisions. Its independent SQLite
reopen returned `integrity_check=ok` and the exact dynamic-record count. The
new probe is active with a four-hour wall budget and 5,000-refinement ceiling,
holds the run lock, and checkpoints every iteration. Treat its `progress.json`
as the live status surface rather than copying a quickly stale iteration count
into this plan.

This mixed-source machinery is valid for externally trusted CEGAR exploration,
not yet for final Lean publication. Python detections and boundary-order tests
are replayable and theorem-linked, but are not Lean proof terms. Final
publication still requires a checked Lean replay of every used structural
record, including a checked bridge from the Python direct/reverse order test to
the corresponding Lean orientation premise.

**Correct interpretation of a future solver UNSAT:** CaDiCaL UNSAT would be an
EMPIRICALLY VERIFIED coverage result for the exact emitted Python CNF and its
frozen formula sources. In an algebra-only run it says that every candidate
cube contains an encoded bank-motif instance. In the active mixed-source run
it says that every candidate cube hits either an algebra motif or a separately
identified convex structural exclusion. It would not, by itself, prove the
geometric card-11 theorem or close a Lean leaf. The permanent
terminal publisher now re-solves the persisted CNF, requires `drat-trim`
verification, emits core CNF and LRAT artifacts, takes a lock-consistent bank
snapshot, and records source row, canonical motif, support injection, emitted
pattern, and clause provenance. It writes the completion marker last. Unit
fault gates and a real tiny CaDiCaL/`drat-trim` integration test pass. The
active frozen probe separately publishes `UNSAT-verified` only after a
proof-producing re-solve and `drat-trim`; that remains an empirical CNF result,
not the final cover publication or Lean replay. The mandatory consumer command
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
pass. The current frozen probe was launched after the safe transition and holds
its lifetime workdir lock; the stopped historical rollback process was neither
killed nor resumed. Permanent migration is partial:
`census/census_554/` owns the protocol, terminal gate, structural auditor,
combinatorial core, and self-contained smoke/tests, while the driver, miner,
verifier, changing bank, and large certificate artifact remain under
`scratch/`. See
`docs/audits/2026-07-09-census-554-parallel-work-audit.md`.

Stop conditions that would revise this section: a frontier cube with no
minimal dead pattern (a genuinely ALIVE cube ⇒ the census finds a candidate
11-point counterexample-consistent class system — a mathematical finding, not
a tooling failure), or systematic certify failure.

**ALIVE adjudication contract.** Keep three claims distinct: an ALIVE Boolean
cube, an exact-coordinate `RealizesCube` witness, and a configuration satisfying
the full Front-A leaf hypotheses. The first is only a cover failure; the second
needs an independent exact realization check; only the third can challenge a
geometric necessity claim. The outcome record must identify its level, complete
assumption ledger, source hashes, and independent verifier before any restart or
route change.

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

   **Conditional equality-core reduction.**
   `Census554/EqualityCore.lean`, `FivePointCollision.lean`, and
   `ThreeTriadCollision.lean` prove generic duplicate-center, equal-K4,
   equilateral-bisector, and three-triad deadness.  The generated-bank adapter
   emits structural proofs for all twelve equal-K4 and both
   equilateral-bisector instances among the 21 current `Bank/Pat` modules.
   This is not miner-witness validation, bank coverage, or a closure theorem.
   After a terminal core is frozen, `A11-EQUALITY-CORE` must match
   manifest IDs to checked finite core witnesses, build and axiom-audit the
   generated adapters, and measure the reduction in the replayed cover core.
   Unmatched patterns continue through the ordinary certificate route.

   **Conditional cyclic-separation reduction.**
   `Census554/SeparationCore.lean` proves the general shared-pair alternation
   theorem and encodes the `U,O2,V,S,W,O1` surface as exactly 72 internal
   orders.  `SeparationMirror.lean` adds the reflected `U,O1,W,S,V,O2`
   surface and a consumer that requires rejection of both orientations.
   `SeparationCertificate.lean` checks proof-free row/flip paths for all 144
   orders and proves that a successful Boolean check yields the two rejection
   predicates.  `SeparationGeometry.lean` proves
   `Card11CapLabeling.nonempty_directOrMirrorMacroCcwLabeling` by cutting the
   global CCW boundary at the surplus apex, sorting the cap-interior blocks,
   and using the other-apex order dichotomy to select the direct or mirrored
   surface.  `SeparationBridge.lean` composes that producer with the checked
   certificate consumer.  No concrete bank-row certificate is emitted yet.
   Do not generate or count separation-based `IsDead` rows until both finite
   rejection witnesses for each claimed row are Lean-checked; a direct-only
   72-order Python screen is not sufficient.

   **Per-module native-decision audit.** Every generated replay module and the
   assembled core bank must record its `proof-blueprint axioms` output and an
   audit of the evaluated closure for `unsafe`, `@[implemented_by]`, and
   `@[extern]`. This occurs before indexing the core bank, not only at the final
   publication gate.
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

   **Frozen final-CNF contract.** `FinalCoverData` must bind the normalized
   manifest row IDs, canonical pattern and certificate hashes, full DIMACS/CNF
   digest (including the banked-pattern `y` layer), variable and clause IDs, and
   the exact LRAT input digest. The final Lean CNF must be byte-identical after
   canonical rendering or carry a proved clause/variable correspondence used by
   `verifyCert_correct`. A regression that corrupts one mapped motif or `y`
   clause must fail. Reproving the same motif changes only that certificate's
   digest; changing a motif, cover, or manifest invalidates the frozen CNF,
   extracted core, and LRAT and restarts their gates.

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

Before a LIVE-* family receives a new local contradiction or certificate hunt,
`LIVE-BANK-MATCH` records a machine-readable map from each ordered leaf to an
existing U1/U5 consumer, or records the first unavailable or circular
antecedent. The map includes its `RowSlotLabelPacket` construction, available
equalities/distinctness facts, theorem-bank preflight result, and immediate
spine consumer. It is acceptable for a family to have no match; it is not
acceptable to add a new `sorry` or repeat a certificate search without one.

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
`run_census12_654_all.log`; those underlying artifacts, not a volatile plan
line range, are the authoritative digest source.
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
  line 163). These witnesses are non-convex, so they do not refute the actual
  `ConvexIndep` leaf; they refute only the relaxed equality/pattern surface.
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

Coordination: query ownership live with `proof-blueprint anchor list`; do
not take a row whose owner is active. Anchors are advisory, so file changes
still require a fresh diff read. (Historical 2026-07-09 snapshot: erased-pin,
pinned-surplus, and liveData branches all had active owners; the erased-pin
and liveData anchors were cleared as stale on 2026-07-11.)

### B.1 Endpoint residual producer (leaves 4 and 5)

**Updated 2026-07-11 — route (b) implemented (commit 136ebb9b).**
`isM44EndpointResidualsExcluded` (`Base.lean:9521`) case-splits on
`S.surplusCap.card = 5`:

- **m = 5 branch (matrix K-B-END-LABEL, END-L/END-R — scoped to m = 5).**
  Two `hshadow` holes at `Base.lean:9555`/`:9578` with
  `hcard5 : S.surplusCap.card = 5` in scope. `ResidualCoreData` already
  produces the ten point labels, injectivity, point membership, the two fixed
  `.v/.w` selected-class masks, and the terminal contradiction from any shadow
  that is both in the endpoint bank and a metric shadow. Apex orientation is
  SYMMETRIC, not forced (2026-07-11 prover verdict): a forcing lemma is
  equivalent to the hole itself; the two holes are exact mirrors under
  `NonSurplusSwap` (`U2NonSurplusOneHit.lean:1642`), leaving one direct and
  one reflected apex branch, with kernels
  `crossSeparationOKForMasks_of_sameRadius_ccwHull`/`_reflectedCcwHull`
  (`SurplusCOMPGBankGeometry.lean:1498`/`:1621`) reused as-is. Producer
  staging is landed green in `EndpointCertificate/GeometryProducer.lean`
  (engine + u-bound + circumcenter families; commits 8a7e6d1b, b2183714,
  35bc63aa); right-apex assembly in flight. Import boundary: `Base.lean` may
  import the producer; the producer must not import `Base.lean` or any
  consumer of `isM44EndpointResidualsExcluded` (hull-order machinery
  relocated upstream to `PinnedHullOrder.lean`, commit 858b7e39).
  Acceptance: the two Base holes disappear via producer calls.

- **General-m branch (matrix K-B-END-GENERAL).** New leaf
  `isM44EndpointGeneralMResidualsExcluded` (`Base.lean:9511`, hole `:9513`,
  stated strictly `5 < S.surplusCap.card`), routed to the forced
  `m = 6` / `A.card = 11` machinery with a scoped extension (endpoint seed
  predicates, classifier extension, one (4,2,2) bridge case, endpoint source
  consumers) — see `docs/audits/2026-07-11-endpoint-generalm-representability.md`.
  Finite gate passed 2026-07-11 with zero residuals over both 32-placement
  endpoint seed families (EXACT WITHIN MODEL, not PROVEN;
  `census/endpoint_confinement/endpoint_direct_metric_core_residuals_n11.json`).

`isM44EndpointResidualsExcluded` leaves the spine-open list only when BOTH
branches close.

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
obligation. `SurplusCapPacket.surplusInterior_card_ge_four_of_card_gt_five`
uses the strict `5 < S.surplusCap.card` hypothesis to show that the strict
surplus interior has at least four points. The orientation-specific theorems
`CounterexampleData.exists_pinnedRightExtraCriticalPacket` and
`CounterexampleData.exists_pinnedLeftExtraCriticalPacket` choose an additional
surplus-interior point `y` outside the pinned four-class and a selected
four-class at the surplus apex whose support contains `y`. That class survives
in the skeleton with `y` and its pinned apex erased.  Minimality then produces
a `U3LocalizedNoQFreePacket D y p`, forces `p` to differ from the pinned apex,
and supplies a `U3FixedTriplePacket D y p t1 t2 t3`.  The packet now also
contains the exact full `CriticalSelectedFourClass D.A y p` on
`{y,t1,t2,t3}`.  The two-circle bound forces at least one of `t1,t2,t3`
outside the pinned class.  Finally, `U3FixedTripleAuditFrame` supplies a
selected candidate `u` and two further auxiliary points `a0,a1`, all with the
required skeleton exclusions and all off the critical circle.  The on-spine
theorem constructs `D.Minimal` and a `CriticalShellSystem A` before its sole
`sorry`.  The system now retains, for every source, the deletion-failure fact
at its chosen blocker center; `CriticalShellSystem.no_qfree_erase_center_at`
exports the center-erased form consumed by localized packets.  Each orientation
extractor now returns a concrete frame, the proved terminal fact
`∀ H : U3FixedTripleAuditFrame ..., ¬ H.RowwiseConfinedQDeletedClasses`, and a
single `CriticalShellSystem` / `FaithfulCarrierPattern` preserving the pinned
exact row, the surplus-apex row through `y`, and the dangerous exact row.

For every center in this bounded frame,
`U3FixedTripleAuditFrame.auditCenters_qDeleted_or_qCritical` proves the exact
row dichotomy: either an exact-cardinality-four q-deleted K4 class or an exact
three-point q-critical class.  It deliberately does not assert that a
q-deleted class is confined to the bounded support.

This extraction does not reduce `m` or confine the additional surplus points
to the existing ten labels.  The remaining theorem must derive `False` from
the critical-shell system together with either orientation's exact critical
packet and bounded audit frame.  The finite consumer is now complete:
`U3FixedTripleAuditFrame.false_of_rowwiseConfinedQDeletedClasses` assembles
`U5ConfinedK4AuditPayload`, converts it to audited support, and invokes the
kernel-checked finite audit directly.  It uses neither `U2Statement` nor
`U5ModeA`.  Its exact remaining producer is
`H.RowwiseConfinedQDeletedClasses`: every one of the six audit centers must
have an exact q-deleted four-class contained in `U5BoundedSupport`.

Producing that proposition has two explicit subobligations.  First eliminate
or promote the q-critical-three arm of the proved row dichotomy.  Second prove
bounded-support confinement for each surviving q-deleted four-class.  A route
through U2/U5 Mode A or non-surplus containment would be circular at this
source site unless its required input is proved independently.

Matrix PIN-R and PIN-L are DONE; PIN-GENERAL owns the open leaf.  Acceptance:
prove `H.RowwiseConfinedQDeletedClasses` for one extracted orientation frame,
or prove a stronger direct audit-frame obstruction.  In the confinement route,
both q-critical-row resolution and bounded-support inclusion are mandatory.
Remove the sole terminal `sorry` in
`isM44PinnedSurplusGeneralMResidualsExcluded` and confirm the named general-m
residual leaves the spine-open list.

#### PIN-GENERAL incidence-probe checkpoint (2026-07-10)

The permanent probe at `census/global_confinement/` first searched the canonical
adjacent pinned-source/deleted-point placement for the `(6,4,4)` and `(7,4,4)`
profiles (`n = 11,12`).  It fixes the pinned and dangerous exact classes,
selects one compatible K4 row at every remaining center, and enforces the
L2/PROVEN local cuts, Q3 joint cuts, cyclic cross-separation, the two-circle
overlap bound, and the global point-pair class-count bound.  It separately
tests individual q-critical audit rows, simultaneous q-deleted survival at all
six audit centers, and eight-point confinement.  SAT is only a selected-class
incidence witness; the probe has no coordinates or distance equations.

The exhaustive declared-shadow counts are:

- `n = 11`: `364/564` dangerous rows have a full-center extension;
  `2654/3276` individual audit-center q-critical tests are SAT;
  simultaneous q-deleted survival is SAT on `3933/7280` admitted packet frames
  and UNSAT on `3347/7280`; confinement is UNSAT on all `7280` frames.
- `n = 12`: `709/935` dangerous rows have a full-center extension;
  `6082/7090` individual q-critical tests are SAT; simultaneous q-deleted
  survival is SAT on all `24815` admitted packet frames; confinement is UNSAT
  on all `24815` frames.

These results do not close PIN-GENERAL.  They show that the current incidence
cuts do not eliminate q-critical rows, and that selecting globally compatible
K4 rows does not itself prove the theorem-facing q-deleted classes.  The
all-UNSAT confinement result is a finite-consumer check, not evidence for the
missing producer.  The dangerous-row types `(0,0,2,2)` and `(0,2,0,2)` have no
full-center extension in either scan and are provisional fixed-pin elimination
lemmas.  The apparent `n = 11` elimination of `(0,0,0,4)` disappears at
`n = 12`, so it must not be promoted to a general theorem.

The follow-up scans close the original model-coverage TODOs:

- `placement_results_n11_12` covers every ordered pair of distinct surplus
  labels: 12 placements at `n = 11` and 20 at `n = 12`.  Aggregated admitted /
  rejected dangerous rows are `3779/2989` and `13700/5000`, respectively.  The
  two zero-extension types `(0,0,2,2)` and `(0,2,0,2)` remain zero at every
  scanned placement and cardinality.
- `placement_zero_types_n13` checks just those two types over all 30 ordered
  `n = 13` placements.  All 600 `(0,0,2,2)` and 1,200 `(0,2,0,2)` scenarios
  are UNSAT, with no cap.  This is a successful larger-size check, but remains
  bounded evidence.
- `zero_type_cores_n11_13` explains all 2,888 zero-type rows before DFS.  Exactly
  1,444 have an incompatible fixed pin/dangerous pair from overlap greater than
  two or cyclic cross-separation.  The other 1,444 leave `Moser-2` with an empty
  candidate domain after Q3, overlap, and cross-separation filtering.  The same
  three rejection families occur at every scanned size.  This is a complete
  bounded core partition, not yet a size-independent Lean theorem.
- `critical_shell_results_all_placements_n11_12` samples one admitted packet
  per placement and dangerous-row type.  It encodes one exact blocker shell
  for every source and requires every selected K4 at that blocker center to
  contain the source.  All `177 + 340 = 517` packets admit the joint shell
  system and a K4 at every ambient center (`517` SAT, `0` UNSAT, `0` capped in
  both stages).  The largest full search used `276052/300000` nodes.

The Lean interface now matches that enriched model: `CriticalShellSystem`
stores `no_qfree`, `exists_criticalShellSystem` preserves it, and
`CriticalShellSystem.no_qfree_erase_center_at` supplies the center-erased form.
This eliminates the prior data-loss risk.  The all-SAT result shows that shell
existence plus the current global incidence cuts is not itself the missing
contradiction.

The shell/audit coupling TODO is also complete.
`shell_audit_results_all_frames_n11_12` tests every exact q-critical row and
every six-center q-deleted frame for all 517 representatives while retaining
the joint source-indexed shells, no-q-free linkage, and full-center extension.
The adjudicated totals are:

- q-critical: `4198` SAT, `795` UNSAT, `0` indeterminate out of `4993`;
- q-deleted survival: `12894` SAT, `2546` UNSAT, `0` indeterminate out of
  `15440` frames.

The 67 initial caps were resolved in targeted passes at 1, 3, and 10 million
nodes.  The added shell constraints prune both audit families, but many models
survive, so this declared shadow does not prove q-critical elimination or
rowwise confinement.  There is no need to repeat the confinement run: adding
shell constraints is monotone, and every weaker confined scenario was already
UNSAT.

The stable-zero core TODO is complete.  `zero_type_cores_n11_13` inspects all
2,888 node-zero rows for `(0,0,2,2)` and `(0,2,0,2)` across `n = 11,12,13`.
Exactly 1,444 are fixed-pair conflicts between the pinned and dangerous exact
classes: either overlap exceeds two or the supports violate cyclic
cross-separation.  The other 1,444 have an empty candidate domain at Moser
center 2; every locally admitted candidate is rejected by overlap, separation,
K-Q3-1, or K-Q3-5.  The blocker-region signatures are stable across all three
sizes: `O2` / `O1` for the fixed-pair / one-center branches of `(0,0,2,2)`,
and `S` for both branches of `(0,2,0,2)`.

This decomposition identifies proof atoms but is not itself a general-`n`
proof.  `SelectedFourClass.inter_card_le_two` already supplies the overlap
atom.  The underlying `SurplusCOMPGBank.btw_sep` theorem now applies to every
`Fin n` CCW convex enumeration; the generated Boolean-mask wrapper remains
ten-label-specific, and PIN-GENERAL still needs a carrier-to-boundary-index
bridge.  K-Q3-1's same-side two-circle core is already kernel-clean as
`SurplusCapPacket.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex`;
the missing work is the selected-support/cap-location adapter. K-Q3-5's
normalized scalar core is now kernel-clean as
`Problem97.q3_shared_interior_false_normalized` in
`P97/Q3SharedInterior.lean`: it consumes normalized MEC-disk, oriented-height,
base-coordinate, nonobtuse-apex, radius-square, and strict cap-side hypotheses.
The packet now supplies `hdisk`, `hux0`, `hux1`, and `hapex` directly through
the kernel-checked
`CircumscribedMECPacket.normSim_mec_disk_normalized`,
`CircumscribedMECPacket.normSim_v3_fst_bounds`, and
`CircumscribedMECPacket.normSim_nonobtuse_at_v3_normalized`. The complete
core-only indexed-cap adapter is now
`SurplusCapPacket.q3_shared_interior_false_of_adjacent_selectedClass_membership`:
it
rotates the MEC packet into the cap support-chord frame and internally supplies
the oriented height, center height, lower side, radius-square transport, and
normalized strict side premises. Its orientation-free wrapper reverses the
frame and swaps the two selected-circle roles when needed. Its explicit source
contract is strict-cap witness `z`, adjacent-interior witnesses `p`/`q`, and
shared `SelectedClass` memberships at the two cap endpoints. Adjacent-cap
membership supplies the strict side products. The remaining producer work is to
extract those facts from selected classes without importing the target
confinement conclusion. Finally, the kernel-checked L2/full LOCAL enumerator proves abstract code
coverage only; it does not extract a `ProfileClassIncidence` code from a
concrete geometric `SelectedFourClass` or transport the required compatibility
facts.

The current source audit sharpens this boundary. `CriticalShellSystem` supplies
a full `CriticalSelectedFourClass` and its no-q-free / center-erased blocker
facts, while `U3FixedTripleAuditFrame` supplies only the q-deleted versus
q-critical row dichotomy. Neither interface supplies cap-interior membership,
adjacent-cap indices, or the four endpoint `SelectedClass` memberships consumed
by K-Q3-5. Therefore the Q3 theorem cannot yet be instantiated from the
PIN-GENERAL packet by definitional unfolding; a bridge must be proved from the
selected-class shell/audit data, or this route must be marked unavailable for
that frame. This is a producer gap, not a missing algebra lemma.

The K-Q3-1 adapter has a fixed, small Lean contract.  For a chosen shared cap
`i : Fin 3`, take `K₂ : SelectedFourClass D.A (D.packet.triangleByIndex i).v2`
and `K₃ : SelectedFourClass D.A (D.packet.triangleByIndex i).v3`, together
with distinct `x` and `y` in both supports and proofs that both lie outside
`D.packet.capByIndex i`.  The adapter obtains carrier membership from
`support_subset_A` and the four radius equations from `support_eq_radius`, then
calls `D.packet.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex`.
The only missing producer work is to map a Q3 code/shared-support branch to
that `i`, these two selected classes, and the two outside-cap facts.

**PIN-GENERAL proof-interface gates.** K-Q3-5 now has a named indexed-cap
theorem contract,
`SurplusCapPacket.q3_shared_interior_false_of_adjacent_selectedClass_membership`,
whose
complete normalization, MEC packet alignment, and orientation symmetry are
kernel-checked. Before it can serve PIN-GENERAL, produce its strict-cap witness,
two adjacent-interior witnesses, and four endpoint class memberships from the
concrete selected classes; solver notes alone do not supply this extraction. The
selected-class-to-L2 extractor must be total: for every
relevant `U3FixedTripleAuditFrame` and audit center, it returns a finite-domain
code and proves every cap-count, shared-label, overlap, separation, and Q3 field
used by the consumer. The finite consumer must quantify over that extracted
domain, not a hand-selected subset.

**Metric-realizability triage.**
`census/global_confinement/metric_realizability_structural_complete.{md,json}`
records the complete deterministic partition of all 1,325 saved relaxed row
systems: 1,264 duplicate-center, 31 exact-off-circle, 20
perpendicular-bisector, 9 cyclic five-point, and 1 cyclic
rhombus/equilateral contradiction. The original 30-system solver frontier is
therefore fully mined, although a 120-second-per-stage cvc5 rerun of the last
system still returns UNKNOWN. Generic core-only Lean consumers are
`EqualityCore.false_of_convexIndep_of_perpBisectorCore`,
`ConvexFivePointCore.false_of_core`, and
`ConvexRhombusCore.false_of_core`, in addition to the earlier duplicate-center
and exact-off-circle endpoints.

This completes bounded metric-core triage but does not emit Lean
row-realization proofs for arbitrary PIN-GENERAL frames. The remaining
obligation is a noncircular producer/coverage theorem: map every relevant
frame to a realized equality pattern, derive the required cyclic orientation
facts, and extract one of the proved cores, or prove a finite-code completeness
bridge into the certified assignment domain. The generic theorem kernels are
general in the label type; only the current coverage artifact is bounded. The
orientation adapter must explicitly reconcile the probe-positive cross order
with the negative `signedArea2` convention exposed by
`ConvexCyclicOrder.hneg_of_ccw`.

The exact-row endpoint is now attached to the live shell API:
`Census554.ExactShellBridge.false_of_criticalFourShell_exactOffCircleCore`
combines a realized generic equality closure with a `CriticalFourShell`'s
exact support equation. It does not manufacture the required realized pattern,
support membership, or off-support label from a PIN-GENERAL packet; that is the
next producer obligation and must remain independent of the target
confinement conclusion.

#### PIN-GENERAL arbitrary-carrier bridge checkpoint (2026-07-10)

The arbitrary-cardinality consumer side is now kernel-checked. The canonical
carrier subtype is mapped to a `Census554.EqualityCore.RowPattern`, with a
proved `Realizes` witness and exact blocker rows from `CriticalShellSystem`.
`MetricCoreAlternative` and `ShellMetricCoreAlternative` cover duplicate
centers, exact off-circle, equal-K4, equilateral-bisector collision,
three-triad collision, surplus-source collision, six-row-anchor collision,
seven-point-orbit collision, seven-point circle-network collision,
perpendicular-bisector, cyclic five-point, and cyclic rhombus cores. The cyclic
consumers have negative-orientation wrappers matching the live CCW enumeration
convention. All twelve consumers are generic in the finite label type and
introduce no new `sorry`.

The boundary-index gap is also closed. `GeneralCarrierBridge.BoundaryIndexing`
packages an injective CCW enumeration and an injective inverse index for every
carrier label. `BoundaryIndexing.sharedPair_satisfied` applies the generic
`SurplusCOMPGBank.btw_sep` theorem directly to a realized shared-pair core.
`PinnedCarrierBridge` simultaneously preserves the pinned exact row, a
surplus-apex selected row containing the deleted source, and the dangerous
exact critical row in one shell system and faithful pattern. If the dangerous
center is the surplus apex, exact-shell uniqueness identifies the last two
rows.

The local pinned geometry has a complete opposite-apex split in both
orientations: the K4 row is the exact opposite cap, a mirror pin at a distinct
surplus point, or an endpoint residual. Separately, every fixed-triple audit
constructively exposes either a q-deleted row member outside its bounded support
or an ambient critical shell.

None of these results proves the final producer. Minimality implies that every
proper nonempty selected-row-closed subset has an escaping row, but that is not
enough: freshness is only relative to the current support, a critical shell can
remain internal, and a selected-row path does not compose equality closure. The
next accepted theorem must use convex cyclic geometry to prove:

```text
nonfresh audit escape
  -> ShellMetricCoreAlternative
     or a shared pair with strict boundary-interval rank decrease.
```

The shared pair and strict interval inclusion are the open mathematical facts.
An abstract `iterated_escape_forces_core` theorem without them is an overclaim.

#### PIN-GENERAL surplus-source falsifier checkpoint (2026-07-10)

The permanent probe
`census.global_confinement.surplus_source_metric_core_probe` strengthens the
source-indexed shell model by requiring the selected surplus-apex row to contain
the deleted surplus point, matching the new three-row Lean carrier. It found
incidence assignments that avoid the five alternatives then present in
`MetricCoreAlternative`. Equal-K4, equilateral-bisector, three-triad, and
surplus-source collision were subsequently added as generic consumers. The
probe starts from `critical_shell` representatives and does not add the six rows
of a particular `U3FixedTripleAuditFrame`; it tests the
three-row-plus-global-shell route, not a producer that genuinely consumes the
complete audit frame. Therefore the proposed theorem

```text
aligned pinned row + surplus-source row + dangerous row + current incidence cuts
  -> one of the proved metric cores
```

is false at the encoded incidence level. These assignments are not Euclidean
models and are not Problem 97 counterexamples. A 60-second-per-stage Z3 check
of the first survivor returned UNKNOWN for the exact-metric, full-convex, and
convex-only systems; UNKNOWN carries no verdict.

The original packet-54 survivor has a stronger algebraic adjudication. After removing
inessential reference labels, 12 squared-distance equalities on six moving
points give the unit ideal over characteristic zero. msolve reports the same
empty complex variety under three variable orders, and Singular independently
confirms the characteristic-zero unit ideal. The direct theorem
`EqualityCore.not_realizes_of_surplusSourceCollisionCore` now supersedes that
external calculation for proof purposes and kills the known packet-54
assignment. Packet 54 as a whole remains `INDETERMINATE` after both v4 and v5
reach the 300,000-node cap.

The complete v4 nine-core checkpoint classifies the 517 packets as 167 `UNSAT`,
250 `SAT`, and 100 `INDETERMINATE`. It is archived as
`surplus_source_metric_core_results_n11_12_v4.json` with SHA-256
`d26afd7901bc72b80d212caad6c48d9aa088b653cca3ac7caeca7811ca3b0062`.
Two further exact QQ unit cores extracted from the packet-85 and packet-181
witnesses are now generic, kernel-checked Lean theorems:
`not_realizes_of_sixRowAnchorCollisionCore` and
`not_realizes_of_sevenPointOrbitCollisionCore`. Each assumes only `O != A`; all
other roles may alias. They kill those saved witnesses, but packet-wide
classification requires a new search for alternative assignments.

Schema v5 adds those two detectors, records inherited-row provenance, reuses
only the 167 monotone v4 `UNSAT` verdicts, and reruns every old `SAT` or
`INDETERMINATE` packet. The rolling v5 file is active and is not a terminal
census until `complete` is true. The shared closure-index optimization was
differentially checked against the reference detectors and reduces the saved
packet-177 prefix classifier by about 6.3x on this host.

The permanent `equality_ideal_probe.py` mines exact QQ unit-ideal candidates
from saved v4/v5 SAT assignments. Packet 177 survived the then-current eleven
detectors under direct replay and exposed a Singular-confirmed seven-point unit
subsystem. The first direct Lean `grobner` attempt exceeded the 16 GB build cap;
the obstruction has since been reproved by smaller Gram-determinant and
polynomial identities as
`EqualityCore.not_realizes_of_sevenPointCircleNetworkCollisionCore`, the
twelfth generic consumer. The old saved assignments are not Euclidean
realizations or Problem 97 counterexamples, and their historical verdicts do
not constitute a total producer.

Exact rational local models for each opposite-apex branch independently show
that the pinned/surplus/dangerous three-row packet alone is consistent. Any
accepted closure must consume additional global shell/audit data. The smallest
currently identified direct additions are either an equality-closure path from
an exact row to an off-row label, yielding `ExactOffCircleCore`, or a second
shared support point between the surplus and dangerous rows plus cap-order
localization proving a proper boundary-interval successor. A shared pair alone
gives cyclic alternation but not strict descent.

Applying the critical-shell system to all four members of the surplus-apex
class does not supply that second point. The first unsupported fact is a source
`q` and a distinct `z` in the surplus class such that `z` also lies in `q`'s
chosen shell while `q`'s blocker differs from the surplus apex. Even after that
fact, the strict subinterval must inherit a valid audit/blocker state. Neither
antecedent follows from `CriticalShellSystem` or the current aligned carrier.

#### PIN-GENERAL forced card-eleven checkpoint (2026-07-11)

The open branch is no longer arbitrary in either the surplus-cap size or the
ambient cardinality. `SurplusCapPacket.surplus_card_le_six_of_convexIndep_K4`
and `SurplusCapPacket.surplus_card_eq_six_of_convexIndep_K4` prove that
`5 < S.surplusCap.card` forces `S.surplusCap.card = 6`.
`SurplusCapPacket.card_eq_eleven_of_surplus_card_gt_five` then proves
`A.card = 11`. Finally,
`SurplusCapPacket.exists_orderedSurplusCapSix_with_selected_hitCounts` supplies
an ordered six-point surplus cap and proves the exact selected-row cap-hit
counts: one at its endpoints and two at its four strict interior points. These
are kernel-checked general theorems, not census observations.

The resulting direct finite model is defined in
`Census554.CapSelectedFiniteCode`. Its canonical labels have cap profile
`(6,4,4)`, one selected row at every center, the existing local, overlap,
pair-count, Q3, and cross-separation consequences, the exact cap-selected
counts, the pinned row, and the source-indexed shell blocker conditions. The
two order-sensitive core predicates now accept both orientations of the cyclic
boundary. This orientation symmetry is necessary: a forward-only diagnostic
temporarily left three row patterns in five placements, and every one was an
already-formalized convex five-point core in the reversed order. Regression
tests preserve that case.

The orientation-complete run in
`direct_cap_selected_metric_core_residuals_n11.json` exhausts all twelve
ordered choices of distinct pinned and deleted surplus-interior labels. Every
placement is `EXHAUSTIVE`, no search is capped, the largest search visits
315,503 nodes, and the residual bank is empty. The artifact SHA-256 is
`5d084bf9b5e9cca3f76418d30efde7ec9251915715ba85599be425d8442dd673`;
the probe-source SHA-256 recorded by the artifact is
`92bd8177e519fff2a4cf3aa82bcae2d75236c01b0c1d5495bab6ca75a91ccc37`.
This is exact within the declared finite model. It is not yet a Lean theorem.

#### PIN-GENERAL native-classifier checkpoint (2026-07-11)

`Census554.CapSelectedNativeClassifier` replaces the quantified free-color
bitvector search with direct eleven-bit row enumeration and deterministic
equality closure. The first closed placement theorem,
`placementCheck_p6_d4`, builds by `native_decide` in about 81 seconds on this
host. The older bitvector attempt had produced no verdict after 55 minutes, so
the replacement is already more than forty times faster relative to that
elapsed nonverdict; this comparison is not a completed old-runtime benchmark.

The exact external enumerator was rerun after removing the rhombus detector.
All twelve placements remain `EXHAUSTIVE` with zero survivors under only
duplicate-center, exact-off-circle, perpendicular-bisector, and oriented convex
five-point cores. This is exact within the finite model, not a Lean theorem for
the eleven remaining placements.

The proof-facing layer is partially kernel-checked:

- `CapSelectedNativeClassifierFacts` caches exhaustive mask membership,
  intersection-cardinality, Q3-block, local-candidate, and pinned-row facts;
- `CapSelectedNativeClassifierSound` proves semantic candidate-row coverage,
  the fixed pinned seed, row-intersection pruning, Q3 pruning, cyclic-separation
  pruning, and `rowsCompatible`; and
- `CapSelectedClosureColor` and
  `CapSelectedGeometry.exists_boundaryBlocks_of_isM44_surplus_card_eq_six`
  build without `sorry`, supplying canonical closure colors and exact direct-or-
  mirror `(4,2,2)` boundary blocks.

This checkpoint does not close the leaf. The remaining finite obligations are
`pairBoundOK` soundness, total search/certificate coverage, explicit checked
closure paths and core extraction, and all-placement Lean replay. The remaining
geometry obligation is to enumerate each exact boundary block into the
canonical `Fin 11` labels and instantiate `IncidenceOK` and `PinnedShellOK` from
the live carrier.

The current closure route has exactly two proof-producing gaps:

1. prove a cap-aware `(4,2,2)` labeling bridge from the arbitrary aligned
   card-eleven carrier to the canonical `Fin 11` model, including
   `IncidenceOK`, `PinnedShellOK`, edge-closure color soundness, and direct or
   reversed hull order;
2. implement a kernel-checked finite classifier or certificate replay proving
   that every such canonical code has one of the twelve
   `ClosureCoreAlternative` branches.

Once both are available, the existing generic consumers close
`isM44PinnedSurplusGeneralMResidualsExcluded` directly. The previous
shared-pair/strict-interval descent route is retained as historical fallback,
not the current critical path.

Next actions, in dependency order:

1. finish and kernel-check finite coverage/core soundness for all twelve
   placements, with no prose-only tuple exclusions;
2. complete the proved `(4,2,2)` boundary-block packet into a canonical-label
   and soundness bridge in both orientations;
3. invoke `closureCoreAlternative_of_colorCoreAlternative`, discharge the
   ordered core signs from convexity, apply the generic consumer, and remove
   the sole terminal `sorry`.

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
3. **Front-B endpoint/pinned confinement.** Updated 2026-07-11: the m=5
   branches are no longer open-ended confinement — the label-complete engine
   closes them (END-L/END-R producer assembly in flight; PIN m=5 closed).
   The open-math content is the general-m leaves (K-B-END-GENERAL,
   K-B-PIN general-m), both routed through the forced `m = 6` / `A.card = 11`
   classifier/bridge machinery; the older generic non-fixed-center
   confinement description is historical fallback.
4. **Front-B erased-pin confinement:** the two direct surplus P4
   contradictions and the side-specific P2 ordered-mask producers.

The card-11 finite pipeline contains substantial engineering and finite-proof
work, but it is not uniformly "bounded to 1–3 sessions": final cover format,
cover-core size, and heavy-certificate cost are not known until the run freezes.

**At the final 2026-07-09 audit checkpoint:** the card-11 (5,5,4) cover loop
had 5,431 bank rows and had printed the frontier at iteration 1154. No process
or terminal marker was live at 18:32 PDT. This is historical evidence; recheck
A11-RUN before resuming or restarting, and do not proceed until the A11-OPS-*
permanence, driver-lock, transaction, and terminal-artifact gates pass.

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
gate pass; a successful exploratory script is evidence, not proof closure. The
archived 2026-07-06 plan is not updated with new status; retain it only as
dated provenance and update this plan, the matrix, and the active source links.
