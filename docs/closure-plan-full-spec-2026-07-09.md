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

## Current inventory (updated 2026-07-13)

The current source surface is **36 `sorry`-carrying symbols / 80 textual
holes**, grouped into two Front-A proof clusters.  The liveData case tree is
still extracted into named, independently tractable on-spine helpers.  The 22
ERASE declarations have source proofs and no longer contribute source holes;
their P2 native and downstream target builds now pass on the current working
tree and remain tracked separately from global publication.

| # | Cluster | Current source surface | Symbols | Textual holes | Front |
|---|---|---|---:|---:|---|
| 1 | Shared-radius pair | `U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair` | 1 | 1 | A |
| 2 | liveData families | 35 named `liveData_*` helper theorems; `u1_largeCap_routeB_tail_liveData_false` itself is sorry-free | 35 | 79 | A |
| **Total** | | | **36** | **80** | |

The pinned-surplus general-m and endpoint general-m leaves are closed and are
not part of the current inventory (matrix K-B-PIN and K-B-END-GENERAL).
`proof-blueprint symbols --with-sorry` reports exactly the 36 symbols above.
The full P2 fleet, downstream ERASE targets, and target-specific exact-pin gate
pass from pushed commit `652fdfcb`. The global `CTRL-GRAPH`/publication gate
remains open for the 36 Front-A symbols and shared-tree reproducibility; the
live recheck found 3 uncommitted Lean paths, all outside ERASE.
`sorryAx` is the synthetic kernel marker reached through those Front-A
declarations, not a 37th source obligation.

Historical snapshot (audited 2026-07-09, build fingerprint `002b0247c64e`):
five declarations / 87 holes; P97 spine 23/1827 open; P96 spine 27/1835
open; endpoint umbrella then at `Base.lean:10070` with holes
`:10097`/`:10119`.

The matrix decomposes the 80 holes into producer families and also records
non-`sorry` publication gates. Census554 remains tracked as optional independent
research and engineering, but card 11 is closed and no Census row is a
prerequisite of the remaining theorem spine.

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
- multi-center work is off-spine until its selected-four representative
  surface is bridged to the exact `MC-CONSUMER` full-filter overlap target
  fixed on 2026-07-13 from the Front-A leaf hypotheses; and
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

### A.1 Optional Census554 research — paused off the proof-critical path

**Dependency correction, 2026-07-13.** Card 11 is closed by the current theorem
stack. Census554 is therefore off the proof-critical path: a terminal cover,
Lean replay, or `false_of_cardEleven_twoLargeCaps` would be a valuable
independent result, but none is required to close K-A-PAIR, K-A-LIVE, or the
publication gates. The remaining open mathematical surface is card ≥ 12
(`ATail` and the associated liveData producer families). The detailed Census
pipeline below is retained as an operational/research specification, not as a
card-11 closure dependency.

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

The checked working-tree CEGAR refinement oracle now covers the formalized
structural core rather than only this one static seed. Its catalog contains all
thirteen alternatives in `GeneralCarrierBridge`; twelve are soundly detectable
from a raw equality cube. The exact-off-circle alternative is explicitly
disabled because a raw cube does not supply its required `ExactAt` premise.
The eligible surface is ten unordered theorem families plus the convex
five-point and convex rhombus/equilateral families, with both direct and
reversed cyclic-order detectors. Every emitted record carries a minimized
equality pattern, replayable row/flip closure paths, the exact Lean theorem and
source hash, and its pattern-orbit map. Unordered cores emit unconditional
sparse cuts. Ordered cores emit clauses scoped to the compatible
boundary-order selector, becoming unconditional only when every valid order is
excluded. Bank-motif refinement runs first; the structural scan runs exactly
when the candidate has no new bank embedding. The preservation-first
oracle-13 transition described below has now activated this complete catalog;
this is active-run provenance, not merely a working-tree capability.

**Six-point two-pair collision, formalized 2026-07-13 UTC.** The exact
iteration-1,203 recovery on support `{0,2,3,4,5,10}` produced nine equality
generators and a checked Singular/Rabinowitsch certificate forcing either
`4 = 5` or `5 = 10`. The independent generic Lean theorem
`EqualityCore.six_point_two_pair_collision` proves that the corresponding
roles force `D = E ∨ E = F`, and
`not_realizes_of_sixPointTwoPairCollisionCore` rules out an injective planar
realization. The detector replays all nine closure obligations and emits the
complete 12-image profile orbit. This is a PROVEN structural exclusion, not a
claim that its certificate has been banked or that the launch-pinned live
oracle already uses it. Recovery and certificate provenance are preserved at
`scratch/census-554/frontier_recovery_runs/run-20260713T030307Z-iter1203/`.

**Offline scheduling experiment, 2026-07-12.** The preservation-safe study in
`docs/audits/2026-07-12-census-554-structural-first-experiment.md` supports a
reversible structural-first canary, not an in-place policy rewrite. Across two
iteration-920 repeats, structural first reduced end-to-end wall time by
4.21--4.61%, active solver-plus-refinement time by 14.11--14.45%, and learned
cuts from 6,234 to 939 over 20 iterations. A clean 100-iteration comparison
showed a 34.74% wall reduction. Preseeding all 23,250 row-feasible
perpendicular-bisector templates was counterproductive and must remain off.
These are empirical throughput results only: they do not determine how many
iterations remain or establish closure. The experiment itself left the live
bank-first run untouched.

**Targeted bank-core replacement experiment, 2026-07-12.** The CPU-time study
in
`docs/audits/2026-07-12-census-554-perpendicular-core-replacement-experiment.md`
replaced the 1,207 bank motifs already containing the proved unordered
perpendicular-bisector core with their minimized structural cores. Across two
order-swapped 100-iteration repeats, solver CPU improved by 5.75%, but total
worker CPU regressed by 2.36% because the wrapper recomputed the replacement
map and learned more dynamic structural cuts. Therefore the current wrapper is
not a production transition candidate. The digest-pinned cached follow-up then
passed the same two-order gate: solver CPU improved by 5.32% and total worker
CPU improved by 2.73%, with byte-identical CNF and zero same-treatment database
differences. Status was **CPU-GATE PASS** for the exact frozen 5,836-row bank.
The preservation-first production transition described below has now
snapshotted the cache in a private successor, bound its digest and contract to
resume metadata, and exercised it live. A changed bank still requires
regeneration and a fresh audit.

**Production transition, 2026-07-12.** The required preservation-first switch
has now completed. The bank-first source stopped cleanly at iteration 1,873
with 2,215,432 dynamic records and remains available with two independently
validated rollback snapshots. Transition replay imported all 2,215,432
records, with zero seed collisions and zero inherited order-conditional cuts,
into
`scratch/census-554/separation_probe_runs/run-20260712T091653Z-structural-first-iter1873`.
The successor persists `refinement_order=structural-first`, keeps the bulk
preseed disabled, uses the same 5,836-row bank and seed, passed SQLite integrity
and an independent ordinary-probe replay, and then committed multiple live
structural-only refinements. The exact rollback and validation record is
`scratch/census-554/transition_snapshots/20260712T091653Z-bank-first-stopped/README.md`.
The separately changing mutable bank was intentionally not merged into this
scheduler-only handoff.

The active cached-run oracle snapshot freezes ten Lean source files and the built
`GeneralCarrierBridge.olean` (SHA-256
`9104b9a9d466801ab0894e5e2ff993d3ec91cbee4411ffb41c3b52342e09b96b`).
`lake-build Erdos9796Proof.P97.Census554.GeneralCarrierBridge` passed with
proof-blueprint build fingerprint `294acadba613`; the terminal axiom query is
exactly `propext`, `Classical.choice`, and `Quot.sound`. The Python catalog,
source snapshots, build artifact, and axiom result are evidence-bound by the
oracle contract, and transition replay fails closed on structural provenance
conflicts or algebra/structural provenance collisions.

The thirteen-alternative successor contract freezes eleven Lean source
files. Its focused aggregate build passed with proof-blueprint build
fingerprint `bd78491c38fd`; the resulting `GeneralCarrierBridge.olean` has
SHA-256
`b4a37e979bc93b843d5f3c5d8822c6563e924b0252b73910f085ed2b610958fb`.
The new core consumer and aggregate bridge axiom audits both report exactly
`propext`, `Classical.choice`, and `Quot.sound`. Oracle contract SHA-256
`5040043d196154501086163699026d48a2d9be64083fbec8c059b38656471b5d`
now binds these facts into the active successor.

A second preservation-first transition published
`scratch/census-554/separation_probe_runs/run-20260711T204242Z-40533-f03a883e`
with all 1,602,162 dynamic records retained, 156,278 static instances,
1,758,440 total instances, and zero target collisions. Its independent SQLite
reopen returned `integrity_check=ok` and the exact dynamic-record count. The
probe ran with a four-hour wall budget and 5,000-refinement ceiling and
checkpointed every iteration. It is now the stopped, preserved bank-first
source for the structural-first transition recorded above; do not mistake its
historical `progress.json` for current process state.

