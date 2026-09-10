# Postmortem: Lean and mathlib v4.27.0 to v4.33.1 migration

Work window: 2026-09-07 08:43 to 2026-09-09 21:59 (local).
Written: 2026-09-09.
Base commit: `15cb02b27`. Last migration commit: `da400a7a1`.

## 1. Summary

The repository moved Lean and mathlib from v4.27.0 to v4.33.1.
The pin change broke about 240 to 300 proof sites.
Two upstream changes caused most of the breakage.
The team repaired the sites in 28 numbered waves and merged the work to `main`.

The migration also found three problems that the pin change did not cause.
It only made them visible.
These are the build-closure orphans, one fail-open bank pin, and the stale
generator scripts.
Section 8 lists what is still open.

Note on the request: the task named v4.29 as the start point.
The evidence shows v4.27.0.
Commit `2b05fcec2` changes `-leanprover/lean4:v4.27.0` to
`+leanprover/lean4:v4.33.1`.

## 2. Timeline

| Time (local) | Event |
| --- | --- |
| 09-05 | GPT audit writes the upgrade plan `docs/plans/2026-09-05-lean-mathlib-v4331-upgrade-audit.md`. No Lean ran. |
| 09-07 08:43 | Base commit `15cb02b27`. |
| 09-07 14:15 | Local audit of the migration and upload readiness (`39000ab54`). |
| 09-07 15:26 | Pin bump and first repair rounds (`2b05fcec2`), in worktree `.worktrees/mathlib-v4331-migration-20260907`. |
| 09-07 22:25 | Progress audit (`3f1e0db6f`). |
| 09-08 05:20 | Codex audit result: NEEDS WORK. Findings F1 to F4. |
| 09-08 11:53 | All migration checks move to the global `lake-build` wrapper. |
| 09-08 20:25 | Merge to `main` (`eff3360b3`). |
| 09-08 20:33 | First repair wave on `main` (`521c00127`). |
| 09-09 08:44 to 15:33 | Waves 2 to 24. Most waves take 3 to 20 minutes. |
| 09-09 15:23 | Build-closure orphan census (`0707e2c26`). 1383 orphans found. |
| 09-09 15:25 | Static regression-candidate scan (`6ec0f2a62`). |
| 09-09 19:57 to 21:29 | Bank-support repair waves. Class AV. |
| 09-09 21:35 to 21:45 | Bank refreeze blocker found and repaired (`290350b3b`, `a3f51e55b`). |
| 09-09 21:49 | Lean-ingress record rebound under v4.33.1 (`20f554759`). |
| 09-09 21:56 | Gate E acceptance script added (`552969a48`). |
| 09-09 21:59 | Fail-open bank pin recorded (`da400a7a1`). |

## 3. Scope

Counted from Git in the range `15cb02b27..HEAD`:

- 89 commits in the range. 41 belong to the migration.
  The other 48 belong to a parallel Prove2Me stream that ran at the same time.
- 265 different `.lean` files changed. 304 file-touches in total.
- Lean line count: +2612 insertions, -2299 deletions.
- The breakage catalogue holds classes A to AX. It has 786 lines.
- Library size: 6535 modules under `lean/Erdos9796*`.

The audit of 2026-09-08 counted 351 changed files at that time.
344 of them were Lean files.

## 4. Symptoms

### 4.1 What the build showed

- The full build failed after the pin bump.
  The first frontier had 9 failed modules.
  Later frontiers had 6, 3, 1, and 13 modules.
- Error 1: `Type mismatch: After simplification, term has type X but is
  expected to have type Y`. X and Y print the same text.
- Error 2: a stuck match on a `Fin` numeral.
  The goal shows `match 0 with | ⟨0, _⟩ => ...`.
- Error 3: `(deterministic) timeout at whnf` on a generated list.
- Other errors: no `noncomputable` on `SimilarityFrame`; no `dist_eq_norm`
  bridge; `HasDerivAt` convert descends into instances;
  `List.Subset.trans` name change; `Std.Sat.CNF` type change.

### 4.2 What made the symptoms hard to read

- An error count overstates the site count.
  v4.33 error recovery reports one real failure at several positions.
  Measured cases: 7 real sites gave 13 errors (class AE).
  1 real site gave 13 errors (class AG).
  1 real site gave 4 errors (class AF).
