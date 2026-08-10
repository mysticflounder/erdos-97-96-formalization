# 2026-08-09 Lean codebase refactor audit

Nine parallel read-only audit agents covered the full `lean/` tree (static
analysis only; no builds were run). Scopes: architecture/build config, P97
top-level A–P, P97 top-level Q–Z, the U1 family, ATail, the Surplus banks,
Endpoint+Erased banks, Census554/MultiCenter/small dirs, and a cross-cutting
hygiene lane. This document merges, deduplicates, and ranks their findings.
Load-bearing claims were independently re-verified before writing (see
"Verification" at the end).

## Corpus baseline (measured 2026-08-09)

- 4,759 library modules / 1,278,017 lines / 55,179 declarations under
  `lean/Erdos9796Proof/`.
- Default-target import closure: 3,959 modules / 1,059,890 lines.
  **800 modules / 218,127 lines (17%) are outside every build target.**
- 40 real `sorry` tokens in 39 declarations in 10 files, all reachable, all
  matching `docs/live-blueprint.md` exactly (34 on-spine + 5 off-spine).
  One additional `sorry` sits inside a commented-out block
  (`P97/U1LargeCapRouteBTail.lean:2446`).
- **Zero project `axiom` declarations.** The trust surface is the sanctioned
  core + compiler tier (`.blueprint.toml [axioms]`, `comparator/config*.json`).
- 13,173 `native_decide` occurrences in 1,774 reachable modules.
- `.lake/build` is 25 GB; repo pack is 2.4 GiB, of which `scratch/` ≈ 510 MB
  and `attic/` ≈ 72 MB.

## Prior-work status confirmations (no action, recorded so they are not re-derived)

| Item | Status |
|---|---|
| B1 (Continuation bypass, 2026-08-06 audit) | landed |
| B2 (Census554 algebra-branch retirement) | landed in working tree, **uncommitted**; physical attic move not done |
| B3 (CardEleven shard consolidation) | open, unchanged |
| B4 (split `Rigid221SourceHeavy.lean`) | open; file grew 9,554 → 16,233 lines |
| T2 (endpoint kernel-decide rewrite) | landed and verified (0 `native_decide` left in `EndpointCertificate/RowZeros/`) |
| L1/L2 (shadow-search shard prune) | landed (480 shards, matches plan) |
| T1 (tau clearing) | correctly dropped (measured 2.74× payload regression) |
| `dist_sq_coord` dedup (2026-07-27 audit) | landed |
| ErasedCertificate July refactor (`restrictDomainsChecked`, P4-S rebalance) | holds; the evaluator-order constraint (no permutation-invariance theorem) still applies |
| `U1LargeCapRouteBTail` disposition | keep as compat/bank per standing decision; do not delete |

## Tier 1 — correctness and reproducibility (small effort, do first)

1. **42 load-bearing `include_str` assets are ignored by git.** `.gitignore:17`
   (`data/`, unanchored) swallows
   `…/ExactFiveCommonShellV7/data/` (42 files, 560 KB), consumed in
   declaration bodies of in-closure modules (`G3BaseSliceLedger.lean:45`).
   A fresh clone cannot build the default targets. Fix: anchor the DB rule to
   `/data/` (or add the negation pair), `git add` the 42 files, and add a
   preflight check that every `include_str` target under `lean/` is tracked.
   Verified: 42 on disk, 0 tracked, `git check-ignore` blames `.gitignore:17`.

2. **Untracked / uncommitted live source.**
   `P97/U3ToU5MixedExtraction.lean` (493 lines) is untracked; the B2 import
   unwiring in `Census554/GeneralCarrierBridge.lean` is uncommitted. Commit
   both.

3. **`lean/lakefile.toml:9` states the wrong unit for `-s`.** The comment says
   bytes; `lean --help` says Kb. The value (2 GiB) is correct. A reader who
   trusts the comment and "fixes" the flag invalidates every olean in the
   package. One-word comment fix.