**Cached production transition, 2026-07-13 UTC.** The stopped structural-first
source was migrated into
`scratch/census-554/separation_probe_runs/run-20260713T015318Z-cached-perp-bank5836-from-iter1179`
under the source workdir lock. All 2,263,978 source records were preserved:
2,261,836 were imported as dynamic records and 2,142 were exact collisions
with the successor's 143,500-instance seed surface. The target retained the
same 5,836-row bank and seed, and bound the workdir-local cache SHA-256
`0a24950c5feeb41e4a214a7deebd69865e1eca662b08dcc5e338391e82b3b9ff`
to its run metadata. Its bank/cache hashes matched, SQLite returned
`integrity_check=ok`, exact reopen found 2,261,836 dynamic records, all focused
transition tests passed, and no staging or migration spool remained after
atomic publication. The source checkpoint/WAL/SHM hashes were rechecked after
publication and the source remains the immediate rollback. The durable record
is
`scratch/census-554/transition_snapshots/20260713T015318Z-cached-perp-bank5836/README.md`.

**Oracle-13 production transition, 2026-07-13 UTC.** The cached source stopped
cleanly at iteration 813 with 2,304,034 dynamic records and
`status=interrupted`. Under its workdir lock, transition replay reconstructed
all 2,304,034 records with zero target seed collisions and retargeted 88,350
structural records to the 13-family contract. The atomically published target
is
`scratch/census-554/separation_probe_runs/run-20260713T054559Z-oracle13-from-iter813`.
It starts from 143,500 static seeds and 2,447,534 total exclusions, binds cache
SHA-256
`bbd7b6aa6942b0f1b2c2c8da2365aa8a63d69a5f32edbbef7e07ddac9dbd4db0`,
and binds oracle contract SHA-256
`5040043d196154501086163699026d48a2d9be64083fbec8c059b38656471b5d`.
Independent reopen returned `integrity_check=ok` and the exact dynamic count;
all artifact hashes matched, the source hashes rechecked, and no transition
staging or union spool remained. The source and its byte-exact clone remain
rollback, with full evidence at
`scratch/census-554/transition_snapshots/20260713T050037Z-oracle12-stopped-iter813/README.md`.

**Oracle-13 terminal residual and mining handoff, 2026-07-13 UTC.** Oracle-13
exited cleanly at 00:54 PDT with `status=combined-frontier`, iteration 316,
2,464,637 total exclusions, and 4,440.017 seconds of cumulative elapsed time.
The formalized structural scan found no applicable core for the surviving
direct order (internal index 43); it did not report UNSAT. `result.json`,
`combined_frontier.json`, and `progress.json` are byte-identical with SHA-256
`63f69c20f5c166493a8bdd194c62d51b399d893d35fadb8341b74b8c7b918cad`.
An independent consumer recomputed `cube_ok`, the direct order identity and
labels, and the order/cube compatibility against the exact 5,836-row frozen
bank. Full and quick SQLite integrity checks returned `ok`, and neither the
checkpoint nor workdir lock retained a live handle. This is a terminal result
for the bounded oracle invocation, but it is a residual cube requiring mining,
not a Census554 closure result or geometric counterexample.

The generation-bound consumer
`scratch/census-554/frontier_mining_runs/run-20260713T081430Z-54070-30351c36`
completed with `status=certified` after 905.431 seconds. At minimum support 6,
Flux checked 158 of 178 candidates and the two-worker local share checked 20;
one selected motif survived exact shrinking and then passed certificate
structure, generator fidelity, and the exact Fraction identity gate. The
certified-artifact SHA-256 is
`7f8ad66760da4454785196771e2250491e1cddc03e9a4946f4a22e29ca8e47f6`.
After an independent exact replay and a fresh canonical-novelty check against
the then-current 5,898-row bank, the sole guarded publisher banked it as
`pat_05898`. This is a certified new exclusion and useful closure progress, not
coverage or a theorem by itself.

**Current paused checkpoint, 2026-07-13 11:00 PDT.** Census554 is fully
quiescent and recoverable. The authoritative bank has 5,939 rows, SHA-256
`02fbefc4f290458895e9ad9afbb5f7f3401f428747010ed6a47aa8479ff477b2`.
The sole driver was interrupted outside a bank transaction after replaying
through iteration 173 (350,209 instances in 501 seconds); no transaction
journal remains. The bounded producer
`cube_prefetch_runs/run-20260713T161108Z-iter690-bank5934-rebase` reached its
natural `frontier-limit` with 2,428 attempts, 2,113,600 learned exclusions in
499 durable batches, and nine preserved frontier candidates. Its state
SHA-256 is
`c846a3c919d0a1573ce0900abd6e2336d4f045602f59547f9eead2eb0905fc62`.
No local driver, producer, retry drainer, certification worker, Census tmux
session, or bank transaction is live. All substantive shared-queue jobs were
moved to `paused/20260713T180000Z-off-critical-path/jobs`; AppleDouble `._*`
metadata files may remain in the active directory but are not dispatchable
jobs. Result files and durable state were preserved. Resuming requires an
explicit new resource lease, bank/hash recheck, and queue unquarantine.

**Historical operational split, 2026-07-13 02:53 PDT.** These were separate
lanes and must not be collapsed into one "live oracle":

1. Oracle-13 is **TERMINAL-COMBINED-FRONTIER**. Its tmux session exited, its
   final artifacts passed the independent generation, cube/order, hash, lock,
   and SQLite checks above, and it produced neither checked UNSAT nor a closure
   theorem.
2. The frozen residual consumer is **CERTIFIED-AND-PUBLISHED**. It exited after
   producing one exact motif; no consumer process remains. The motif passed a
   second current-bank novelty check and was published only through the sole
   guarded writer as `pat_05898`.
3. The stopped iteration-813 cached source and rollback clone remain
   **STOPPED-BOUNDED**. Never resume either concurrently with a successor.
4. The mutable-bank `frontier_loop.py` is live under the single driver lease in
   tmux `census554-loop`. The bank has 5,916 rows, SHA-256
   `ed1e86710748fe2e6b8298557aaf07a53a272b07accfb31dcbccc17ff1e12dbd`.
   Iteration 690 reached a genuine frontier, mined 14 minimal `k=7` patterns,
   certified one `multi_pair` motif, failed the other 13, and banked the success
   as `pat_05897`. The driver was then stopped after that atomic boundary,
   `pat_05898` was published, and the driver restarted from the new generation;
   it later stopped outside a bank transaction for a second guarded publication.
   Four independently exact-verified speculative motifs were fresh against the
   then-current bank and became `pat_05899` through `pat_05902`. A later
   four-record exact batch from attempt 1,475 passed the same current-bank and
   sole-writer gates and became `pat_05903` through `pat_05906`. Seven more
   exact records from attempt 1,486 became `pat_05907` through `pat_05913`
   under the same gates. Its hard rank 1 later passed a 1,380-second
   certification and the publisher's exact Fraction gate as `pat_05914`; the
   last attempt-1,683 candidate became `pat_05915`. After each transition the
   publisher exactly validated every admitted certificate and no transaction
   journal remained. The sole driver restarted from the 5,916-row generation
   and had replayed through iteration 23 at this snapshot.