- The breakage looked sporadic.
  For a `Fin` selector, index 2 still worked through the wildcard branch.
  Only the index-0 and index-1 sites failed.
- An idiom that broke in one file often worked in 30 other files.
  The shape-1 `simpa` idiom appears 103 times in 34 files.
  30 of those files stayed green (class AD).

### 4.3 Operational symptoms

- Gate D failed with `incompatible header` on 1264 stale oleans.
  These were v4.27 artefacts.
- A parallel `lake env lean` fan-out gave cascade noise.
  149 of the first 153 results were noise, not real errors.
- The host became unstable. The user reported a box crash.
  The user then required the global `lake-build` wrapper for every build.
- The mathlib cache hook passed a stale cache and permitted a full source
  rebuild of mathlib.

## 5. Root causes

### 5.1 Root cause A: `simpa ... using h` closes at reducible transparency

`simpa using h` now unifies the simplified term against the simplified goal
at reducible transparency.
`simpa using! h` keeps the old default transparency.
Source: `Lean/Elab/Tactic/Simpa.lean` in the v4.33.1 toolchain.

Terms that are defeq at default transparency fail at reducible transparency.
The fix is `exact h`, because `exact` uses default transparency.
The team did not introduce `simpa using! h`.
That idiom appears nowhere in this repository, and adding it across many
files was rejected as a deliberate call.

### 5.2 Root cause B: full `simp` makes `Fin` matchers unreducible

Full `simp` rewrites a `Fin.mk` scrutinee into a `Fin` numeral.
`Fin.zero_eta` and `Fin.mk_one` do this.
v4.33 does not iota-reduce a match through an `OfNat` numeral.
The matcher then goes stuck.

The fix is `simp only [...]`, which keeps the scrutinee in constructor form.
Erasing the two lemmas with `-Fin.zero_eta` does not work.
Only the drop to `only` works.

### 5.3 Root cause AA: the simp ground evaluator

v4.33 `simp` carries a ground evaluator.
Source: `Lean/Meta/Tactic/Simp/Rewrite.lean:435-465` and `Types.lean:822`.
It delta-unfolds a `def` with a closed ground body by itself.
It then whnf-evaluates the body.

The consequence is important.
The timeout fires even when no def-unfold appears in the simp set.
A smaller simp set therefore does not repair the site.
The site must leave `simp` completely.
The repair proves the append or map step over abstract lists in a local
`have`, then closes with a term-mode `exact` chain.

### 5.4 Root cause W: masked `sorryAx`

v4.33 error recovery injects `sorryAx` into declarations that consume a
failed proof.
The failure does not always surface as an error in the dependent file.

Two facts make this dangerous:

- `lake env lean` exits 0 on a file that contains `sorry`.
  `sorry` is a warning, not an error.
  This was confirmed with an oracle file that carried a deliberate `sorry`.
- A module's own `#print axioms` commands cover only the declarations the
  author chose to print.
  `UniqueFourLateChoiceTerminal` prints 11 of its 25 declarations.

The only reliable check walks `env.constants.map₂` and runs
`Lean.collectAxioms` on every constant the module adds.
It flags anything outside `{propext, Classical.choice, Quot.sound}`.
Masked `sorryAx` was found in five modules.
Two of them were public consumer theorems.

### 5.5 Root cause AQ: the green build is not the whole library

`lean/lakefile.toml` declared `Erdos9796` and `Erdos9796Proof` with no
`roots` and no `globs`.
Lake then compiled only the transitive imports of the two root modules.
Every other module kept its old `.olean`.

Build 53 was green on 14049 of 14049 jobs.
1264 stale v4.27 oleans were still on disk at that moment.

The source-level count made the gap exact.
1383 of 6534 modules were outside every declared target.
They divide as 692 under `P97/ATail`, 385 under `P97/ErasedCertificate`,
206 under `P97/Census554`, 17 under `P97/MultiCenter`, and the rest scattered.

The deciding test for an orphan is not the module name.
It is whether a bank source manifest names the module.
37 of the 90 frozen bank dependency modules were orphans.
Their own imports pulled in 11 more, for 48.

### 5.6 Other upstream changes

- `bv_decide` left `Mathlib.Tactic`. It also stopped unfolding reducible
  definitions.
- `Set.Finite.isCompact_convexHull` takes the scalar field explicitly.
  `Set.Finite.diff` is now a deprecated alias for `Set.Finite.sdiff`.
