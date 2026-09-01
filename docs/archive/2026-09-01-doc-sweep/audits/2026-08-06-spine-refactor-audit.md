# Production spine refactor audit — 2026-08-06

Read-only audit of the production Lean spine for refactor opportunities that
shrink the proof surface, consolidate leaves, or improve build time. Method:
import-graph closure parsed from source, decl-level reachability BFS over
`data/proof-blueprint.db` (`symbol_refs` ∪ `type_former_refs` from
`Problem97.erdos97_rhs` / `Problem96.erdos96_rhs`), tactic/heartbeat census,
git edit-heat (2026-07-16..08-06), and source-grep spot verification. No
builds were run; elaboration times are proxied by line counts, olean sizes,
and the 2026-07-14 measured analysis (nthdegree memories 37SV84, BVXPQA,
4G0JJB). Companion file: `2026-08-06-spine-refactor-audit-dead-candidates.txt`
(the raw screening list).

## Spine shape

- Import closure of `Erdos9796Proof.lean`: **3,988 modules / 1,053,083 lines
  / 84.5 MB** (2026-07-14: 2,061 modules / 803k lines).
- Decl-level kernel spine: 287k lines / ~36k decls (`proof-blueprint spine`).
- Three generated certificate families are ~73% of closure lines:
  `SurplusCertificate.RelaxedSplit` 310k L / 392 files;
  `ATail.CardElevenUniqueFourCertificate` 275k L / **2,442 files**;
  `EndpointCertificate.Patterns` 183k L / 219 files.
- Line-weighted critical path: ~96k lines over 76 modules — the DAG is wide;
  cold-build wall time is total work + per-module cost, not chain depth.
- Tactic census on the closure: 16,506 `decide`, 13,426 `native_decide`
  (11,946 in the CardEleven family), 1,450 `maxHeartbeats` overrides,
  30 full-`import Mathlib` modules.
- 31 open obligations, all in `Problem97.ATailFrontierLiveClosure` — the
  active lane; refactors must stay out of its way.

## Build-time opportunities (ranked)

### B1. Decouple `RemovableVertexAxiom/Continuation.lean` from `PinnedSurplusBank`

`Continuation.lean:1` imports `PinnedSurplusBank`, whose chain
(`RowZeros.Bank` → `ExactBridge` → `RelaxedSplit.All`) pulls the entire
SurplusCertificate tree. Continuation consumes exactly one bank theorem:
`isM44PinnedSurplusResidualsExcluded` (used at `Continuation.lean:732`,
proved at `PinnedSurplusBank.lean:79`). Forward closure of Continuation is
**3,980 of 3,988 spine modules**; its downstream is 6 modules. Any
invalidation anywhere in the cert tree therefore blocks the Continuation
edit loop (4 edits in the last 3 weeks; memory 4G0JJB measured ~1h such
builds on 2026-07-09, when the closure was 1,461 modules — it is now 2.7×
that). Fix shape: `removableVertexOfLarge_of_isM44PinnedSurplus_from_residualSplit`
(`Continuation.lean:713`) already takes the bank fact as an argument — move
the one composition theorem (`Continuation.lean:728`) plus its downstream
wrapper (`Continuation.lean:784`) into a small assembly module that imports
Continuation + PinnedSurplusBank, and drop the bank import from Continuation.
Status: **in progress this session** (this is the change accompanying this
audit).

### B2. Retire the dormant Census554 algebra branch behind `GeneralCarrierBridge`

Zero spine-reachable decls (per refs DB) in: all 27
`SevenPointSixCircleCollisionBCertificateStage*` modules (each
`import Mathlib` + `maxHeartbeats 24000000`; historically 30–305 MB oleans,
the multi-GB elaboration peaks named in `scripts/cold-build-benchmark.sh`),
`SevenPointTwinFourCircleCollision` (2,993 L; historically a 931 MB olean),
and the `AlgebraicRowCollisionBank` subtree (12 modules / 8.7k L incl.
`NineCenterEighteenEqualityCertificate` 3.8k L). Sole live importer:
`Census554/GeneralCarrierBridge.lean`. Caveat: GeneralCarrierBridge still
*states* `SevenPointTwinFourCircleCollisionCore` disjunctions
(`GeneralCarrierBridge.lean:258,380`), so this is not a bare import
deletion — the apparently off-route disjunction theorems retire with the
imports. {{NEEDS_PROOF}} — requires a fresh refs mine + trial cut +
`lake-build` adjudication. This was lever #1 of the 2026-07-14 analysis and
is still open; bounded blast radius (one importer).