5. Mine-only work is pipelined but cannot publish. A complete generation-bound
   scan checked all 291 iteration-690 `k=7` candidates on flux and the
   idle-gated MacBook, finding 73 heuristic dead candidates with zero worker
   errors. The remote greedy-shrink reached a fixed point after four complete
   rounds and 5,108 deletion trials with zero worker errors, retaining 73
   canonical candidates. Thirteen are exact canonical matches for the 14 live
   certification patterns; one additional candidate strictly strengthened the
   remaining live pattern by removing one equality center, but subsequently
   failed exact certification and was not admitted to the pending store. A
   four-core local producer solved an immutable iteration-690 CNF/bank snapshot,
   clause-checked every SAT model, validated `cube_ok`, and learned compact
   one-hot-equivalent exclusions for models hit by frozen-bank embeddings. It
   exited cleanly at its one-hour wall limit after 1,876 diversified models,
   1,729,607 learned speculative pattern instances, and seven preserved
   model-checked frontiers at attempts 560, 908, 1,475, 1,486, 1,510, 1,511,
   and 1,683. The two support-6 candidates from each of attempts 560 and 908
   passed exact certification, a fresh 5,899-row canonical-novelty check, and
   sole-writer publication as `pat_05899` through `pat_05902`. Attempt 1,475
   had no dead support-4/5 pattern; four support-6 hits shrank to four distinct
   candidates in two complete rounds, passed exact certification and a fresh
   bank recheck, and were published as `pat_05903` through `pat_05906`.
   Attempt 1,486 likewise had no dead support-4/5 pattern; eight support-6 hits
   reached a fixed point after three complete shrink rounds and entered the
   two-hour exact queue after proving distinct from both the current bank and
   the attempt-1,475 batch. Seven passed exact certification and a fresh
   5,907-row novelty check and were published as `pat_05907` through
   `pat_05913`. Rank 1 later passed exact certification, remained novel
   against the 5,914-row bank, and was published as `pat_05914`. Attempts
   1,510 and 1,511 are now covered by all four
   attempt-1,475 motifs. Attempt 1,510's four shrunk candidates are exact
   canonical duplicates of `pat_05904`, `pat_05905`, `pat_05906`, and
   `pat_05903`, so no redundant exact jobs were submitted; a direct
   all-AUTOS containment check found the same four motifs in attempt 1,511.
   Attempt 1,683 was the only remaining uncovered frozen frontier. It had no
   dead support-4/5 pattern; one of 202 support-6 candidates was heuristically
   dead, shrank twice and then fixed after 48 error-free deletion trials, and
   remained distinct from both the current bank and the attempt-1,486 batch.
   Its exact job passed with `kill=pair:7-9`; the publisher's Census-AUTOS
   key correctly distinguished it from a broader unlabeled-store digest match
   and banked it as `pat_05915`. Thus all seven frozen frontiers are now mined,
   covered by newer rows, or exactly published.
6. A fresh four-core successor
   `cube_prefetch_runs/run-20260713T093813Z-iter690-bank5914-rebase` was live.
   It reuses the immutable 5,897-row CNF but matches every candidate against a
   separately hashed 5,914-row bank snapshot, so all 17 post-CNF motifs are
   filtered before a frontier can be emitted. At 02:53 PDT it had checked 516
   models, learned 612,895 bank-pattern exclusions, and found no frontier. The
   authoritative bank has since added `pat_05914` and `pat_05915`, so every
   future candidate still required a fresh 5,916-row recheck. The run was
   read-only and capped at four cores, one hour, 2,048 attempts, and eight
   frontiers.
7. The retry drainer was a separate resumable certification operation. Its
   running in-memory pass began from 105 failures, selected 87 retries, and
   confirmed 79 dead. A current-bank audit later proved that all 16 atomic
   records already in `retry_certified_pending.d` are exact Census-AUTOS
   duplicates of `pat_05868` through `pat_05883`; the 41,004,168,111 bytes of
   certificate payload therefore require no republication. The durable mapping
   is `retry-certified-pending-current-bank-audit.json`. That audit also exposed
   a liveness-only deduplication bug: the store and retry selector used the
   broader arbitrary-relabeling key rather than the bank's AUTOS key. Two
   bank-distinct failed motifs had been suppressed solely by that coarser key;
   both passed a fresh exact deadness recheck. The store now collision-safely
   preserves broad-isomorphic/AUTOS-distinct records, the next retry scan uses
   the bank identity, and the expanded 144-test Census-554 suite passes. Evidence and the
   two recovered patterns are in
   `retry-autos-dedup-recovery-20260713.json`. The already-running pass retains
   its old in-memory selection; a fresh pass is required to exercise the fix.
8. Flux's 14 mine slots are the dependable remote baseline. MacBook slots are
   opportunistic and exist only while its idle gate is open. This host runs the
   two-hour/high-memory certification and local fallback lanes; four local cores
   produced the bounded speculative run above. At 02:08 PDT the post-run audit
   showed about 55.8 GB immediately free, 95% system memory availability, no
   throttled pages, and 33.69 MB of stable swap use. Cube generation need not
   pause during certification while repeated audits retain comparable headroom;
   do not describe the current host as having literally zero swap activity.

Before launching or transitioning another heavy oracle, pass `CTRL-RESOURCE`:
enumerate native Lean evaluation, Singular retry/frontier workers, mutable-bank
mining, speculative producers, and theorem-oracle runs. The local worker is
cert-only with four slots; a system memory guard caps any one Singular at 64 GB
and intervenes on memory pressure. Flux and the MacBook are mine-only. Resource
headroom and live process ownership must be rechecked before changing these
limits; a stale heartbeat or pid file is not capacity evidence.

This mixed-source machinery is valid for externally trusted CEGAR exploration,
not yet for final Lean publication. Python detections and boundary-order tests
are replayable and theorem-linked, but are not Lean proof terms. Final
publication still requires a checked Lean replay of every used structural
record, including a checked bridge from the Python direct/reverse order test to
the corresponding Lean orientation premise.

**Correct interpretation of a future solver UNSAT:** CaDiCaL UNSAT would be an
EMPIRICALLY VERIFIED coverage result for the exact emitted Python CNF and its
frozen formula sources. In an algebra-only run it says that every candidate
cube contains an encoded bank-motif instance. In a mixed-source run
it says that every candidate cube hits either an algebra motif or a separately
identified convex structural exclusion. It would not, by itself, prove the
geometric card-11 theorem or close a Lean leaf. The permanent
terminal publisher now re-solves the persisted CNF, requires `drat-trim`
verification, emits core CNF and LRAT artifacts, takes a lock-consistent bank
snapshot, and records source row, canonical motif, support injection, emitted
pattern, and clause provenance. It writes the completion marker last. Unit
fault gates and a real tiny CaDiCaL/`drat-trim` integration test pass. The
frozen-probe publisher separately publishes `UNSAT-verified` only after a
proof-producing re-solve and `drat-trim`; that remains an empirical CNF result,
not the final cover publication or Lean replay. The mandatory consumer command
`uv run python -m census.census_554.verify_completion --root scratch/census-554`
rejects the legacy marker schema and independently rechecks all hashes and DRAT.

The historical Census-based independent card-11 replay has seven obligations:

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
obligation 3, are complete. A.2 tracks the remaining optional artifacts. These
obligations no longer gate the theorem closure plan.

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

### A.2 Optional Census554 Lean transfer — specified steps

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
5. **Optional independent leaf discharge at card 11**: from steps 1–4 + `D.K4` +
   `capProfile_eq_554_of_card_eq_eleven`, derive `False` under
   `D.A.card = 11` at the leaf, and case-split every Front-A obligation on
   `card = 11` vs `12 ≤ card`. This was the original Census wiring proposal.
   Implement the reusable theorem
   `Census554.false_of_cardEleven_twoLargeCaps` in
   `Census554/Card11.lean`; it consumes the cap frame, geometric bridge,
   `coverCore_covers`, and `not_realizesCube_of_coverCore`, and returns `False`
   without any liveData row hypotheses. Then invoke it in both Front-A
   declarations before their card-at-least-12 residual proofs. Card 11 is now
   closed independently, so this step is **SUPERSEDED AS A CLOSURE STEP**. It
   may proceed only as an optional independent Census theorem after the step-1
   necessity bridge, step-2 cover-core replay, and step-3 cover theorem are
   kernel-checked (matrix A11-CONSUME).

### A.2b Leaf wiring facts (U1LargeCapRouteBTail.lean, refreshed 2026-07-12)

- P1b moved the 79 case holes one-for-one into **35 named on-spine helper
  theorems**. `u1_largeCap_routeB_tail_liveData_false` itself is now
  sorry-free and consumes those helpers. The exact decomposition remains 24
  `q = t2[0]` ordered-subcube leaves, 24 `t1 = t2[0]` source-slot leaves, 24
  `t3 = t2[0]` source-slot leaves, and 7 terminal center branches (`q`, `t1`,
  `t2`-named, `t2`-row-failure, `t3`, `u`, fresh). Matrix rows LIVE-* own
  these families. The t1 band is not one polarity: six holes are the positive
  `ht1Row_l1` branch when the source slot is `l1 = t1`, and the other eighteen
  are negative branches. Matrix LIVE-T1 therefore requires two consumers,
  not one overgeneralized lemma.
- The kernel spine additionally shows leaf 2's compiled proof reaching
  leaf 1 (`DoubleApexOffSurplusSharedRadiusPair`) through the
  `false_of_center_p_t2_t20 → … → exists_removableVertex_of_twoLargeCaps`
  chain, so closing Front A requires BOTH leaf 1 and the 79 case leaves (or
  a refactor of the case tree).
- The namespace-level exports remain thin re-exports, not duplicate
  obligations. Within the shared-radius declaration/export pair, the only
  proof hole is the one in
  `DoubleApexOffSurplusSharedRadiusPair`; this does not discount the 79 holes
  in the liveData helper family.