4. **`lake build` does not check three published headline results.**
   `FiniteN10Closure` / `FiniteN11Closure` (README lines 188/191) are outside
   the default closure; the only reference to `FiniteN11Closure` is a scratch
   probe. Adding `FiniteN10` + `FiniteN11` to the root costs 3 modules / 334
   lines. Prefer root imports over adding `Solution` to `defaultTargets`.

5. **No emitter exists for the U1 generated shards.** 30 U1 files carry a
   "generated from checked liftstd cofactor sidecars" header, but no script in
   the repo emits that shape. Every U1 consolidation below is an emitter change
   with no emitter to change. Recover and check in the emitter (with its flag
   set) before regeneration-based work. {{NEEDS_ADAM_INPUT}} (where does it
   live?)

6. **Pin `formal_conjectures`.** `lakefile.toml` tracks `main` while mathlib is
   tag-pinned; a `lake update` silently moves the upstream statement
   definitions. Pin to the resolved SHA `89a67be…`. Also fix the stale upstream
   reference in `P97/Foundation.lean:7` and dedupe the two `lean-toolchain`
   files.

## Tier 2 — build coverage for banked work (small effort, high rigor value)

7. **Give the off-closure banks an aggregate build target.** 800 modules /
   218k lines are never elaborated by any target. Highest-stakes subsets:
   - `ATail/FrontierLiveClosure/`: 108 modules / 571 theorems of CEGAR cuts
     authored 2026-08-07..09 that the kernel has never checked, growing daily.
     Add a `CutBank.lean` aggregate (emitter-appended) or a second `lean_lib`.
   - The three MultiCenter completion theorems that
     `docs/audits/2026-07-08-multi-center-joint-census-results-audit.md`
     cites to close the L2 completeness concern live in the unbuilt
     `MultiCenter/Certificate/` subtree. Either build them or annotate the
     audit that the claim rests on a 2026-07-09 build.
   - The staged U1/Phase3/K4WindowBank reserves (62 loose P97 files).
   A reserve aggregate makes "staged vs rotted" machine-checkable; without it
   a mathlib bump can silently break banked results.

8. **Align `.blueprint.toml [mining].skip` with the real `native_decide`
   surface.** The config names only `*.EndpointCertificate.*` and
   `*.SurplusCertificate.*` as trusted leaves, but 1,232 reachable modules use
   `native_decide` outside that boundary — 1,128 of them under
   `ATail/CardElevenUniqueFourCertificate/`. Either extend the skip list or
   record the intent; the config should describe the actual compiler-trust
   surface. Also add `*.U1Depth5SourceUnitGenerated.*` if the U1 bank is ever
   re-imported.

## Tier 3 — build-cost and invalidation-radius refactors

Batch these into scheduled rebuild events; several invalidate wide subtrees.

9. **Remove 10,614 discarded `(by native_decide)` constructor arguments in
   `P4MirrorOuterOccurrenceBridge`** (89% of ATail's `native_decide`; 79% of
   the spine-wide count). The smart constructors bind the proof as `_` and the
   records have no proof field (verified at `Families.lean:56-60`); the
   chunk-level `_wf` theorems already carry the real obligation. Generator:
   `scratch/atail-force/unique4-p4-mirror-outer-occurrence-bridge/generate.py`
   lines 378/387/393; `validate.sh` exists. Priority: high; effort: small.

10. **Extract `SurplusCOMPGBank.Label` into its own module.**
    `SurplusCertificate/RowZeros/RuleData.lean:8` imports the full 2,290-line
    bank for 12 references, all `SurplusCOMPGBank.Label` (verified). One new
    file + one import edit frees 393 modules / 310k lines of certificate
    payload from the row-bank/DFS invalidation set.

11. **Split `ErasedCertificate/ErasedNativeClassifier.lean` at line 138**
    (kernel vs finite-shell contracts) and repoint `P2PlacementDefs` /
    `P4SPlacementDefs` at the kernel half. Drops the 64 heavy native leaves
    (median 33–65 min each) from a 112-module upstream closure to ≈4, closing
    the collateral-invalidation hazard documented 2026-07-30. Pays one full
    erased-bank rebuild; batch with the P4-S chunk rebalance (adopt the P2
    fold; slowest leaf −18% on a mask-count proxy) and, if desired, the
    placement-lane unification.

