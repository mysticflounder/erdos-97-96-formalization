# Lean and mathlib upgrade audit — Erdős 97–96

Date: 2026-09-05. Status: source-audited migration assessment, NOT a successful upgraded build.

## Scope and recommendation

Audited repository: `mysticflounder/erdos-97-96-formalization`, published commit `3f006b12b8e8293ed6621e82fecb132e5a47415d`. This does not audit uncommitted local-agent changes. No repository files were changed, no branch was pushed, and no Lean compilation was performed. The analysis environment has no Lean/Lake installation; direct GitHub network access for cloning failed, while the GitHub connector supplied the source reads.

Recommendation: migrate a dedicated worktree to the matched stable Lean/mathlib **v4.33.1** pair first. The principal confirmed source migration is P96's change from an ordered-pair count divided by two to an unordered-pair count. The comparator proof adapters require corresponding changes. The remaining proof-port workload needs a compiler-driven census, not a speculative error count.

“Latest stable” and “latest development” differ: the official Lean and mathlib latest-release endpoints resolve to v4.33.1, while mathlib master currently requires Lean v4.34.0-rc2. Treat the release-candidate track as a separate target. [U1–U3]

## 1. Exact dependency snapshot

| Component | Audited project | Recommended candidate |
|---|---|---|
| Root `lean-toolchain` | `leanprover/lean4:v4.27.0` | `leanprover/lean4:v4.33.1` |
| `lean/lean-toolchain` | Same v4.27.0 pin | Same v4.33.1 pin |
| mathlib requirement | `v4.27.0` | `v4.33.1` |
| mathlib resolved commit | `a3a10db0e9d66acbebf76c5e6a135066525ac900` | Regenerate with Lake from the selected tag |
| formal_conjectures requirement | Floating `main` | Explicit commit below |
| formal_conjectures resolved commit | `89a67be506fbae633d02941ccbd9f3737bbd5457` | `8323e878b83fcd7f4a448256069352a265460d75` |

The candidate formal-conjectures commit is the main-branch snapshot read during this audit. It uses Lean v4.33.1 and explicitly requires mathlib v4.33.1. This establishes a matched dependency candidate, NOT successful downstream compatibility. [R1–R3, U4]

Both toolchain files must remain synchronized. The actual Lake root is `lean/`, not the repository root. Proposed requirement edits in `lean/lakefile.toml`:

```toml
[[require]]
name = "mathlib"
scope = "leanprover-community"
rev = "v4.33.1"

[[require]]
name = "formal_conjectures"
git = "https://github.com/google-deepmind/formal-conjectures.git"
rev = "8323e878b83fcd7f4a448256069352a265460d75"
```

After pinning both direct dependencies, use Lake in the isolated migration worktree to regenerate `lean/lake-manifest.json`. Do not manually substitute the mathlib SHA while retaining old inherited dependency revisions. Review the complete manifest diff, including Batteries, Aesop, Qq, ProofWidgets and other inherited packages. Keep mathlib's cache command `lake exe cache get`; current stable mathlib still provides it and declares `fixedToolchain := true`. [R3, U5]

## 2. Confirmed P96 interface and representation change

At the old formal-conjectures pin, `Erdos96.convexUnitDistanceCounts` uses `EuclideanGeometry.unitDistancePairsCount`. Its representation is:

```lean
(A.offDiag.filter fun p => dist p.1 p.2 = 1).card / 2
```

At the candidate pin it instead uses the generic, root-level `unitDistNum`, whose definition is:

```lean
noncomputable def unitDistNum (s : Finset X) : ℕ :=
  #{p ∈ s.sym2 | dist p.out.1 p.out.2 = 1}
```

This is a representation change, not a search-and-replace rename. The old quantity counts ordered distinct pairs and divides by two; the new quantity counts unordered pairs directly. [U6–U8]

### Preserve the existing peeling proof

`lean/Erdos9796Proof/P96/EuclideanPeeling.lean` already isolates the useful invariant:

```lean
noncomputable def doubledUnitCount (A : Finset ℝ²) : ℕ :=
  (A.offDiag.filter fun p => dist p.1 p.2 = 1).card
```

Its old bridge to `unitDistancePairsCount` is proved by `rfl`. The recurrence and induction work with `doubledUnitCount` itself, yielding a bound of `6 * A.card` under the explicit P97 hypothesis. Preserve those arguments. [R4]

The new adapter obligation is the following mathematical equality, stated schematically with the existing namespace in scope:

```lean
unitDistNum A = doubledUnitCount A / 2
```