- **Historical Census handoff status:** `capProfile_eq_554_of_card_eq_eleven`
  terminates in profile facts ((5,5,4), interiors (3,3,2), and the
  `MultiCenter/CapProfile.lean` vocabulary translations) rather than a Census
  cover consumer. That missing Census-specific wire is no longer a closure
  gap because card 11 is closed independently. A.2 step 5 is optional and must
  not be used to gate card ≥ 12 work.

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

**AHEAD-DEC — DONE 2026-07-13.** Adam explicitly authorized head-only
card-12--14 narrowing as parallel research alongside Census554/A11. This
replaces the 2026-07-12 defer-until-A11-outcome default. The authorization
opens `AHEAD-SPEC` and lightweight deterministic preflights immediately; it
does not by itself transfer the active heavy-compute lease from
`CTRL-RESOURCE`.

The authorized envelope is:

- proof-tier runs use only PROVEN cuts; CONJECTURED cuts may appear only in a
  separately labeled exploratory appendix;
- no AHEAD-N12/N13/N14 run starts until `CTRL-RESOURCE` is explicitly assigned
  to AHEAD, after which runs are serialized to one labeled profile at a time,
  use at most four workers, nice long-lived processes, and publish an immutable
  pre-run manifest with wall, bank-growth, and shape-staleness stops;
- finite cover, SAT, and sampling results retain their exact empirical scope
  and do not become geometric closure claims without the Lean necessity and
  cover-replay chain; and
- no named card-at-least-15 residual may be introduced at this stage. Such a
  residual is permitted only after `AHEAD-COVER` is proved, and then only when
  `AHEAD-CONSUME` introduces it together with its immediate spine consumer.

**First permanent AHEAD-SPEC checkpoint, 2026-07-13.**
`census/card_head/run_manifest.py` now defines an immutable pre-run manifest
and freezes the exact post-SUB2 PROVEN cut contract at SHA-256
`8e067c226a9e5fec0825d0f7461d84af3aca19baaba52d6faafcbd7d8be505cf`.
Validation pins one of the 3/6/10 authorized labeled profiles, source-file
digests, artifact paths, at most four workers, positive niceness, and the
wall, bank-growth, and consecutive-shape-staleness stops; exclusive creation
refuses to overwrite an existing manifest. The three profile tests and six
manifest tests pass. This is an operational preflight, not a geometric proof:
at this first checkpoint the candidate-count fixtures and permanent runner
port remained open, and no heavy AHEAD census had launched.

**Second permanent AHEAD-SPEC checkpoint, 2026-07-13.**
`census/card_head/candidate_surface.py` is the cardinality-generic port of the
historical per-center `all` admissibility layer, now correctly classified as
post-SUB2 PROVEN. The committed `candidate_count_fixtures.json` exhausts all
19 labeled profiles: 254 profile/center instances and 106,755 candidate
classes. All three card-12 profiles reproduce the historical counts exactly,
and every card-12--14 count independently matches the corresponding closed
combinatorial formula. The order-free proxy drops `s >= 3` but deliberately
does not encode or decide the position of an `s = 2` class.

`run_manifest.py` now constructs the sole admitted command as the niced
permanent runner entrypoint rather than accepting an arbitrary command.
`runner.py` re-hashes the complete required source set, regenerates and checks
the selected fixture, and reports the finite evidence scope. Its `execute`
entrypoint is intentionally fail-closed until the permanent CEGAR engine
adapter lands and `CTRL-RESOURCE` is explicitly transferred to AHEAD. The full
card-head suite is 16/16 passing. No heavy AHEAD process was launched, and this
checkpoint is still finite-abstraction infrastructure rather than coverage or
geometric closure.

**Third permanent AHEAD-SPEC checkpoint, 2026-07-13.**
`census/card_head/sat_encoding.py` ports the historical one-hot/C2/C4 and raw
pattern-exclusion CNF onto the permanent generic candidate surface. For the
(6,5,4) card-12 profile the empty-bank base is exactly 37,310 variables and
297,119 clauses, matching the historical `654_all` encoder; the representative
(5,5,6) card-13 and (5,5,7) card-14 bases are pinned at
63,966/635,654 and 101,122/1,210,260 variables/clauses respectively.

The five card-12 encoding gates pass: an empty bank is SAT with its decoded
cube independently accepted by `cube_ok`; excluding that full cube changes the
witness; forced C2, forced C4, and forced submask violations are UNSAT with all
three CaDiCaL DRAT proofs independently accepted by `drat-trim`; and the free
submask instance remains SAT outside the exclusion. These are encoding smoke
results, labeled EMPIRICALLY VERIFIED within the finite CNF, not coverage.
The suite is now 22/22 passing. `runner.py execute` remains fail-closed because
the CEGAR mining/certification adapter, historical-bank replay, and explicit
`CTRL-RESOURCE` transfer are still open. No AHEAD census was launched.

**Fourth permanent AHEAD-SPEC checkpoint, 2026-07-13.**
`census/card_head/historical_bank.py` performs a read-only structural replay of
the current historical `654_all` index. The committed report
`historical_654_all_structural_audit.json` pins bank SHA-256
`e65e00a1a8ac900a5608061d135fb3b46c77f79b0c78533c775119816eeb8c04`.
All 256 bank rows are distinct profile-automorphism orbits; their 20,610
labeled instances are candidate-compatible under the permanent post-SUB2
surface; all 159 role-blind shape labels recompute; and all 256 referenced
certificate files exist and agree with the bank's path inventory.

This is `PASS_STRUCTURAL_ONLY`, not certificate replay. The referenced
certificate payload totals 9,233,993,303 bytes. A fresh exact-identity verifier
was started, found to be unsuitable as a lightweight concurrent preflight, and
stopped before it could contend with the active resource lane. Consequently
the permanent report says `certificate_identity_replay: NOT_RUN`; file
existence and the old recorded verifier result are not promoted to a current
proof. The suite is 26/26 passing. The CEGAR mining/certification adapter,
fresh certificate replay, and `CTRL-RESOURCE` transfer remain open, and the old
bank remains nonterminal/noncoverage.

**Fifth permanent AHEAD-SPEC checkpoint, 2026-07-13.**
`census/card_head/run_protocol.py` now supplies the durable state boundary for
future manifest-pinned runs. Each event is fully written and fsynced before an
exclusive hard link publishes its sequence name; every event binds the
immutable manifest digest and its predecessor digest. Strict replay rejects
gaps, corruption, backwards elapsed time, decreasing bank/shape totals, and
events after a terminal state. There is no mutable status document: `PLANNED`,
`RUNNING`, and terminal state are derived from the manifest plus the event
stream.

`RUN_STARTED` freezes the initial bank-row and shape-count baselines. Every
`CHUNK_COMPLETED` represents one SAT-witness iteration and records its
pre-certification fresh-shape count alongside monotone bank/shape totals. Thus
the stale counter matches the historical definition exactly: it advances when
the witness has no fresh shape, even if new raw rows were banked, and resets
when fresh shapes were found even if their certification failed. Banked-shape
growth is required to be a subset of the fresh shapes observed. Reaching any
manifest wall, bank-growth, or shape-staleness limit produces
`STOPPED_BY_POLICY` and forbids another append. Simultaneous stops are retained
in deterministic wall/bank/staleness order. Engine exhaustion can currently
terminate only as `ENGINE_EXHAUSTED_UNVERIFIED`, which is expressly not finite
coverage. `runner.py status` re-runs the complete source/fixture preflight and
reads this derived state without creating an event directory. The suite is
35/35 passing. `runner.py execute` remains fail-closed on the CEGAR
mining/certification adapter and `CTRL-RESOURCE`; no AHEAD census was launched.

**Sixth permanent AHEAD-SPEC checkpoint, 2026-07-13.**
The exact certification and publication boundary is now permanent and generic
across all authorized card-12--14 profiles. `pattern_certificate.py`
reconstructs every equidistance and Rabinowitsch generator from the proposed
pattern, checks variable order and generator tags, parses the external
cofactors, and verifies `sum_i c_i g_i = 1` in exact `Fraction` arithmetic.
Thus msolve/Singular output is proposal material only: neither an msolve
emptiness verdict nor a Singular `CHK:1` string is bankable without independent
generator-fidelity and identity replay. The smallest historical `654_all`
five-generator identity passes, as does the same identity under the permanent
card-13 schema; altered generators and cofactors fail closed.

`cegar_adapter.py` binds each proposal to the immutable manifest, independently
rechecks its complete SAT cube, rejects a cube containing an old bank orbit,
requires every new pattern to occur in that cube, recomputes the entire profile
orbit and role-blind shape, and accepts only exact-verified certificates.
`bank_store.py` then couples read-only certificate payloads, append-only bank
rows, and the matching run-protocol measurement through one fsynced recovery
journal. Fault-injection tests cover crashes before the bank replace, after the
bank replace but before the event, and after the event; recovery either removes
uncommitted certificates or appends exactly the missing event. A bank commit
also exercises the manifest bank-growth stop at its exact boundary.