- `Std.Sat.CNF` is a structure over `Array`. It was a `List` alias.
  It has no `.ofList` and no `.toList`.
- v4.33.1 mathlib has no `Finset.instMembership`.
  Membership goes through `SetLike`, so `Finset.mem_filter` never matches
  in `simp`.
- v4.33.1 has no `Array` analogue of `List.decidableBAll`.
- `deriving Fintype` fails on 15 enum inductives.
  The workaround is a per-declaration transparency option.
- `ring_nf` and `dsimp` now error on no progress.
- `ring` no longer beta-reduces before it compares instances.
  `beta_reduce at *` is needed first.
- `grind` and `grobner` drop a `C 0` equation whose type stays
  `(fun _ => ℝ) 0`.
- `List.map_map` leaves a composition that no longer beta-reduces.
- Lake 5.0.0-src has no compiler concurrency cap. `--jobs` is not a Lake
  option.

## 6. Breakage class index

The full catalogue is `docs/lean-v4331-migration-breakage-catalogue.md`.
This table gives the class, the tell, and the repair.
Classes S, AB, AD, and AN are method rules, not symptoms.

| Class | Tell | Repair |
| --- | --- | --- |
| A | Type mismatch, both sides print the same | `exact h` |
| B | Stuck `match 0 with ⟨0, _⟩ => ...` | `simp only` |
| C | `omega` fails on an opaque atom | Repair A or B first |
| D | `simp` does not unfold a plain `def` projection | Name the def, or `exact` |
| E | Simp set holds a def-unfold and a rewrite on that def | `exact` |
| F | Stale `DecidablePred` after a filter rewrite | `show`, then `exact` |
| G | `dist a b` does not bridge to `‖a - b‖` | Add `dist_eq_norm` |
| H | `grobner` reports an unexpected instance | `beta_reduce at *` first |
| I | `ring_nf` or `dsimp` errors on no progress | Delete the call |
| J | Conditional `Bool` rewrite no longer fires | `Bool.and_eq_false_iff` |
| K | `2 ≤ m` against `1 < m` | Term-mode `exact` |
| L | `convert` descends into instance arguments | `HasDerivAt.congr_deriv` |
| M | Field notation fails on `Subset.trans` | Name `List.Subset.trans` |
| N | `List.getElem?_inj` is now an `Iff` | Add `.mp` |
| O, AT | Every `CNF` list idiom breaks at once | Two routes; pick by centre of gravity |
| P | Class E with a whnf timeout | `exact` |
| Q | `Finset.erase` computes only on the head | `by decide`, then `rw` |
| R | Nested selector, second stuck matcher below | Apply B outward-in |
| T | Looks like A, is B fallout | Try B first |
| U | Class J again, unusedSimpArgs note | As J |
| V | Branches of one theorem in different classes | `refine` plus bullets |
| W | Masked `sorryAx` | `collectAxioms` sweep |
| X | Private projection prints with a dagger | `exact h` |
| Y | `Equiv.swap` no longer reduces | Add `Equiv.swap_apply_def` |
| Z | Three near-identical `interval_cases` bullets | Hoist a bridge `have` |
| AA | whnf timeout on a generated list | Abstract `have` plus `exact` chain |
| AC | The four repeated tail shapes | See catalogue |
| AE | `instDecidableAnd` type mismatch | Split the `simp only` call |
| AF, AI | `Finset.mem_filter` never matches | Term-mode bridge |
| AG | `omega` loses a `Fin` bound | Hoist and reduce the bound |
| AH | 121-cell grid, looping simp theorem | Two-branch term proof |
| AJ | Two names for one cyclic index | `have hidx : ... := by decide` |
| AK | `omega` names the error, class B causes it | Hoist `choice.isLt` |
| AL | No `Decidable` for a bounded `∀` over `Array` | Move to `Array.all` |
| AM | `retainedBaseCount✝` dagger in the mismatch | Bare `exact` |
| AO | `f ∘ g` where `fun x => f (g x)` is wanted | Add `Function.comp_def` |
| AP | Goal left as a disjunct permutation | Follow with `tauto` |
| AQ | `incompatible header` on an olean | Delete the stale oleans |
| AR | `bv_decide` not found | Import `Std.Tactic.BVDecide` |
| AS | `failed to synthesize Field 𝕜` | Pass `ℝ` explicitly |
| AU | The repair script rewrites nothing | Accept both log regexes |
| AV | `simpa [nogood]` leaves the projection | `exact hpositive` |
| AW | Refreeze aborts above its own chain | Walk the nine head installers |
| AX | A bank pin is fail-open | Recorded, not repaired |