12. **Lift `CertificatePayload` out of `EndpointCertificate/Patterns/All.lean`**
    and split `AggregateSoundness`. Each of 117 row-zero modules drops from a
    249-module / ~707 MB import closure to ≈29 modules / ~7 MB; a
    single-payload edit stops invalidating 127 EndpointCertificate modules.
    Generator: `scripts/endpoint-certificate.py:1068,1340,1910`.

13. **Split the unconsumed q-critical kernel bank out of
    `U5GlobalIncidenceKernels.lean`.** 1,527 of 2,388 lines have zero
    consumers, including all six 5M-heartbeat `nlinarith` kernels; 1,247
    downstream modules elaborate them on every build. Template:
    `U5GlobalIncidenceQDeletedTetrahedron.lean`.

14. **Split `U1Depth5Prefix.lean`** into a spine-facing core (~600 lines; the
    spine consumes exactly two names from a 160-line window) and a
    Record001 bank surface (1,042 lines). Pair with extracting the 16-line
    label vocabulary out of `U1Depth5AnchorProduct.lean`, which currently
    pulls a full `import Mathlib` into the spine closure.

15. **Shard the two big hand-written monoliths.**
    - `SurplusCOMPGBankGeometry.lean` (16,385 lines, 731 downstream): seams
      are enumerated in the Q–Z agent report; a head-first `lean-shard` split
      removes 146 modules from the cascade for bank-region edits.
    - `ATail/FrontierLiveClosure/Rigid221SourceHeavy.lean` (16,233 lines, 10
      open obligations, 19 commits in three weeks): rerun
      `scripts/shard_frontier_live_closure.py --check`; put the active
      obligations in one small shard. Coordinate with the lane owner.
    - `RemovableVertexAxiom/Base.lean` (9,546 lines, hottest file in its
      scope): split the 26 `abbrev *Statement` interface into
      `Base/Statements.lean` so proof edits stop invalidating the interface.

16. **Regenerate `ErasedPinFixedSeedDFS.lean` without its three dead
    families** (1,593 lines, 60 dead `native_decide` on-spine; generator
    `scripts/erased-pin-producer-census.py`). One-line spine trims in the same
    rebuild: drop `N4d/FaithfulFrame.lean:2` (removes the unused 984-line A1
    lane), drop `SurplusM44Packet.lean:15` (Shard09, 882 lines, 21/21
    declarations unreferenced — third independent confirmation), and the
    `OangleBridge` / `MidpointInequality` / `IsoscelesCount` residue trims
    from the A–P report.

17. **Back-port the endpoint `rulesOK` kernel-decide design to
    `SurplusCertificate/RowZeros`** (135 `native_decide` → `decide`, 48% of
    the scope's compiler-trust calls; emitter templates at
    `scripts/pinned-surplus-certificate.py:2772,3062`). Measure one row first
    (the pid-filtered fold may need an index). Related same-touch items: the
    8 bookkeeping `native_decide`, 135 `norm_num` bound proofs in
    `RowZeros/Bank.lean`, and the 664 redundant `set_option` lines.

18. **Freeze `P97/Foundation.lean` as an interface.** 86 lines whose edit
    invalidates 2,415 modules (61% of the closure). Additive changes only;
    batch any split (statement abbrevs vs geometry lemmas) into an already
    scheduled full rebuild. When it is next opened anyway, add the
    inner-product/Lagrange coordinate lemmas that four modules currently
    re-derive privately.

## Tier 4 — dead-code disposition {{NEEDS_ADAM_INPUT}}

No deletions without sign-off; all items have zero live importers (verified by
the agents; spot-checked for the largest).