`runner.py` now reports exact replay and transactional bank publication as
enabled, while the mining/generation worker remains disabled. The suite is
52/52 passing. No external algebra engine, SAT census, historical 9.23 GB
identity replay, Lean build, or heavy AHEAD process was launched. Consequently
`execute` remains fail-closed on the mining/generation worker and explicit
`CTRL-RESOURCE` transfer; no coverage claim advances.

**Current decider status, updated 2026-07-13.** ATAIL-SUB2 is PROVEN: the
exact rational certificate, independent checker, adversarial audit, and the
Lean theorems `ATailSub2.sub2H_left_unsat` / `sub2H_right_unsat` passed their
stated gates. ATAIL-Q3 is now DONE-NEGATIVE within the selected-four/two-center
surface. Its permanent checkpoint (`census/q3_two_center/checkpoint.py` /
`checkpoint.json`) exact-replays 72 realized windows, validates 44 stored
profile/tier token assignments, pins its inputs, and re-runs the repaired
396-triangle falsifier gate. All 22 unordered profiles at cards 12--16 retain
a token model under both the base and post-SUB2 proved cuts. This is exact
within the token abstraction, not a full-configuration counterexample; the
falsifier gate is guard-banded floating evidence, and the checkpoint does not
independently replay the 15 hand/Z3 kill proofs. ATAIL-FORCE therefore remains
open and must use a selection-robust full-filter, order-coupled multi-window,
or critical-row mechanism. The exact producer target and theorem-bank audit
are in `docs/atail-force-producer-plan-2026-07-13.md`.

**Proof-priority decision, 2026-07-13.** ATAIL-FORCE is the primary closure
lane. Census554 and AHEAD CEGAR remain bounded diagnostic or fallback lanes:
their banks may expose reusable structural lemmas, and a checked AHEAD cover
could remove cards 12--14, but neither should be awaited before theorem work.
A successful AHEAD cover would still leave the card-at-least-15 tail and the
independent LIVE families, whereas a full-filter or critical-row producer from
the actual leaf hypotheses can close K-A-PAIR uniformly from card 12 and may
also supply the missing LIVE producer. A nonterminal CEGAR run stops at its
predeclared wall, bank-growth, or shape-staleness boundary; SAT progress or a
larger bank alone does not authorize a budget extension.

The exact `ATAIL-DISTINCT-REPLAY` checkpoint now makes the computational
boundary sharper. It constructs and exact-replays separator-satisfying
algebraic witnesses for all 343 raw equality skeletons: all 4,802 equalities
and 19,978 pairwise-distinctness/nondegenerate-triangle separators pass. The
construction proves all coordinates real for all 343 skeletons. It does not
check disk, nonobtuse, cap, or global-order inequalities, does not realize a
full configuration, and does not prove a Lean statement. Thus the bare or
separator-saturated equality route is DONE-NEGATIVE even over real algebraic
coordinates, while ATAIL-FORCE remains OPEN-RESEARCH and must use the omitted
inequalities or a direct full-filter/critical-row producer.

The subsequent `ATAIL-INEQ-PILOT` exercised those omitted inequalities only as
a bounded diagnostic. Its immutable seven-case manifest includes the complete
disk, nonobtuse, cap-sign, and global-order generators, with one sequential Z3
4.16.0 QF_NRA/NLSAT process, 30 seconds per case, and a 240-second aggregate
wall. Every case timed out; total wall was 219.901 seconds. No model or UNSAT
proposal was returned, so no geometric row is classified and no mathematical
claim advances. This is DONE-NEGATIVE-TRACTABILITY and does not authorize a
larger nonlinear sweep.

After Census554 stopped and released compute, `ATAIL-CVC5-PILOT` used the same
seven frozen full-inequality systems as a cross-engine diagnostic, not a
surface expansion. One sequential cvc5 1.3.3 nonlinear-coverings process ran
at verified effective nice 10, 30 seconds per case, under the same 240-second
aggregate wall. All seven reached cvc5's exact statusless timeout diagnostic;
total wall was 219.217 seconds, with no SAT or UNSAT status. The immutable raw
result's parser labeled those signal exits `ERROR`; a solver-free checkpoint
binds every manifest, system, SMT2, and constraint-ledger digest and normalizes
only that exact raw shape to 7/7 `TIMEOUT`. No row is classified and no claim
advances. The blind cross-engine route is therefore also
DONE-NEGATIVE-TRACTABILITY at this granularity.

The first materially smaller forced subsystem is now
`ATAIL-ORDER-FAN-1`. In the frozen six-interior-point representative, the
metric/disk/cap base is SAT, whereas adding a seven-inequality oriented edge
fan gives a repeatable Z3 UNSAT proposal. Conservative deletion leaves 15
scalar hypotheses, and `scratch/atail-force/order_fan_kernel.lean` gives an
explicit solver-free Lean proof of their inconsistency. The exact S3 matcher
finds this pattern in 39 of 167,782 selected-four order decorations, spanning
21 joint classes; the other six frozen size strata remain `UNKNOWN` under a
five-second diagnostic. These counts are exact only for the decision surface.
There is no leaf-to-inventory extraction, full-filter pair, or on-spine
consumer, so this is a checked narrow cut and theorem-extraction template,
not closure of ATAIL-FORCE or K-A-PAIR.

The bounded m=6 follow-up exhausts seven S3 class representatives, 25
representative orders, and nine oriented edges per order (225 queries at 250
ms). The order-free base statuses were 7 `SAT`, 12 `UNKNOWN`, and 6 `UNSAT`;
the fan statuses were 26 `SAT`, 155 `UNKNOWN`, and 44 `UNSAT`. Those statuses
are diagnostic only. The six base proposals reduce to two independently
proved order-free Lean kernels: the eight-hypothesis `bisectorCapKernel` from
class 2472 and the eleven-hypothesis `twoCircleCapKernel` from class 2422.
Together with `orderFanKernel`, the exact simultaneous-S3 matcher finds three
disjoint cuts covering respectively 39, 66, and 24 of the 167,782
selected-four systems: 129 systems across 45 classes, leaving 167,653. This is
new theorem-bank content, not completeness. The exact narrow reach terminates
blind selected-four kernel mining as the primary lane; the next theorem must
use the actual full-filter or critical-row hypotheses to force a checked
pattern, the joint-fiber lower bound, the seven-equality obstruction, or
`False` directly.

A direct audit of the seven LIVE-C helper contracts found no routine whole-row
reduction. `CriticalRowPacket.center_ne_source` only kills subcells in which
the extra row source `t2[0]` is also identified with its blocker center; none
of the seven contracts supplies that equality, and none supplies K-A-PAIR's
p-centered exact-dangerous `t2Row` hypotheses. LIVE-C remains a content-bearing
six-row producer target. This session is anchored at LIVE-T1, while the shared
Route-B parent is owned by another live session and is not edited by this lane.

The theorem-facing normalization has also advanced without touching the
concurrently owned Route-B source. Two scratch modules now kernel-check: (i)
the joint-fiber card-two extraction and the fact that equal critical-row
centers plus equal selected `l1` identify the full exact supports; and (ii)
dangerous-triple relabeling adapters for `f2=t1` and `f2=t3`. The latter reduce
all 24 LIVE-T1 plus 24 LIVE-T3 textual holes to the single K-A-PAIR residual by
making the collided row the relabeled `t2Row`. They intentionally inherit
K-A-PAIR's `sorryAx`, so this is a dependency reduction rather than closure.
Artifacts: `scratch/atail-force/critical_row_coupling.lean` and
`scratch/atail-force/triple_relabel_adapters.lean`.

Cap profiles at card 12 (sum 15, parts ≥ 4, at least two parts ≥ 5):
(6,5,4), (5,6,4), (5,5,5); {4,4,7} excluded (STATE.md:33-45). Only (6,5,4)
was measured ("654_all"; at run time the "_all" cut set included one
CONJECTURED narrowing, STATE.md:192-208). That narrowing, the order-free
`s <= 2` proxy used only to drop `s >= 3`, is now PROVEN post-SUB2 by
`ATailSub2.sub2H_left_unsat` / `sub2H_right_unsat`. This retrospective tier
upgrade does not make the old run terminal or permit its pre-manifest encoding
to be reused without fidelity validation. Readout = **no observed
convergence** over the measured 65+ iterations: 256 bank rows, 158 window
shapes before the two offline full-cube additions, and 20,322 pre-addition
orbit instances; the raw
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
  the sole n=12 profile run did not converge and omitted two labeled profiles;
  although its formerly conjectural `s <= 2` exclusion is now PROVEN
  post-SUB2, the run also predates the immutable manifest/source-digest gate.
  A head census is therefore an expensive narrowing
  experiment whose success criterion is a checked cover, not merely more dead
  samples.