This audit does NOT provide a compiled Lean proof of that equality. A proof route is to map ordered unit pairs to their `Sym2` class. Distance symmetry makes the map well-defined on swapping, distance one excludes diagonal pairs, and every unordered unit pair has exactly two ordered representatives. Establish the corresponding cardinality equality and divide by two. The new upstream `distanceMultiplicity A 1` retains the ordered-count/division representation and is another possible interface, but does not eliminate the need to prove equivalence to `unitDistNum`. [U8]

Then adapt:

- `P96/EuclideanPeeling.lean`: replace the obsolete public count interface and its `rfl` bridge; reuse the doubled-count recurrence and induction.
- `P96/UpstreamBridge.lean`: make `maxConvexUnitDistances_le_three_mul_of_erdos97` bound the new `unitDistNum` members of the upstream count set.
- Preserve the explicit P97 hypothesis on the conditional reduction. Do not introduce a new axiom, a `sorry`, or compiler-trusted computation to bridge these finite counts. [R4–R5]

## 3. Comparator statements require an explicit transport

`comparator/Challenge.lean` is mathlib-only and inlines the OLD count, including inside the supremum defining the P96 Big-O statement. `comparator/Solution.lean` currently discharges these formulas directly with project theorems because the old definitions unfold to the same expressions. [R6–R7]

After the upstream count change, that definitional-equality shortcut is no longer justified. Updating only P96's upstream bridge is insufficient.

Recommended approach: keep the existing Challenge statements fixed. In Solution, use the new count-equivalence lemma for the per-set bound. For the Big-O theorem, prove equality between the old inlined count set and `Erdos96.convexUnitDistanceCounts n`, derive equality of their suprema, and transport the bound/function accordingly. This avoids silently changing the proposition being independently audited.

A deliberate switch of both Challenge and Solution to the unordered formulation is another possible project decision, but should be reviewed as a statement-representation change with an equivalence proof, not mixed invisibly into a dependency bump.

## 4. P97: no identified need to redesign the statement

Comparing upstream `FormalConjectures/ErdosProblems/97.lean` at the old and candidate pins shows the utility import changing from `FormalConjectures.Util.ProblemImports` to `FormalConjecturesUtil`. The displayed equidistance predicates and main P97 formula are unchanged. Candidate `Geometry/2d.lean` retains the same Euclidean plane notation and extreme-point definition of `ConvexIndep`. [U9–U11]

Project `P97/Foundation.lean` imports the problem file and exports/abbreviates those definitions; `P97/UpstreamBridge.lean` currently uses `Iff.rfl`. This is encouraging interface evidence, not a guarantee that the entire geometric proof elaborates under new mathlib. [R8–R9]

Scan direct imports of retired utility modules and repair any actual hits. Do not replace EuclideanSpace with a product type, weaken convex independence, or modify theorem hypotheses to make an upgrade compile. Foundation's comment still names an old fork/branch; its dependency provenance documentation should be corrected when that file is intentionally touched.

## 5. Upstream changes to test, not claimed compiler failures

| Area | Upstream change and project-specific response |
|---|---|
| Transparency | Lean 4.33 changes type comparison during unification. Tactic applications may need explicit unfolding or consistent types. Diagnose locally; avoid a blanket compatibility switch or mass reducibility annotations. |
| Kernel recursion | Lean 4.33 makes kernel recursion limits depend on `maxRecDepth`. The project's existing large native-stack setting is not a substitute for this limit. Adjust narrowly only for reproduced failures. |
| Tactic/API drift | Check foundational modules before large dependents. Renamed lemmas, changed simplification and removed redundant proof steps need compiler evidence; no exhaustive rename census was possible here. |
| Executable/metaprogram behavior | Lean 4.32 changes `do` elaboration, including some nested-return behavior. Audit any matching runtime code and rebuild the diagnostic executable; successful proof elaboration alone does not test diagnostic behavior. |
| Modules and imports | New dependency source uses the module system. The reviewed stable package configuration does not establish a requirement to bulk-convert this project's files. Keep any broad module-system refactor separate from the initial port. |

The first two changes and comparator-relevant kernel soundness fixes are documented in Lean 4.33's release notes. The nested-return change is documented in Lean 4.32. These are risk areas, not observed project error messages. [U12–U13]

Keep `moreLeanArgs = ["-M16384", "-s2097152"]` unchanged for the first diagnostic port. The project documents that altering these arguments invalidates all package module traces. Profile resource changes separately after source compatibility is established. [R2]

