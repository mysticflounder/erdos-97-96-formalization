# Erdős Problems 97 & 96 — Lean 4 formalization

A Lean 4 formalization of the resolutions of two Erdős problems on convex
point sets in the plane, checked against the canonical problem statements
in [`formal-conjectures`](https://github.com/google-deepmind/formal-conjectures).

The proof is **complete except for a single named lemma**
(`Problem97.RemovableVertexOfLarge`), which is left as a `sorry`. Everything
else — including the full `n = 9` base case and the descent that consumes that
lemma — is formalized and machine-checked. See **Proof status** below for the
exact, kernel-reported state.

## What is formalized

Two upstream-vocabulary theorems are exported. Each is *definitionally* the
right-hand side of the corresponding `formal-conjectures` statement, so
building this repository checks the proofs against the upstream definitions
(`Erdos97.*` / `Erdos96.*`), not a private restatement.

### Problem 97 — `Problem97.erdos97_rhs`

> A convex-independent set of points in the plane cannot have the property
> that every point has 4 others equidistant from it.

```lean
theorem erdos97_rhs :
    ∀ A : Finset ℝ², A.Nonempty → EuclideanGeometry.ConvexIndep (A : Set ℝ²) →
      ¬ Erdos97.HasNEquidistantProperty 4 A
```

This is the RHS of upstream `Erdos97.erdos_97`
(`lean/.lake/packages/formal_conjectures/FormalConjectures/ErdosProblems/97.lean`).
The bridge `Problem97.upstream_iff` is `Iff.rfl`.

### Problem 96 — `Problem96.erdos96_rhs`

> The maximum number of unit distances determined by `n` points in convex
> position is `O(n)` — here with explicit constant `3`.

```lean
theorem erdos96_rhs :
    (fun n => (Erdos96.maxConvexUnitDistances n : ℝ)) =O[atTop]
      fun n => (n : ℝ)
```

This is the RHS of upstream `Erdos96.erdos_96`, obtained from the per-set bound
`unitDistancePairsCount A ≤ 3 * A.card` for convex `A`.

## Proof status

**Both theorems are complete modulo one lemma.** The single open obligation is

```lean
-- lean/Erdos9796Proof/P97/RemovableVertexAxiom.lean
theorem RemovableVertexOfLarge : RemovableVertexOfLargeStatement := sorry
```

> Every nonempty convex `HasNEquidistantProperty 4` set with `9 < |A|` that is
> minimal under the strong-induction hypothesis contains a removable vertex.

This is the hard core of the descent step (the uniform removability of a
surplus-cap vertex). It is the **only** `sorry` reachable from either published
theorem.

The Lean kernel reports the axiom closure of both claims as exactly the Lean
core axioms plus `sorryAx` (which traces solely to `RemovableVertexOfLarge`):

```
'Problem97.erdos97_rhs' depends on axioms: [propext, sorryAx, Classical.choice, Quot.sound]
'Problem96.erdos96_rhs' depends on axioms: [propext, sorryAx, Classical.choice, Quot.sound]
```

No `native_decide` (`Lean.ofReduceBool`) and no custom axioms appear. Once
`RemovableVertexOfLarge` is replaced by a proof, `sorryAx` drops out and both
closures become `[propext, Classical.choice, Quot.sound]`.

You can reproduce this check after building (see below):

```bash
cd lean
echo 'import Erdos9796Proof.P97.UpstreamBridge
import Erdos9796Proof.P96.UpstreamBridge
#print axioms Problem97.erdos97_rhs
#print axioms Problem96.erdos96_rhs' > /tmp/ax_check.lean
lake env lean /tmp/ax_check.lean
```

## Building from a clean checkout

Requires [`elan`](https://leanprover-community.github.io/install/) (the Lean
toolchain manager); the pinned toolchain is `leanprover/lean4:v4.27.0` and is
fetched automatically.

```bash
git clone <this-repo>
cd <this-repo>/lean

# Fetch the prebuilt mathlib cache (also materializes the pinned dependencies
# from lake-manifest.json: mathlib v4.27.0 and formal-conjectures).
lake exe cache get

# Build both library roots (statements + proofs).
lake build
```

Or use the convenience wrapper from the repository root, which holds a build
lock so concurrent invocations serialize:

```bash
./scripts/lake-build.sh
```

A successful build prints exactly one warning —
`RemovableVertexAxiom.lean: declaration uses 'sorry'` — and nothing else of
substance. (Lean's mathlib-style linters emit a handful of cosmetic
style/`simp` hints; these are not errors.)

**Note on dependencies.** `lake-manifest.json` is committed and pins exact
dependency revisions, so the build is reproducible. Do **not** run
`lake update` — it would re-resolve `formal-conjectures` to the latest `main`
and break the pin.

## Repository layout

```
lean/
  Erdos9796.lean              -- root: re-exports upstream statements + the proofs
  Erdos9796Proof.lean         -- root: the two upstream-vocabulary bridge theorems
  Erdos9796Proof/
    P97/                      -- Problem 97 proof library (90 files)
      UpstreamBridge.lean     -- erdos97_rhs
      RemovableVertexAxiom.lean -- the single open lemma (sorry)
      ...
    P96/                      -- Problem 96 proof library (2 files)
      UpstreamBridge.lean     -- erdos96_rhs
      EuclideanPeeling.lean   -- the ≤ 3·n unit-distance bound
  lakefile.toml               -- build config + dependency requires
  lake-manifest.json          -- pinned dependency revisions
  lean-toolchain              -- leanprover/lean4:v4.27.0
scripts/
  lake-build.sh               -- locked build wrapper
```

This repository is a focused public extract: it contains exactly the
import-closure of the two published theorems (92 proof files), with all
proof-engineering scaffold, exploratory branches, and material downstream of
the open `RemovableVertexOfLarge` lemma removed.