Class AV is the highest-yield single repair.
12 of the 13 failures in the whole bank-support set were that one shape.
Each repair was one line.

## 7. Fix

### 7.1 Pins

- `lean-toolchain` and `lean/lean-toolchain`: v4.27.0 to v4.33.1.
- `lean/lakefile.toml`: mathlib `rev = "v4.33.1"`.
- `formal_conjectures`: pinned to `8323e878`, not floating `main`.
- `lean/lake-manifest.json`: regenerated.
  mathlib resolves to `0df444a360eaa60ab8c11dca51a86af692955474`.

### 7.2 Proof repairs

- 28 numbered waves plus bank waves.
- 265 different `.lean` files.
- Proof bodies only.
  No statement, hypothesis, binder, or name changed, except three
  declaration headers forced by the `Std.Sat.CNF` structure change.
- No `sorry`, no `axiom`, no new `native_decide`, no `unsafe` was added.
  Plain `decide` was permitted.
- No file-level `maxHeartbeats` or `maxRecDepth` was added.

### 7.3 Build surface

- `lean/Erdos9796BankSupport.lean` imports the 37 orphan seeds that bank
  manifests name.
  It is declared as a third `lean_lib` and listed in `defaultTargets`.
  This turns a regression in those 48 modules into a build failure.
  It cost 13 repairs. 12 of them were the one-line class AV fix.
  After the change: 6535 modules, 5200 in closure, 1335 orphans.
- 1249 stale v4.27 oleans were deleted.
  The job count did not change, because all of them were orphans.
- `scripts/lake-build.sh` was replaced by the global `lake-build` wrapper.
  The comparator preflight, the provenance probes, the obligation axiom
  queries, and the bank verification all route through it.

### 7.4 Provenance

- The exact12 bank chain was refrozen.
  21 `EXPECTED_PARENT_BANK_SHA256` literals were rewritten.
  No bank claim moved. Only the source bytes the bank authenticates moved.
- The DR two-radius lean-ingress record was rebound under v4.33.1.
- `scripts/check_migration_gates.sh` was added as the Gate E check.

### 7.5 Tooling built during the work

- `scripts/lean_build_closure_orphans.py`: counts modules outside every
  declared target.
- `scripts/check_lean_toolchain.py` and `scripts/check_migration_targets.py`.
- `scratchpad/repair_simpa.py` and `scratchpad/repair_variant3.py`:
  log-driven repair of the single-line `simpa` form.
- `scratchpad/sweep-probe.lean` and `scratchpad/sweep.sh`: the class W
  axiom sweep.
- `/tmp/frontier.py`: lists on-spine modules with no olean whose imports all
  have oleans. That set is exactly what Lake tries next.
- A static clone scan that predicts the next regression sites from the
  already-repaired diffs. Result:
  `prove2me/audits/lean-4.33-regression-candidates-2026-09-09.md`.

### 7.6 Outside this repository

The `lean-usage` mathlib cache hook counted oleans and passed at 100 or more.
A toolchain bump leaves every mathlib olean on disk but invalidates all of
them, so the hook permitted a full source rebuild of mathlib.
`lean-usage` 0.1.58, commit `dc1a00a`, adds `stale_toolchain_reason()`.
It denies the build when `Mathlib.olean` is older than `lean-toolchain`.

## 8. Current state

Verified on `main` at `983966af8`.

| Item | State |
| --- | --- |
| Toolchain and dependency pins | Done |
| Proof repairs on the declared roots | Done |
| P96 adapter `unitDistNum A = doubledUnitCount A / 2` | Done, `P96/EuclideanPeeling.lean:156` |
| `P96/UpstreamBridge.lean` rewired | Done |
| Comparator `Solution.lean` supremum transport | Done, `:184-190` |
| Bank chain refreeze | Done, `CHAIN VERIFY COMPLETE` |
| Lean-ingress rebinding | Done |
| Gate E script | Done, prints `GATE-E OK` |
| Spine | `open: 0/1`, kernel-complete under `{propext, Quot.sound, Classical.choice}` |
| Gate D result | Not recorded |
| Generator scripts | Not migrated |
| Fail-open bank pin | Recorded, not repaired |