- **Card ≥ 15 ("the tail") — the relaxed pattern-cover statement is
  FALSIFIED.** The witness tiers must be kept distinct. W15 refutes the weakest
  census surface; exact-integer W16-sq additionally has full H1 and full
  exact-four classes but is not in general position; the W16/W20 two-ring
  witnesses survive full H1, noncollinearity, and exactness at the recorded
  evidence tier (`scratch/d3-formulation/report.md`, section 4). One admissible
  relaxed witness at n=16 is already enough to refute a statement quantified
  over every n ≥ 15; the artifacts do not prove that every individual n ≥ 15
  has such a witness. Because one coordinate realization realizes every
  induced subpattern, no bank of dead equality motifs can cover that witness.
  All these configurations are non-convex, so they do not refute the actual
  `ConvexIndep` leaf; they show that any viable tail theorem or richer census
  must use global convex order, full-filter data, or equivalent critical-row
  coupling absent from the relaxed surface.
- **Only non-excluded tail route: Candidate D** — synthetic
  convexity-coupled forcing of the shared-radius pair refuted downstream by
  `oppCap2_escape_gen`. The completed Candidate-D probe gives three reusable
  proved cuts (`m ≤ 2`; vertex-pair packets have `s = 0`; `s = 2` is
  straddle-only), but 13/19 decorated minimal-window types are realizable and
  even granting every conjectured per-type kill leaves token-level evasions at
  n=12..16. The seven-variable `SUB2-H` half-disk gate is PROVEN, and the Q3
  two-center sweep is DONE-NEGATIVE: its complete selected-four surface remains
  token-SAT after every proved cut. Cross-center coupling beyond independently
  selected four-point windows is therefore required.

Consequence, stated plainly: **Front A has no complete known route, but card 11
is closed.** Census554 is optional independent research. The proof-critical
surface begins at card 12 and consists of K-A-PAIR plus the independent LIVE-*
families. Cards 12--14 may still admit a checked finite cover, but that is a
bounded fallback rather than the primary schedule. Card ≥ 15 requires
Candidate-D-shaped convexity/full-filter/critical-row mathematics, and the
preferred target is uniform from card 12 so that no head split is needed.

**Decision A-HEAD (matrix AHEAD-DEC): AUTHORIZED 2026-07-13.** Adam selected
the head-only narrowing attempt as parallel research alongside Census554/A11.
The route must first port and validate the exact old `all` encoding against
the permanent post-SUB2 PROVEN cut contract, run all three labeled card-12
profiles, then cover all six labeled card-13 and ten labeled card-14 profiles
listed in matrix AHEAD-SPEC. Heavy runs remain under the `CTRL-RESOURCE`
transfer and four-worker serialization recorded above.
Only a proved 12–14 cover permits AHEAD-CONSUME to introduce a named
card-at-least-15 residual with its immediate consumer; no such residual is
authorized earlier. More dead samples without a cover do not justify the split,
and a policy-stopped profile is a durable nonterminal result rather than a
reason to extend the run. Partial banks are theorem-discovery inputs only.

---

## Front B — M44 lane (current ERASE cluster; pinned/endpoint closed)

### B.0 Verified structure (2026-07-09 source + slot3 doc tail)

The historical three-leaf analysis shared one producer core: at M44, `A` is unbounded
(`surplusCap.card + 5 = A.card`, `Cap/PartitionFromMEC.lean:450`) and unlabeled
points live in the surplus cap interior. The producers demand, per non-fixed
center, a fully-labeled equidistant 4-class whose mask is in the generated
candidate tables — i.e. **confinement**. The pinned residual supplies exactly
one labeled circle (the `.v` selected class, SurplusM44Packet.lean:4390);
no non-circular producer existed in the repo at the 2026-07-09 checkpoint.
That analysis led to completed pinned-surplus and endpoint general-m
classifiers. The only current Front-B proof cluster is ERASE; B.1 and B.2 are
retained as closed route history and must not be dispatched.

Coordination: query ownership live with `proof-blueprint anchor list`; do
not take a row whose owner is active. Anchors are advisory, so file changes
still require a fresh diff read. (Historical 2026-07-09 snapshot: erased-pin,
pinned-surplus, and liveData branches all had active owners; the erased-pin
and liveData anchors were cleared as stale on 2026-07-11.)

### B.1 Endpoint residual producer (leaves 4 and 5)

**CLOSED 2026-07-12.** K-B-END-LABEL and K-B-END-GENERAL are DONE. The m=5
geometry producer and the general-m card-eleven endpoint classifier are
kernel-verified under the recorded core/native trust boundary, contain no
source `sorry`, and are absent from the open spine inventory. The remainder of
this subsection is historical route rationale, not current work.

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
  35bc63aa); right-apex assembly was then in flight and subsequently closed.
  Import boundary: `Base.lean` may
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

**CLOSED 2026-07-12.** K-B-PIN is DONE. The forced `m = 6`, card-eleven
classifier, pinned-shell bridge, and left-to-right transport close the former
general-m leaf; it contains no source `sorry` and is absent from the open spine
inventory. The remainder of this subsection records the route that produced
the closure and is not dispatch authority.

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

The former remaining leaf was
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
The terminal source is now sorry-free: its left residual is transported through
the all-index `NonSurplusSwap.pinnedLeft_to_right` field, then the swapped
datum is relabelled and consumed by the existing right-pinned carrier bridge.
After the concurrent U1 owner restores a green dependency build, run the named
target build and refresh the proof-blueprint graph before marking the general-m
residual as spine-closed.

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
`INDETERMINATE` packet. The v5 artifact now records `complete=true`; it is a
terminal result for that exact finite packet schema, not a general geometric
closure theorem. The shared closure-index optimization was
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
`SurplusCapPacket.exists_orderedSurplusCapSix_with_selected_hitCounts_and_endpoints`
supplies an ordered six-point surplus cap, retains which ordered endpoints are
the two Moser support endpoints, and proves the exact selected-row cap-hit
counts: one at its endpoints and two at its four strict interior points.
`selectedClass_support_inter_surplusCap_card_eq` transports that result to any
named cap center. These are kernel-checked general theorems, not census
observations.

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
equality closure. All twelve ordered pin/deletion placements now build by
`native_decide`; `CapSelectedNativePlacements.allPlacementChecks` is their
aggregate theorem. The eight-job aggregate build took about 17m31s on this
host. Individual runtimes ranged from about 90 seconds to 17m25s. The older
bitvector attempt had produced no verdict after 55 minutes on one placement,
so the replacement is substantially faster, but this is not a completed
old-runtime benchmark.

The exact external enumerator was rerun after removing the rhombus detector.
All twelve placements remain `EXHAUSTIVE` with zero survivors under only
duplicate-center, exact-off-circle, perpendicular-bisector, and oriented convex
five-point cores. This remains the external finite-model cross-check; the
twelve native placement equalities are now Lean theorems.

The proof-facing layer is partially kernel-checked:

- `CapSelectedNativeClassifierFacts` caches exhaustive mask membership,
  intersection-cardinality, Q3-block, local-candidate, and pinned-row facts;
- `CapSelectedNativeClassifierSound` proves semantic candidate-row coverage,
  the fixed pinned seed, row-intersection pruning, Q3 pruning, cyclic-separation
  pruning, `rowsCompatible`, `pairBoundOK`, and the complete `compatibleWith`
  filter;
- `CapSelectedNativeClassifierCoverage` proves domain sorting is a permutation,
  domain restriction preserves each distinguished semantic row, and the full
  recursive search trace. In particular,
  `exists_semanticPrefixCore_of_placementCheck` turns a successful placement
  replay into a duplicate-free semantic prefix with `hasPrefixCore = true`;
- `CapSelectedNativePlacements` packages all twelve successful native replays;
- `CapSelectedNogoodCertificate` proves direct row/flip path checking, compact
  core extraction, pinned exactness, and checked-bank-match soundness;
- `CapSelectedNogoodClassifier` proves the complete static-bank DFS trace and
  turns a successful placement certificate replay into the public
  `ClosureCoreAlternative`;
- `CapSelectedNativeClosureSound` proves the native union-find parent
  invariant, transports every normalized-root equality to `EdgeClosure`,
  extracts all four active native core families, and proves the total theorem
  `closureCoreAlternative_of_incidenceOK_pinnedShellOK`; and
- `CapSelectedClosureColor` and
  `CapSelectedGeometry.exists_boundaryBlocks_of_isM44_surplus_card_eq_six`
  build without `sorry`, supplying canonical closure colors and exact direct-or-
  mirror `(4,2,2)` boundary blocks.