## 6. Upgrade the validation toolchain as well

The project has two distinct checks:

1. `comparator/check-conformance.sh`: builds Challenge/Solution, cross-checks theorem-name manifests and parses `#print axioms` against the permitted set.
2. The actual comparator run: exported-statement identity, axiom compliance and independent checker replay.

The shell preflight is explicitly NOT a substitute for the real comparator. Keep the gated axiom budget exactly `{propext, Classical.choice, Quot.sound}`. Regression-test the parser with known clean and forbidden-axiom outputs, including multiline output. Do not weaken the gate or disable independent checking to declare migration success. [R10]

`comparator/README.md` documents a special old exporter commit and protocol workarounds for v4.27.0. These instructions need replacement with a newly validated toolchain-specific recipe. [R11]

There is a specific unresolved pin-selection task: comparator has a `v4.33.0` tag at `3927ad383f208ae977c340a91c48ac9b497d2097`, but the queried v4.33 tag list has no `v4.33.1`; comparator master uses Lean v4.34.0-rc2. The v4.33.0 source is a candidate starting point for a stable-compatible checker setup, not a verified v4.33.1 binary. Select and record compatible comparator/exporter commits, build the exporter with the project toolchain, and test its protocol with the selected comparator and independent checker. Do not point a default-branch exporter at old or differently built oleans. [U14–U15]

## 7. Proposed execution and acceptance gates

### Gate A — freeze and reproduce the old baseline

Create a dedicated migration branch/worktree, separate from shared proof-agent work. Register its ownership and generated evidence according to the repository's worktree policy. Preserve the exact base commit, both toolchain files, manifest, supported-target list, build results, axiom output and open-obligation report. Do not assume historical passing logs prove that this exact snapshot currently builds. [R12]

Baseline commands, from the repository root, to capture with exit codes:

```bash
lake-build Erdos9796 Erdos9796Proof
./comparator/check-conformance.sh
proof-blueprint spine
```

The build wrapper already enters `lean/` and protects its build directory with a lock. Preserve that behavior; do not launch competing builds into one `.lake` tree. [R13]

### Gate B — update the matched pins and obtain a failure census

Change both toolchains and both direct requirements in the isolated worktree. Resolve the manifest there; fetch the corresponding mathlib cache from `lean/`. Do not share old project build products across toolchains. First build small dependency/interface modules, then expand through the actual dependency graph. Record primary errors separately from cascading bad imports.

A direct diagnostic jump to v4.33.1 is reasonable. Use intermediate matched Lean/mathlib/dependency snapshots only if necessary to localize a failure; six mandatory sequential full ports are not established as necessary. [U16]

### Gate C — repair and test the known adapters

Implement the ordered/unordered count equality and adapt P96. Recheck P97's definitional bridges. Adapt comparator Solution without changing Challenge's claims. Then build both default targets and the comparator modules.

The optional supported diagnostic target is separate:

```bash
lake-build erase_m1_gate
```

Use bounded regression inputs for runtime testing. The Lake configuration identifies this executable as diagnostic-only; it does not constitute proof evidence. Off-spine banks or scratch modules need explicit inclusion if the project promises to support them; a passing default root is not an exhaustive census of every tracked Lean file. [R2]

### Gate D — restore trust and provenance

Run the real comparator with the selected matching toolchain. Compare baseline and migrated axiom dependencies and live proof obligations. The unconditional publication targets are currently open, so the requirement is no new unsupported assumptions or proof regressions, not a fictitious globally sorry-free baseline. Intentional Challenge stubs are not new proof regressions. [R11]

Refresh environment-specific build attestations and any invalidated ingress records. For certificate banks, re-mine/refreeze affected source-bound dependency sets as prescribed by project policy. These bank source sets are declaration dependencies, not the entire transitive import graph. Do not indiscriminately rewrite every bank hash or regenerate mathematical solver data merely because the compiler changed. Preserve old evidence as historical evidence. [R12]

### Gate E — make support repeatable

Add or update automated checks for toolchain-file equality, exact dependency resolution, full supported roots, comparator preflight and axiom/obligation regression. The audited repository root has no tracked `.github` directory; a GitHub Actions workflow would therefore be new at this snapshot, not an existing workflow that was verified here. The actual comparator should remain a separate explicit acceptance gate if not run on every change.

Use one pinned stable configuration as the production target. A separate nonblocking candidate job can track newer release candidates without moving the proof agents' working dependency graph. Simultaneous 4.27 and 4.33 source support is an additional requirement, not an automatic consequence of this migration.