| Candidate | Size | Suggested default |
|---|---|---|
| `MultiCenter/Certificate/` (17 modules; regenerable from `scripts/multi-center-sweep-certificate.py`, inputs on disk) | 102,664 lines + 81.5 MB oleans | attic as a unit, or re-emit compact (~92k → ~7.3k lines) |
| Census554 retired lanes A–D (algebra branch, 7 unimported `Bank/Pat*`, `CapSelectedBV*`, nogood trio) | 32,471 lines | finish the audited B2 move; attic with provenance notes |
| 384 ErasedCertificate placement orphans (stale July-13 oleans; docs still call them load-bearing) | 8,064 lines | delete; update `scripts/build-erased-certificates.sh` header |
| U1 off-closure bank subtree (40 files; keep `U1LargeCapRouteBTail` per standing decision) | 27,309 lines | relocate to `P97/U1/Bank/` + reserve target; fix the stale `RVOLSpine` header claim |
| ATail: 21 never-imported top-level modules + the 10 behind the RouteBTail edge | 6,733–10,298 lines | attic the 21; RouteBTail set stays with the keep decision |
| `SurplusCertificate/GeometryBridge.lean` (superseded 1:1 by `GeometryCore`) | 499 lines | delete |
| `EndpointCertificate/EpQ2000.lean` (pre-T2 prototype shadowing the live module) | 376 lines | delete |
| `ErasedPinOrderedProducer.lean` (0 references anywhere) | 2,406 lines | attic or wire with a stated purpose |
| `Geometry/` strays + `MEC/ShortestSideDiskAdapter` two-module dead lane | ~960 lines | adjudicate |
| 19 promoted-but-never-wired Census554 obstruction cores | 5,524 lines | per-module wire-or-attic (owner call) |

Follow-on once moved: re-run the existing orphan olean GC (~1.5 GB reclaim).

## Tier 5 — duplication consolidations

- **Frame transport atoms:** the ~324-line private block is in 7 modules
  (~3,100 redundant lines measured); the code itself prescribes the dedup
  ("make those public when the W3 gate lifts"). Confirm the W3 gate, then
  hoist into one `P97/FrameTransportAtoms.lean`. {{NEEDS_ADAM_INPUT}} (gate
  status)
- **`SurplusCapPacket` projection lemmas:** 170 identical-statement clusters
  in hand-written reachable modules, 376 redundant re-proofs; the eight
  packet projections and `dist_sq_coord`-family aliases are the bulk. One
  mechanical pass, batched with a Foundation-adjacent rebuild.
- **U1 manifest re-emission:** six Manifest files restate 2,781 lines (83%)
  and re-elaborate 6 duplicate `native_decide`; regenerate in the
  `PostAll8Manifest` import-the-base shape.
- **U1 clone families:** 9 `ExtraOmit30xx` + 5 `Branch0PairCollision*`
  (5,541 lines at 88–97% similarity) merge into 2 modules; the emitter
  provably supports multi-cert files (`…NonF1.lean`).
- **`U5QDeleted`→`U5QAllowed` routing:** re-prove the copied class lemmas
  through the existing `toQAllowedK4Class` (~200 lines; the correct pattern
  already exists at `U3ToU5MixedExtraction.lean:89`).
- **`SurplusCOMPGBankGeometry` internal families:** 19 verbatim
  `_seedShadow_pointClasses` copies (~970 → ~180 lines) fold cheaply; the
  26-instance left/right `Side` family (3,030 lines) waits for the anchored
  lanes to settle.
- **`WitnessPacketInterface`:** extract the duplicated 24-line `hfilter_eq`
  proof and move the 174-line zero-consumer packet block off the
  1,699-module seam.
- **Mathlib re-proofs:** `list_all_eq_true_of_mem` (10 copies) →
  `List.all_eq_true`; `eq_of_mem_of_mem_card_eq_one` → `Finset.card_le_one`.
- Negative results, recorded so they are not re-proposed: no exact-duplicate
  files or superseded generations in ATail; only one symmetry-duplicate
  certificate in the 135-cert surplus bank; the small bottom-of-DAG
  directories (Cap, CGN, Moser, U2, N8, ConvexCyclicOrder, Dumitrescu,
  Certificate/) should **not** be consolidated; endpoint shard granularity is
  correct (fix import weight, not module count).