The finite obligation is closed. A separate exact certificate-mining run found
149,434 subsumption-minimal row nogoods and a 647,221,809-byte flat artifact;
all 795,609 prefix kills had explicit row/flip paths of length at most 17, and
the static bank replayed all twelve placements UNSAT. This is exact within the
finite model, but the flat payload is operationally rejected as a Lean
artifact. Its compact hash-anchored record is
`certificates/surplus/reports/cap_selected_nogood_certificate_mining.{md,json}`.
The generic union-find proof removes that payload entirely.

The canonical-label and incidence parts of the geometry obligation are now
closed:
`CapSelectedGeometry.exists_canonicalLabeling_of_isM44_surplus_card_eq_six`
enumerates the exact boundary blocks into `Fin 11`, identifies all three
strict-interior preimages, and carries direct or reflected hull order.
`CapSelectedCarrierBridge` constructs and realizes the finite row code. It
proves all six incidence conjuncts through `incidenceOK_patternCode`:
`LocalRowsOK`, `RowIntersectionsOK`, `PairCenterCountOK`, `CrossSeparationOK`,
`Q3OK`, and `CapSelectedCountsOK`. The proof includes the previously missing
non-Moser three-hit exclusion without importing U2 or a downstream containment
theorem. Its axiom closure is exactly `propext`, `Classical.choice`, and
`Quot.sound`.

The right-oriented adapter is now implemented in
`CapSelectedPinnedShellBridge`: it constructs `PinnedShellOK` from an aligned
right carrier, invokes `incidenceOK_patternCode` and the total native theorem,
consumes all twelve `ClosureCoreAlternative` cases on the geometric carrier,
and is wired into `PinnedSurplusGeneralM.lean` as the first terminal conjunct,
`PinnedRightSurplusResidualAt -> False`.

The explicit left-to-right boundary reflection adapter is implemented in
`U2NonSurplusOneHit.lean`: each of the three fixed-surplus swaps transports the
private cap, selected center, adjacent caps, outer endpoints, and both
non-equidistance fields. It is exported as
`NonSurplusSwap.pinnedLeft_to_right` and used by the terminal source to obtain
the same right-oriented finite seed, shell witness, and closure contradiction
for the left packet. The source elaborates directly without `sorry`; the
serialized target build and proof-blueprint refresh later passed. The
shared-pair/strict-interval descent route is historical fallback, not the
current critical path.

### B.3 Erased-pin generated row bank (leaf 5 lane)

The ERASE-P2 redraft is complete. The broad false remainder assertions were
removed and replaced by twenty explicit per-row refutation consumers. The
current classifier ladder forces card `{10,11}`:

- **card 10 / P2 — DONE in commit `652fdfcb`:**
  `ErasedCertificate/CardTenProducer.lean` supplies the label-complete
  producer, `hv`/`hw` classes, terminal coverage, and pure-row cardinality
  closures. All twenty P2 consumers are wired through proved card-10 branches.
- **card 11 / P2 — DONE in commit `652fdfcb`:** the same twenty
  consumers call the `P2Closure.lean` finals.  All 128 independent native
  leaves, aggregators, semantic dispatcher, closure, residual shard, and
  downstream `Continuation` target build.  The right/left terminals and
  dispatcher have approved axiom closures with no `sorryAx`.  A final cached
  rerun of `scripts/build-p2-certificates.sh` passed all 16 bounded batches and
  the 8410-job aggregate target with exit code 0.
- **card 10 / P4 — DONE:** M9 enumerates all 504 admissible `u`/`s`-centered
  seeds, proves a 378/126 direct-separation/native-grid partition, and closes
  the 72 P4-U plus three 18-seed P4-S grid families through seven native
  shards. Both geometric consumers are wired and spine-closed.
- **card 11 / P4-U — DONE:** the containment-specialized 47-support native
  certificate, semantic classifier/closure transport, canonical geometry
  consumer, and `Continuation.lean` wiring close the surplus-opposite
  residual. The refreshed spine marks it closed.
- **card 11 / P4-S — DONE AND DOWNSTREAM VERIFIED:** the 128 native
  placement leaves, semantic dispatcher, family final, and source consumer are
  implemented and built.  `P4SPlacements`, `P4SClosure`, and the importing
  `Continuation` target build.  The terminal, semantic dispatcher, and
  downstream parent report only core axioms plus approved `Lean.trustCompiler`,
  with no `sorryAx`.

The card-eleven M6 geometry lane is now complete and target-built:
`ErasedCertificate/CardElevenBridgeStaging.lean` and
`CardElevenBlocker.lean` package canonical incidence, orientation-correct
bucket counts, deleted-row selection, blocker routing, and exactness for all
twenty count rows and both P4 families. The finite blocker override is confined
to the prescribed proof-facing row; this avoids the unavailable claim that
every member of an arbitrary erased-pin class has the same geometric critical
center. The stale `blocker deleted ≠ center` condition is not part of the ERASE
shell contract: every committed classifier/closure consumer discards it, and
it is false in the P4-U case. The M6 target build passed 8173 jobs and its
package theorems use only `propext`, `Classical.choice`, and `Quot.sound`.

The native M1 gate is complete.  The compiled `erase_m1_gate` executable ran
the exact 4543-cell domain with eight Lean runtime threads and returned P4-U
47/47, P4-S 1440/1440, and P2 3056/3056 true in 845205 ms.  This resolves the
search-feasibility STOP condition empirically; it is not itself a theorem.

M2 is complete generically.  For P4-U and P4-S, M3-M5 and M7 are also complete through
`ErasedNativeClassifier.lean`, `ErasedClassifierSound.lean`,
`ErasedClassifierCoverage.lean`, `ErasedClosureSound.lean`,
`CardElevenShellBridge.lean`, the corresponding placement modules, and
`P4UClosure.lean`/`P4SClosure.lean`.  The earlier downstream `Continuation`
target build passed 9292 jobs for P4-U.  Both P4-S standalone endpoints have
axiom closure exactly
`propext`, `Classical.choice`, `Lean.ofReduceBool`, `Lean.trustCompiler`, and
`Quot.sound`, with no `sorryAx`.  P2's M3-M5 and M7 now pass the same
build/axiom/spine gates.  `Continuation` passed 9703 jobs; the downstream
exact-pin theorem is 0/1376 open and passes target-specific `verify-publish`.
The ordered ladder and exact risk gates live in
`scratch/erase-classifier-design/DESIGN.md`; M1, M2, M6, M8, M9, and P4-U are
complete, and P4-S/P2/M10 are included in the committed closure checkpoint.
The complete ERASE lane, including the generated certificate fleets and
bounded rebuild driver, is pushed at `652fdfcb`.

The P2 proof build has two measured performance mitigations.  A balanced
support key reduces active searches per native leaf from a 0–65 range to
21–25, and the support-independent candidate domains are constructed once per
leaf rather than once per support, with a proved equality back to the original
classifier.  A representative 23-search leaf built in 715 seconds.
`compiler.small 100` took 714 seconds on the same leaf and was rejected as
noise.  Profiling attributes the remaining cost to `native_decide`'s IR
interpreter; a substantial later speedup would require a compact generated
killed-tree/nogood witness checked by verified Lean rather than DFS replay.
The representative leaf axiom audit has no `sorryAx`, and a source scan of its
evaluated classifier closure finds no project `unsafe`, `@[implemented_by]`,
or `@[extern]` declaration.  The aggregate dispatcher, both count-row
terminals, both payload terminals, and both downstream parents have the same
approved closure with no `sorryAx`.
The resumable `scripts/build-p2-certificates.sh` driver gives Lake at most
eight explicit leaf targets per locked `lake-build` invocation.  This target
batching is the hard concurrency bound; Lake's jobs setting is only advisory.
The first complete group measured 549–1064 seconds per chunk, 736 seconds on
average.  Runtime varies more than support count, so the completed queue grouped
equal chunk indices together.  Late fleet batches took 13m04s-18m22s under the
eight-worker cap; chunk 5 was the slowest observed pair at 18m22s/18m08s.

The optional P3 map is DONE and remains diagnostic. ERASE-P3-SWEEP stays held
under the resource gate; a discovered empirical cut would become proof work
only after a necessity theorem and exact on-spine consumer are specified.

---

## Cross-cutting C — multi-center census (off-spine research)

This work now feeds the bounded ATAIL-FORCE geometric decision surface in
`census/atail_force/`, but it still does **not** supply a Front-B producer or
close either Front-A `sorry`. It remains finite-alphabet infrastructure rather
than a direct closure theorem until the geometric extraction and full-filter
consumer bridges are proved.

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