### B3. Shard-size consolidation in the CardEleven generated banks

`Generated/Unique4ExactTwoLratIngress`: 1,664 files averaging **29 lines**
(SAT replay shards); `Generated/ExactFiveCommonShellV7G3Replay`: 334 files.
Per-module lake job overhead (process + env load) exceeds content cost at
that size; a ~10:1 merge removes ~1,800 build jobs with no proof change.
Sharding was deliberate (per-module memory/time caps — memories 9QXS8B,
EXWSN8), so the move is re-tuning shard size in the emitter, not
un-sharding.

### B4. Split `ATail/FrontierLiveClosure/Rigid221SourceHeavy.lean`

9,554 lines, 15 edits in 3 weeks — hottest heavy file, fully re-elaborated
per edit. Downstream cascade is small (21 modules), so the pain is
intra-file. Stable-prefix / active-frontier split along section boundaries;
active-anchor lane, so do it as a checkpointed refactor there.

### B5. Hygiene

- `.lake/build` is **111 GB**, 16,354 package oleans vs 4,712 source files
  → roughly 11.6k stale artifacts from retired/renamed modules (was ~25 GB
  of staleness on 07-14). Targeted orphan GC reclaims most of it.
- `benchmarks/` has no logs — `cold-build-benchmark.sh` has never recorded
  a run. One run would rank B2–B4 in measured seconds.
- Editing `SurplusCOMPGBank` invalidates 1,692 modules / 857k lines;
  `Foundation` 1,719 modules. The 07-14 defs/proofs split idea for
  SurplusCOMPGBank remains valid but its edit heat has dropped.
- 30 full-`import Mathlib` modules (27 of them the SixCircleB stages —
  subsumed by B2; also `EndpointCertificate.Soundness`, `U5GramCertPoly`,
  `U1Depth5AnchorProduct`, `Unique4P4CompactAtomBinding.AtomBinding`).
- `lean/_pb_snippet_j0rxw37l.lean` is a leftover scratch snippet at the
  package root.

## Proof-surface / dead-cargo findings

- **652 package files are outside the build closure entirely** (386
  `ErasedCertificate`, 153 `Census554`, 32 `ATail`, misc U1Depth5 record
  singletons) — never built by the default targets; attic candidates.
- **Verified dead import:** `SurplusM44Packet/Shard09.lean` (883 L) is
  imported at `SurplusM44Packet.lean:15` but no Shard09 decl is referenced
  in the aggregator (source grep). Retired-shard leftover.
- **Screening list (NOT a delete list):** 572 non-certificate modules
  (~73k lines) show zero spine-reachable decls; ~97k further unused
  decl-lines inside partially-used files (top: `SurplusCOMPGBankGeometry`
  9.8k of 16.4k L unused; `RemovableVertexAxiom/Base.lean` 6.7k of 9.5k).
  The refs DB has **confirmed false positives**: `U1Depth5Prefix`
  (used at `ConvexCyclicOrder/ShellCurvatureRows.lean:427`),
  `TwoSourceFirstFiberCollision` (its `false_of_twoCapSources_freshThirdBlockerFiber_core`
  is consumed), and the `ExactFiveCommonShellV7` lane (consumed at
  `ATail/FiniteN11Frontier.lean:145`) all screen dead but are live —
  statement-level (type-former) edges are missing from the mine even for
  files re-mined 2026-08-06. Recipe per candidate: refresh mine, source-grep
  decl names, trial import cut, `lake-build`. See companion file.
- The skip-listed cert families (`[mining].skip` in `.blueprint.toml`) are
  behind a declared trusted-leaf boundary — 1,041 files / 532k lines show
  zero reachable decls *by construction*; no deadness claim is made there.

## Leaf consolidation

- 20 trusted leaves ride on three distinct certificate ingestion stacks:
  polynomial `native_decide` checkers (Surplus/Endpoint), LRAT/RUP `decide`
  replay (CardEleven), native eval gate (`erase_m1_gate`). Unification is
  long-term; not near-term leverage.
- `RowZeros` infrastructure is mirrored between `EndpointCertificate` and
  `SurplusCertificate` namespaces by design (different rule vocabularies per
  the file headers). A shared parametrized core is possible; lowest leverage
  of the items here.

## Analysis artifacts

Scripts (session scratchpad, reproducible against the repo):
`spine_closure.py`, `spine_analysis2.py`, `dead_weight2.py`, `cut_edges.py`,
`cascade.py`, `tactic_profile.py`, `staleness.py`. The dead-candidate
screening list is committed alongside this doc.
