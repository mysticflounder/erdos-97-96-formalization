# Math Skeptic Audit: local Lean 4.33.1 migration

**Target**: `.worktrees/mathlib-v4331-migration-20260907`, working changes above base `15cb02b27a670a82a92f603270227d498e891ff3`.
**Date**: 2026-09-07.
**Verdict**: NEEDS WORK for the complete migration; a standalone upload pilot is justified.
**Claims audited**: 6.

## Summary

The dependency bump and nine Lean compatibility edits are coherent. Independent static review found no changed theorem assumptions, conclusions, checker behavior, or new trust assumptions. The full migration is unfinished. A running build has reached a new compiler error in `PartitionFromMEC`; the P96 count adapter and new-toolchain comparator verification remain outstanding.

The smaller publication decision is separate: `P97/FourPairCoverage.lean` imports only `Mathlib.Data.Finset.Card`, and its existing build trace explicitly invokes Lean 4.33.1. It is a suitable first standalone proof to package and submit to Prove2Me. Full P97/P96 root compilation is not a prerequisite for that independent lemma. Its submitted solution still needs target-environment checking, axiom inspection, and server acceptance; this audit made no upload.

The [evidence snapshot](2026-09-07-local-v4331-migration-review.json) retains the working diff, source hashes, census, active-log excerpts, and pilot trace. No migration sources, dependency files, or running builds were changed by this audit. No new build was launched. The active build used the repository's existing `scripts/lake-build.sh`; this audit reports its observations without relabeling them as a completed global-wrapper validation.

## Findings

### F1: Matched dependency pins — OK

- **Location**: migration `lean-toolchain:1`, `lean/lean-toolchain:1`, `lean/lakefile.toml:26` and `:31`.
- **Quote**: `leanprover/lean4:v4.33.1`.
- **Stated label**: selected migration target.
- **Evidence present**: both toolchain files and both installed dependency toolchains agree; mathlib resolves to `0df444a360eaa60ab8c11dca51a86af692955474`; formal-conjectures is pinned to `8323e878b83fcd7f4a448256069352a265460d75` and its manifest selects the same mathlib commit.
- **Actual label / verdict**: source-verified configuration, OK. This does not establish downstream compilation.

### F2: Compatibility edits preserve the inspected proof contracts — OK

- **Location**: migration `lean/Erdos9796Proof/P97/Certificate/CheckpointedRup.lean:66`, `EndpointCertificate/Soundness.lean:386`, `SurplusCOMPGBankDFS.lean:44`, and the six other changed Lean files in the snapshot.
- **Quote**: the unchanged public theorem statements are recorded in the retained diff and current sources.
- **Stated label**: compatibility edits, not new mathematical results.
- **Evidence present**: independent review found normalization changes, explicit convex-hull arguments, a `noncomputable` instance annotation, and simplifier adjustments. No theorem premises or conclusions were weakened; no new `sorry`, axiom, unsafe/external implementation, or compiler-trust marker was introduced.
- **Actual label / verdict**: static semantic review, OK with a build/trust qualification. Existing native sites remain: `ShadowSearch` 6 and `ErasedPinFixedSeedDFS` 87. Fresh transitive axiom checks were not run here.

### F3: Whole-migration compilation is not complete — completion blocker

- **Location**: migration `lean/Erdos9796Proof/P97/Cap/PartitionFromMEC.lean:572` and `:580`; migration run `artifacts/census/round-1/build.log` (captured errors at lines 2726, 2746, 2766, 2786).
- **Quote**: `Type mismatch: After simplification, term`.
- **Stated label**: active compiler-driven migration, not a successful completed build.
- **Evidence present**: round 0 exited 1 with 148 successfully built modules and 9 failed modules. Round 1 is still running; it has progressed beyond the edited files and reports four diagnostics in `PartitionFromMEC`, involving rotated finite-index partition components. No terminal exit exists for that round at review time. P96 peeling/bridge, P97 bridge, Challenge, and Solution root artifacts are absent.
- **Actual label / verdict**: partially compiled; CLARIFY scope. These are observed frontier errors, not an exhaustive count of remaining port work. Fix them and finish the selected builds before claiming complete migration.

### F4: The P96 counting representation still needs its adapter — completion blocker

- **Location**: migration `lean/Erdos9796Proof/P96/EuclideanPeeling.lean:70`, `P96/UpstreamBridge.lean:63`; installed `FormalConjectures/ErdosProblems/96.lean:37` and `FormalConjecturesForMathlib/Geometry/Metric.lean:31`.
- **Quote**: `EuclideanGeometry.unitDistancePairsCount A = doubledUnitCount A / 2 := rfl`.
- **Stated label**: inherited old-toolchain proof, with the port explicitly planned but not implemented.
- **Evidence present**: the new upstream count is `unitDistNum`, defined by unordered pairs in `s.sym2`. The old named count is absent from the new geometry utility sources. The project still uses the old count and definitional proof, including the supremum bridge.
- **Actual label / verdict**: outstanding adapter obligation; CLARIFY. Prove `unitDistNum A = doubledUnitCount A / 2`, preserve the P97 hypothesis on conditional results, and transport both per-set and supremum statements. A rename alone does not supply that proof.

### F5: Comparator selection research is not comparator verification — pending gate

- **Location**: migration `docs/audits/2026-09-07-mathlib-v4331-comparator-toolchain.md:3`, `comparator/README.md:95`, `comparator/Solution.lean:154`.
- **Quote**: `Research only. No build was run.`; the README's passing status is expressly dated to Lean 4.27.0.
- **Stated label**: research-only candidate selection and historical verification.
- **Evidence present**: no fresh 4.33.1 comparator/exporter receipt was found; Challenge/Solution artifacts are absent. The existing solution still discharges the old inlined P96 count formulation directly.
- **Actual label / verdict**: correctly qualified research, OK as research and incomplete as a verification gate. Preserve Challenge's intended statement and provide the count transport in Solution before the comparator run. This whole-project gate need not delay an independent Mathlib-only pilot.

### F6: Migration ownership record has not caught up with the edits — pre-commit gap

- **Location**: migration `.codex/worktree-checkpoints/mathlib-v4331-migration-20260907.json:14` (`owned_paths`).
- **Quote**: `owned_paths`.
- **Stated label**: registered migration lane.
- **Evidence present**: all nine modified Lean compatibility files are absent from the declared ownership list, as is the new comparator research document. The four changed toolchain/dependency files are covered.
- **Actual label / verdict**: incomplete ownership metadata; CLARIFY before committing. The migration owner must register the exact added scope and pass its staged hygiene check; this review did not modify that lane.

## Lean sorry graph and scope

No new axiom-closure or publication-root result is claimed. Unchanged native banks and existing open P97 obligations remain separate from the successful static review of compatibility edits. Historical 4.27 results cannot certify new 4.33.1 proof artifacts. Source hashes were stable during the review; the ongoing build log is captured only through the prefix recorded in the evidence JSON.

## Required before complete-migration acceptance

1. Resolve the observed compiler frontier and finish the intended project targets.
2. Implement the P96 count transport and its comparator consumers without changing the audited challenge silently.
3. Run fresh named-root axiom checks and the configured comparator/exporter checks at 4.33.1; record exact source/configuration bytes and exit statuses.
4. Reconcile migration ownership and any affected frozen-bank or ingress records before promotion.

For the first Prove2Me upload, use the standalone four-support overlap lemma and verify that exact submitted payload independently. Keep the full mission's open status accurate.