Step 4 now has an exact statement: force card at least two for the off-surplus
intersection of the full exact-radius filters at the two opposite apices (see
`docs/atail-force-producer-plan-2026-07-13.md`). The first exact Python adapter
now replays all 3,375 L2 rows and restores 167,782 membership-distinct global
orders in a common three-center polynomial frame. The exact combinatorial
reduction has 590 S3 class orbits / 30,997 representative-order cases and 343
raw / 70 S3 equality skeletons. Every raw equality skeleton has an
exact-replayed collapsed `Q(sqrt(3))` witness, so unsaturated equality-ideal
emptiness is a negative terminal. Exact constructive replay also gives all 343
skeletons separator-satisfying real algebraic witnesses. The bounded
full-inequality successor selected seven fixed support-size strata, but Z3
timed out on all seven in 219.901 seconds and classified no row. The checkpoint
deliberately reports `lean_leaf_to_inventory_extraction = false` and
`full_filter_shared_radius_pair = false`. MC-* therefore remains
OFF-SPINE RESEARCH until a concrete geometric extraction and selection-robust
bridge connect that target to the selected-four representative surface. It
must not introduce a `sorry`. Forward persistence alone yields only
qualitative eventual constancy; it does not prove `inventory(n) =
inventory(25)` or the geometric shared-radius pair.

---

## Ordering and sizing

There are two independent open-mathematics clusters. Neither has a complete
known mechanism:

1. **Front-A shared-radius tail:** Candidate-D cross-center convexity coupling
   for `DoubleApexOffSurplusSharedRadiusPair` on the remaining card-at-least-12
   surface.
2. **Front-A liveData families:** the three 24-leaf permutation bands and seven
   terminal center branches in `u1_largeCap_routeB_tail_liveData_false`.
   Closing the shared-radius theorem removes only one downstream dependency;
   it does not close these families.

Front-B ERASE is no longer an open-mathematics cluster.  Its card-{10,11}
P2/P4 source, native fleets, downstream target, axiom closures, and exact-pin
spine gate pass from pushed commit `652fdfcb`. This does not discharge the
repository-wide git/full-build/publication controls.

The former endpoint/pinned cluster is closed (K-B-END-GENERAL and K-B-PIN
DONE) and belongs to route history, not the open-mathematics count.

The optional Census554 pipeline contains substantial engineering and
finite-proof work, but it is not uniformly "bounded to 1–3 sessions": final
cover format, cover-core size, and heavy-certificate cost are not known until
the run freezes. Those uncertainties do not affect the theorem schedule because
card 11 is already closed.

**Historical Census554 checkpoint (2026-07-13 02:53 PDT):** the mutable
card-11 cover loop was live on a verified 5,916-row bank. Iteration 690 contributed
`pat_05897`; the separately validated Oracle-13 residual contributed
`pat_05898`; and four exact-certified speculative motifs contributed
`pat_05899` through `pat_05902` after fresh novelty checks and guarded
publication. Four attempt-1,475 exact motifs then contributed `pat_05903`
through `pat_05906` under the same gates. The sole driver restarted after each
publication transition. Seven attempt-1,486 motifs then contributed
`pat_05907` through `pat_05913`; its hard rank 1 and the final attempt-1,683
candidate contributed `pat_05914` and `pat_05915`. The driver was replaying
the 5,916-row generation. Oracle-13 itself remains a validated
`combined-frontier` terminal result at iteration 316, not Census554 closure.
The bounded four-core producer exited at its one-hour limit with seven
preserved frontiers on the older 5,897-row generation. That batch is fully
resolved: all productive candidates are published, and attempts 1,510 and
1,511 were already covered by the new bank. A new four-core producer was then
running against a 5,914-row matching snapshot; any candidate would have
required a fresh current-bank novelty recheck and sole-writer publication. No
speculative lane had bank-write authority or could by itself advance a closure
row.

This paragraph is retained as dated provenance, not as a current process
claim. Census554 subsequently stopped at the authoritative 5,939-row bank
(SHA-256
`02fbefc4f290458895e9ad9afbb5f7f3401f428747010ed6a47aa8479ff477b2`)
before `CTRL-RESOURCE` transferred to the bounded ATAIL diagnostics. The last
producer reached `frontier-limit` with nine preserved candidates; all
substantive shared-queue jobs are quarantined and no Census worker is live.
The ATAIL Z3 and cvc5 diagnostics have reached their recorded terminal
checkpoints.
Consult the matrix `CTRL-RESOURCE` and A11 rows, then perform a fresh
process/lock/queue/hash check, before resuming Census554 or assigning another
heavy lane.

Execution order is dependency-based, not difficulty-based. The proof-critical
order is:

1. **Wire the checked normalization.** The two-apex card-two extraction and
   sixth-row full-support transfer are kernel-checked in scratch. Import them
   only when the current pair/live owner can give each an immediate on-spine
   consumer; do not overwrite the concurrently owned source.
2. **Prove the content-bearing producer.** From exactly the current leaf
   hypotheses, prove the fiber lower bound, force the seven equalities consumed
   by `u1TwoLargeCapObstruction`, or derive `False` directly. Audit the six
   critical rows field by field before launching a larger solver surface.
3. **Use computation only to discover the theorem.** The reduced three-center
   systems and any CEGAR survivors may identify recurrent equality/order
   skeletons. The completed 343-skeleton replay rules out the bare and
   separator-saturated equality-only route, so the next candidate must use
   real cap/disk/nonobtuse/global-order inequalities or the live critical
   rows. Both Z3 and cvc5 timed out on the same seven full-inequality systems,
   and the three checked scalar kernels jointly cut only 129 of 167,782
   selected-four systems, so neither another blind cross-engine/budget
   escalation nor continued unguided local-kernel enumeration is a next step.
   Computation resumes only behind a full-filter or critical-row forcing
   principle that explains why a checked pattern must occur.
   Every proposed universal lemma must also be checked against the
   W16/W20 non-convex falsifier bank and must identify the actual convexity or
   critical-row hypothesis that excludes those witnesses. No representative
   result is promoted without the leaf-to-inventory and certificate bridges.
4. **Consume the producer by orbit family.** This session is anchored at
   LIVE-T1, but the shared Route-B parent is owned by another live session and
   must not be overwritten. After K-A-PAIR closes, wire the two checked T1/T3
   relabeling adapters, which make those 48 textual holes depend only on that
   residual. Apply any remaining six-row producer to LIVE-Q and the seven
   LIVE-C branches. Do not patch the 79 textual holes one by one.
5. **Use AHEAD only as fallback.** If the uniform producer naturally needs
   `15 ≤ D.A.card`, a checked AHEAD cover may discharge cards 12--14 and
   authorize AHEAD-CONSUME. If the producer works from card 12, retire the head
   census from the closure path.

Adam's 2026-07-13 AHEAD-DEC authorization still permits bounded parallel head
research, while heavy AHEAD-N12/N13/N14 execution remains serialized through
`CTRL-RESOURCE`. It is not deferred on Census554, but neither optional census
may delay steps 1--4 above.

The optional Census554 lane retains this internal order. It may run alongside
proof work subject to `CTRL-RESOURCE`, but it does not gate any kernel row:

1. **Stabilize operations and ownership.** Resolve the concurrent generated
   rewrite; refresh the mined graph and `anchor list`; move Census554 into
   `census/census_554/`; finish the remaining permanence work. Keep the active
   lifetime driver lease, transaction publisher, and durable terminal gate as
   mandatory invariants across every restart.
2. **Advance bank-independent Census interfaces.** Build
   `GeometryBridge.lean` and the abstract combinatorial/geometric cover
   interfaces. The support-injection bridge is already DONE. These consume no
   final bank.
3. **Mine the adjudicated oracle-13 residual.** Oracle-13 has reached a checked
   `combined-frontier`; preserve its terminal artifacts and the iteration-813
   rollback, and keep the active consumer bound to the exact 5,836-row bank.
   Mine, exactly certify, and novelty-check any residual pattern before routing
   it through the sole mutable-bank publisher. Only a later checked UNSAT
   licenses the freeze/core/replay rows. A transition to a newer mutable bank
   requires a separate measured decision and the same preservation/integrity
   gates.
4. **Minimize before replay.** Extract the pattern IDs used by the checked
   cover, then generate and replay that core only. Apply certificate shrinking
   or checker optimization only to heavy certificates that survive the core.
5. **Optional independent replay.** If the Census reaches a checked terminal
   cover, prove `false_of_cardEleven_twoLargeCaps` as a separate theorem. Do not
   dispatch leaf wiring from this result: card 11 is already closed and the
   live proof work is card ≥ 12.
Proof work proceeds independently according to the primary order above. ERASE
is closed and needs no further proof work; optional ERASE-P3, AHEAD, Census554,
and MC experiments run only under their explicit decision and resource rows.
The 30,997 reduced or 167,782 raw ATAIL systems are not a license for an
ungated bulk nonlinear sweep.

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