### 8.1 Open risk 1: the generators still emit the old CNF API

This is audit finding F1, and it is unremediated.

22 Python files under `scripts/` reference `Std.Sat.CNF` in the old list
shape. 21 of them are `generate_exact17_*.py` generators.
No script mentions `ListCNF`.

The risk is masked, not absent.
240 `Erdos9796Proof` modules mention `Std.Sat.CNF`.
227 of them are build-closure orphans and have no olean.
Only 13 are in closure, and those 13 were migrated to the array form.
Regenerating any of the 21 banks would emit code that cannot type-check.

The `P97/ListCNF.lean` adapter exists only in the unmerged worktree branch
`mathlib-v4331-migration-20260907` at `3f37de72d`.
That commit is not an ancestor of `main`.

### 8.2 Open risk 2: one bank pin is fail-open

`census/card_head/exact12_core_pair_all_order_common_five_membership_family_bank.py`
takes its parent pin by import, not as a literal.
The constant reads `ef03d843...`.
Both the refreeze walk and the verify walk observe the parent producing
`ead04fcb...`.

This was measured, not inferred.
Replacing the constant with 64 zeroes still prints `CHAIN VERIFY COMPLETE`
and exits 0.
`CHAIN VERIFY COMPLETE` is therefore weaker than it reads for the
center-exchange to core-pair edge.

The migration did not cause this.
It only exposed it, by being the first event in a long time that moved a
chain-head source manifest.
Changing which pins a proof-carrying chain enforces is a separate reviewable
decision, so the state was recorded and not repaired.

### 8.3 Open risk 3: Gate D has no recorded result

`comparator/check-conformance.sh` and `scripts/check_migration_gates.sh`
both exist, and the comparator enforces the three-axiom budget.
No stored baseline-against-migrated axiom comparison exists.
`docs/audits/` holds no Gate D artefact.
`proof-status/receipts/` holds nothing newer than 2026-08-31.
The only positive statement is prose in commit message `290350b3b`.

Gate D also inspects only the closure.
1335 modules sit outside it.

### 8.4 Residual `sorry` and `native_decide`

- 32 real `sorry` sites remain under `lean/Erdos9796Proof`.
  A naive grep reports 62; the rest are comments.
  None is on the spine.
  `docs/live-blueprint.md` reports `open: 0/1 node(s)` and 30 off-spine
  sorry symbols in 10 files.
- `AlignedP5SourceTrace` and `AlignedP5MirrorSourceTrace` each carry 13
  `native_decide +revert` sites.
  Both modules are in the build closure.
  Both are off the spine.
  The count did not change during the migration.

## 9. Lessons

### 9.1 Build and validation

- Route every Lean build through the global `lake-build` wrapper.
  Do not use a bare `lake build` in a lane.
- Do not fan out `lake env lean` over a stale module set.
  Each module reports `incompatible header` from its imports, not its own
  errors. 149 of the first 153 results were noise.
  Only a real build satisfies dependency order.
- Do not trust an exit code for a `sorry` check.
  `lake env lean` exits 0 on a file that contains `sorry`.
  Only the `collectAxioms` sweep is evidence.
- Do not trust a green build as full coverage.
  Check for declared library roots with no `roots` and no `globs`.
  Compare the module count against the closure count.
- A green single-file elaboration says nothing about a consumer in another
  module. The Gate D comparison stays load-bearing.

### 9.2 Repair method

- Try `simp only` before `exact`.
  Many sites that look like root cause A are root cause B downstream.
- Prefer an idiom that already compiles in the same file or a sibling file.
  Many repairs were the shape the neighbouring bullets already used.
- Diff the already-green mirror twin before you derive a repair.
  Normalise both compiler dumps first: strip the filename and the line and
  column numbers.
- Do not sweep the repository mechanically.
  A broken idiom is usually broken only in its local context.
  Repair what the compiler reports.
- An error count overstates the site count.
  Find the first real failure before you count work.
- Isolate a slow site in a probe file that imports only the defining module.
  A ledger module with `native_decide` evidence takes minutes per check.
  The probe returns in seconds.

### 9.3 Pace

- Compile ahead of the build.
  A frontier script lists modules with no olean whose imports all have
  oleans. That set is exactly what Lake tries next.