## Tier 6 — hygiene

- **`linter.style.longLine` suppressions:** the lakefile disables it
  package-wide "so no source file needs its own set_option", yet ~1,860
  emitted files still carry the line (960 + 529 + 336 + 35 across scopes).
  Fix the emitter templates; strip existing files only inside an already
  scheduled rebuild.
- **`maxHeartbeats 0`:** ≈1,527 occurrences package-wide (1,253 in reachable
  modules) disable the only per-declaration timeout; the sole backstop is
  `-M16384`, and one hung module blocks the serialized build lane. Replace
  with a large finite bound in generator templates first; validate with a
  build.
- **`linter.style.nativeDecide` policy:** 348 hand-written suppressions vs a
  package-wide decision — pick one convention (the comparator manifests are
  the real disclosure).
- **Naming:** rename `RemovableVertexAxiom/` (no axiom exists; obligation
  discharged; 17 source files + 23 docs), split/rename `U1CarrierInjection`
  (two disjoint halves, 24 of 25 importers use one), retire the
  `U1LargeCapRouteBTailMetricResidualTarget` namespace in the cap-profile
  files, adopt the U1 directory layout from the U1 report (rides on the bank
  relocation).
- **Doc drift:** `P96/UpstreamBridge.lean:36-38` hard-codes a stale
  obligation count (point at `proof-blueprint spine` instead); the T2 plan
  text overstates file deletion; evaluator items 1–2 are done but still
  listed as pending; `proof-blueprint` live mine is stale (run `sync` at the
  next build).
- **Repo weight:** invert the `scratch/` gitignore policy
  (ignore-by-default + whitelist — the current exception-based rule set is
  how Tier 1 item 1 happened); gitignore
  `scratch/rigid221-sourceheavy-anchor/*-source/` (4 untracked full-repo
  copies, ~23 GB); stop committing `scratch/atail-force/*/generated/*.lean`
  (381 files ≥90% identical to promoted modules, ~100k lines);
  `lean/scratch/` should move out of the package root (340 indexed symbols,
  24 exact name collisions with live ATail declarations); untrack
  `lean/bank_frontier.log`; add `/lean/*.log`, `/lean/scratch_*` ignore
  rules; remove empty `lean/vendor/`.
- **`autoImplicit`** is still on (only `relaxedAutoImplicit` is off). Flip it
  only inside a scheduled full rebuild; probe a few core files first.

## Suggested sequencing

1. Tier 1 (all small, no rebuild cost) + Tier 2 target wiring.
2. Tier 4 dispositions (no rebuild cost — the candidates are unbuilt), then
   the olean GC.
3. One scheduled rebuild event bundling: mirror-bridge argument removal (9),
   Label extraction (10), Erased split + P4-S rebalance (11), payload lift
   (12), U5 kernel bank (13), U1 Prefix/AnchorProduct split (14),
   `ErasedPinFixedSeedDFS` regeneration + spine trims (16), emitter template
   hygiene (longLine, maxHeartbeats). Run
   `scripts/cold-build-benchmark.sh` once before and once after — no measured
   build profile exists yet, and B3/B5-class decisions depend on one.
3. The monolith shards (15) as lane-coordinated checkpoints.
4. Tier 5 duplication passes, gated on the W3 question and lane quiet.

## Verification

Independently re-checked in the main session before writing this document:
zero `axiom` declarations (the single regex hit is prose in a docstring);
`.gitignore:17` ignores the 42 `include_str` assets (42 on disk, 0 tracked);
`MultiCenter/Certificate` has no source importer outside itself (only `.lake`
build artifacts match); `Families.lean:56-60` binds the constructor proof as
`_` with no proof field in the record; `RuleData.lean` imports
`SurplusCOMPGBank` and references only `SurplusCOMPGBank.Label` (12 hits).
Agent-measured numbers (closure sizes, fanouts, similarity percentages,
olean weights) were cross-consistent between independent agents where scopes
overlapped (e.g. 800 off-closure modules measured twice; Shard09 confirmed
three times) but were not all re-derived here.