## 8. Minimum known change surface and remaining uncertainty

Required configuration surface: root `lean-toolchain`, `lean/lean-toolchain`, `lean/lakefile.toml`, and regenerated `lean/lake-manifest.json`.

Confirmed source/interface surface under the proposed dependency upgrade: `P96/EuclideanPeeling.lean`, `P96/UpstreamBridge.lean`, and `comparator/Solution.lean`, plus a small count-equivalence module if factored separately. Refresh comparator toolchain documentation and validation evidence. Preserve `comparator/Challenge.lean` statements by default.

Not yet measured: the number of P97 proof repairs, total failing modules, build-resource changes, and a fully validated v4.33.1 comparator/exporter combination. Nothing in this source audit demonstrates a need for a mathematical redesign of P97 or a rewrite of the peeling induction. The best next experiment is an isolated stable migration build with the P96 adapter obligation explicitly tracked.

## Sources

Repository paths below are relative to `mysticflounder/erdos-97-96-formalization` at `3f006b12b8e8293ed6621e82fecb132e5a47415d`. Read through the GitHub connector; the immutable source base is:
https://github.com/mysticflounder/erdos-97-96-formalization/tree/3f006b12b8e8293ed6621e82fecb132e5a47415d

- R1: `lean-toolchain`, `lean/lean-toolchain` and the root/lean tree listings.
- R2: `lean/lakefile.toml`.
- R3: `lean/lake-manifest.json`.
- R4: `lean/Erdos9796Proof/P96/EuclideanPeeling.lean`.
- R5: `lean/Erdos9796Proof/P96/UpstreamBridge.lean`.
- R6: `comparator/Challenge.lean`.
- R7: `comparator/Solution.lean`.
- R8: `lean/Erdos9796Proof/P97/Foundation.lean`.
- R9: `lean/Erdos9796Proof/P97/UpstreamBridge.lean`.
- R10: `comparator/check-conformance.sh`.
- R11: `comparator/README.md` (historical pass reports are not current independent verification).
- R12: `CLAUDE.md` (worktree, source-manifest and ingress-record policies).
- R13: the global `lake-build` wrapper (replaced `scripts/lake-build.sh` during the migration).

Upstream sources, retrieved 2026-09-05:

- U1: https://github.com/leanprover/lean4/releases/latest (resolved to v4.33.1).
- U2: https://github.com/leanprover-community/mathlib4/releases/latest (resolved to v4.33.1).
- U3: https://github.com/leanprover-community/mathlib4/blob/master/lean-toolchain (observed v4.34.0-rc2; moving reference).
- U4: https://github.com/google-deepmind/formal-conjectures/blob/8323e878b83fcd7f4a448256069352a265460d75/lakefile.toml and that revision's `lean-toolchain`.
- U5: https://github.com/leanprover-community/mathlib4/blob/v4.33.1/lakefile.lean and `lean-toolchain`.
- U6: https://github.com/google-deepmind/formal-conjectures/blob/89a67be506fbae633d02941ccbd9f3737bbd5457/FormalConjectures/ErdosProblems/96.lean
- U7: https://github.com/google-deepmind/formal-conjectures/blob/8323e878b83fcd7f4a448256069352a265460d75/FormalConjectures/ErdosProblems/96.lean
- U8: https://github.com/google-deepmind/formal-conjectures/blob/8323e878b83fcd7f4a448256069352a265460d75/FormalConjecturesForMathlib/Geometry/Metric.lean
- U9: https://github.com/google-deepmind/formal-conjectures/blob/89a67be506fbae633d02941ccbd9f3737bbd5457/FormalConjectures/ErdosProblems/97.lean
- U10: https://github.com/google-deepmind/formal-conjectures/blob/8323e878b83fcd7f4a448256069352a265460d75/FormalConjectures/ErdosProblems/97.lean
- U11: https://github.com/google-deepmind/formal-conjectures/blob/8323e878b83fcd7f4a448256069352a265460d75/FormalConjecturesForMathlib/Geometry/2d.lean
- U12: https://lean-lang.org/doc/reference/latest/releases/v4.33.0/
- U13: https://lean-lang.org/doc/reference/latest/releases/v4.32.0/
- U14: https://api.github.com/repos/leanprover/comparator/git/matching-refs/tags/v4.33
- U15: https://github.com/leanprover/comparator/blob/master/lean-toolchain (observed v4.34.0-rc2; moving reference).
- U16: https://github.com/leanprover-community/mathlib4/wiki/Using-mathlib4-as-a-dependency