- Start the next build in parallel with the last repair agent of a round.
  Do not wait for the round to close.
- A static clone scan over the already-repaired diffs predicts the next
  wave. It costs no build time.

### 9.4 Scope and hygiene

- Update a generator in the same change as its generated files.
  This was the single largest piece of unfinished work.
- Keep proof-body edits only.
  Do not change a statement, a name, or a binder.
- Record a per-declaration `maxHeartbeats` or `maxRecDepth` explicitly.
  Do not use a file-level option.
- Declare every changed path in the lane ownership checkpoint.
  The 2026-09-08 audit found 31 changed paths outside the 324 declared ones.
- A one-line proof repair can move a bank source manifest.
  Check the bank pins after any repair, not only after a bulk change.

### 9.5 Estimation

The 2026-09-08 audit gave a heuristic estimate of 6 to 12 focused hours.
The work then took 28 repair waves over two more days, plus the bank and
gate work.
The estimate was low because the census it rested on was not current:
`sweep.py` seeded its built set from the presence of a `.olean` file with no
freshness check, so edited sources were counted as built.
Do not treat `built_total` or `blocked_descendants` from that sweep as
compiler evidence.

## 10. Files changed

Pins and build configuration:

- `lean-toolchain`, `lean/lean-toolchain`
- `lean/lakefile.toml`, `lean/lake-manifest.json`
- `lean/Erdos9796BankSupport.lean` (new)
- `README.md`

Lean sources: 265 modules under `lean/Erdos9796Proof/`.
Highest-count areas: `P97/ATail/FrontierLiveClosure`,
`P97/ATail/CardElevenUniqueFourCertificate/Support/ExactFiveCommonShellV7`,
`P97/Census554`, `P97/CGN`, `Geometry/SimilarityFrame.lean`,
`P96/EuclideanPeeling.lean`, `P96/UpstreamBridge.lean`.

Comparator:

- `comparator/check-conformance.sh`, `comparator/test-check-conformance.sh`
- `comparator/Solution.lean`, `comparator/toolchain-pins.json`
- `comparator/README.md`

Scripts:

- `scripts/check_migration_gates.sh` (new)
- `scripts/check_lean_toolchain.py` (new)
- `scripts/check_migration_targets.py` (new)
- `scripts/lean_build_closure_orphans.py` (new)
- `scripts/lake-build.sh` (deleted)

Documentation and audits:

- `docs/lean-v4331-migration-breakage-catalogue.md` (786 lines, classes A to AX)
- `docs/plans/2026-09-05-lean-mathlib-v4331-upgrade-audit.md`
- `docs/audits/2026-09-07-local-v4331-migration-review.{md,json}`
- `docs/audits/2026-09-07-mathlib-v4331-comparator-toolchain.md`
- `docs/audits/2026-09-08-mathlib-upgrade-progress-audit.{md,json}`
- `docs/audits/2026-09-09-lean-build-closure-orphans.json`
- `docs/audits/2026-09-09-dr-two-radius-lean-ingress-binding.json`
- `prove2me/audits/lean-4.33-regression-candidates-2026-09-09.md`

Provenance:

- `scratch/rigid221-sourceheavy-anchor/refreeze_narrowed_chain.py`
- 21 `census/card_head/*.py` parent-pin literals

## 11. Evidence index

- Pin bump: `2b05fcec2`. Merge: `eff3360b3`. Last migration commit: `da400a7a1`.
- Repair waves: `521c00127`, `275c90653`, then `1bb30f93d` through
  `e1b4b7380`, then `d5039f33f` through `2df7d91d0`.
- Bank work: `290350b3b`, `a3f51e55b`, `20f554759`, `552969a48`, `da400a7a1`.
- Toolchain source citations used to justify a root cause:
  `Lean/Elab/Tactic/Simpa.lean` (cause A, no line number given);
  `Lean/Meta/Tactic/Simp/Rewrite.lean:435-465` and `Types.lean:822` (AA);
  `Lean/Elab/Tactic/Omega/OmegaM.lean:179` (AG, AK);
  `Init/Data/List/Basic.lean:886` and `Init/Data/Array/Lemmas.lean:689` (AL);
  `Mathlib/Data/Finset/Defs.lean:101` (AI).
- Classes B, D, E, F, H, I, and AT have no file-and-line citation.
  Their justification is the observed error text and the recorded repair.
