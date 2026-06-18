# Erdős Problems 97 & 96 - Lean 4 formalization

A Lean 4 formalization of the resolutions of two Erdős problems on convex
point sets in the plane, checked against the canonical problem statements
in [`formal-conjectures`](https://github.com/google-deepmind/formal-conjectures).

The proof is **complete except for a single named lemma**
(`Problem97.RemovableVertexOfLarge`), which is left as a `sorry`. Everything
else - including the full `n = 9` base case and the descent that consumes that
lemma - is formalized and machine-checked. See **Proof status** below for the
exact, kernel-reported state.

## What is formalized

Two upstream-vocabulary theorems are exported. Each is *definitionally* the
right-hand side of the corresponding `formal-conjectures` statement, so
building this repository checks the proofs against the upstream definitions
(`Erdos97.*` / `Erdos96.*`), not a private restatement.

### Problem 97 - [`Problem97.erdos97_rhs`](lean/Erdos9796Proof/P97/UpstreamBridge.lean#L30)

> A convex-independent set of points in the plane cannot have the property
> that every point has 4 others equidistant from it.

```lean
theorem erdos97_rhs :
    ∀ A : Finset ℝ², A.Nonempty → EuclideanGeometry.ConvexIndep (A : Set ℝ²) →
      ¬ Erdos97.HasNEquidistantProperty 4 A
```

This is the RHS of upstream
[`Erdos97.erdos_97`](https://github.com/google-deepmind/formal-conjectures/blob/89a67be506fbae633d02941ccbd9f3737bbd5457/FormalConjectures/ErdosProblems/97.lean#L76)
(materialized under `lean/.lake/` from the rev pinned in `lake-manifest.json`).
The bridge [`Problem97.upstream_iff`](lean/Erdos9796Proof/P97/UpstreamBridge.lean#L22)
is `Iff.rfl`.

### Problem 96 - [`Problem96.erdos96_rhs`](lean/Erdos9796Proof/P96/UpstreamBridge.lean#L55)

> The maximum number of unit distances determined by `n` points in convex
> position is `O(n)` - here with explicit constant `3`.

```lean
theorem erdos96_rhs :
    (fun n => (Erdos96.maxConvexUnitDistances n : ℝ)) =O[atTop]
      fun n => (n : ℝ)
```

This is the RHS of upstream
[`Erdos96.erdos_96`](https://github.com/google-deepmind/formal-conjectures/blob/89a67be506fbae633d02941ccbd9f3737bbd5457/FormalConjectures/ErdosProblems/96.lean#L69),
obtained from the per-set bound `unitDistancePairsCount A ≤ 3 * A.card` for
convex `A` ([`unit_distance_pairs_bound`](lean/Erdos9796Proof/P96/EuclideanPeeling.lean#L239)).

## Proof status

**Both theorems are complete modulo one lemma.** The single open obligation -
[`RemovableVertexOfLarge`](lean/Erdos9796Proof/P97/RemovableVertexAxiom.lean#L47) - is

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

A successful build prints exactly one warning -
`RemovableVertexAxiom.lean: declaration uses 'sorry'` - and nothing else of
substance. (Lean's mathlib-style linters emit a handful of cosmetic
style/`simp` hints; these are not errors.)

**Note on dependencies.** `lake-manifest.json` is committed and pins exact
dependency revisions, so the build is reproducible. Do **not** run
`lake update` - it would re-resolve `formal-conjectures` to the latest `main`
and break the pin.

## Repository layout

```
lean/
  Erdos9796.lean              -- root: re-exports upstream statements + the proofs
  Erdos9796Proof.lean         -- root: the two upstream-vocabulary bridge theorems
  Erdos9796Proof/
    P97/                      -- Problem 97 proof library (~90 files)
      UpstreamBridge.lean       -- erdos97_rhs (the published theorem)
      UniversalProblem97.lean   -- the strong-induction wrapper
      Counting.lean             -- counting engine (forces |A| ≥ 9)
      Descent.lean              -- descent engine (kills |A| > 9)
      RemovableVertexAxiom.lean -- the single open lemma (sorry)
      Foundation.lean           -- shared vocabulary + signed-area primitives
      Dumitrescu/               -- isosceles-counting lemma chain (L1 … Lc3)
      CGN/                      -- cap-witness counting bridge (CGN … CGN8)
      N4d/                      -- n=9 form-exclusion case analysis (20 files)
      N9Endpoint/  N8/          -- n=9 base-case assembly
      Cap/  MEC/  Moser/        -- cap structures, min-enclosing circle, Moser triangle
      U2/                       -- similarity-normalization lane
      ConvexCyclicOrder/        -- convex cyclic-order construction
      ...                       -- other shared geometry kernels in the root
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

## Proof architecture - where to look

This section is a map for someone who has never seen the proof. Every name
below links to the exact declaration. (Links resolve on GitHub against the
current `main`; line numbers track this commit.)

The Problem 97 proof is a single **strong induction on the cardinality `|A|`**
of a hypothetical convex-independent counterexample, driven by two engines and
bottoming out in a finite base case:

- a **counting engine** that forces any counterexample to have `|A| ≥ 9`;
- a **descent engine** that, for `|A| > 9`, produces a strictly smaller
  counterexample - contradicting minimality;
- a **base case** that rules out `|A| = 9` directly by a large geometric
  case analysis.

So `|A| < 9` is impossible (counting), `|A| > 9` is impossible (descent), and
`|A| = 9` is impossible (base case) - no counterexample exists.

### Start here: the spine

Read these in order; each line is the load-bearing declaration of its step.

1. [`erdos97_rhs`](lean/Erdos9796Proof/P97/UpstreamBridge.lean#L30) - the
   published theorem, definitionally the upstream RHS (the rest of the file is
   the `Iff.rfl` bridge).
2. [`UniversalProblem97`](lean/Erdos9796Proof/P97/UniversalLocal.lean#L36) -
   instantiates the induction wrapper with the two engines (below) discharged.
3. [`UniversalProblem97_of_reduction`](lean/Erdos9796Proof/P97/UniversalProblem97.lean#L60)
   - the strong-induction wrapper itself. It takes the two engines bundled in
   [`UniversalReductionHypotheses`](lean/Erdos9796Proof/P97/UniversalProblem97.lean#L37)
   (the `counting` bound and the `descent` step) and calls the base case
   directly for `|A| = 9`.
4. **Base case** `|A| = 9`:
   [`FiniteN9Closure`](lean/Erdos9796Proof/P97/N9Endpoint/Closure.lean#L71).
5. **Counting engine** (`|A| ≥ 9`):
   [`counterexample_card_ge_nine`](lean/Erdos9796Proof/P97/Counting.lean#L95).
6. **Descent engine** (`|A| > 9`):
   [`descent_contradicts_minimality`](lean/Erdos9796Proof/P97/Descent.lean#L27),
   which consumes the one open lemma
   [`RemovableVertexOfLarge`](lean/Erdos9796Proof/P97/RemovableVertexAxiom.lean#L47)
   plus the glue
   [`smaller_counterexample_of_removable`](lean/Erdos9796Proof/P97/SmallerCounterexample.lean#L30).

### Shared foundations

The vocabulary and core geometric objects every cluster builds on:

- [`Foundation.lean`](lean/Erdos9796Proof/P97/Foundation.lean) - re-exports the
  upstream predicates and defines the signed-area primitives:
  [`ConvexIndep`](lean/Erdos9796Proof/P97/Foundation.lean#L28),
  [`signedArea2`](lean/Erdos9796Proof/P97/Foundation.lean#L49),
  [`OnArcOpposite`](lean/Erdos9796Proof/P97/Foundation.lean#L57).
- [`MinEnclosingCircle`](lean/Erdos9796Proof/P97/MEC/Basic.lean#L66) (existence +
  uniqueness) and the [`MoserTriangle`](lean/Erdos9796Proof/P97/Moser/Triangle.lean#L59)
  it determines - the three boundary vertices the whole analysis is framed
  around.
- [`CapTriple`](lean/Erdos9796Proof/P97/Cap/Structure.lean#L161) - the
  decomposition of the point set into the three circular "caps" cut off by the
  Moser triangle.
- [`IsRemovableVertex`](lean/Erdos9796Proof/P97/SmallerCounterexample.lean#L25)
  - the predicate the descent step is built to produce.

### The counting engine (forces `|A| ≥ 9`)

A Dumitrescu-style double count of isosceles configurations: a lower bound
`6·|A| ≤ iCount(A)` against a cap-local upper bound forces `|A| ≥ 9`.

- [`iCount`](lean/Erdos9796Proof/P97/IsoscelesCount.lean#L39) - the isosceles
  count, defined in `IsoscelesCount.lean`.
- the [`Dumitrescu/`](lean/Erdos9796Proof/P97/Dumitrescu) dir (`L1.lean …
  Lc3.lean`) - the lemma chain establishing the lower bound
  (perpendicular-bisector, double-count, three-cap, Cauchy–Schwarz,
  Thales-angle, …).
- [`CGN8_circumscribed_iCount_upper_bound`](lean/Erdos9796Proof/P97/CGN/CGN8.lean#L31)
  - the matching cap-local upper bound (top of the
  [`CGN/`](lean/Erdos9796Proof/P97/CGN) counting-bridge stack).
- [`Counting.lean`](lean/Erdos9796Proof/P97/Counting.lean) combines the two with
  the arithmetic in `CountingArithmetic.lean`.

### The `n = 9` base case (the bulk of the files)

Most of the ~90 files implement the finite case analysis behind
`FiniteN9Closure`. It threads a fixed 9-point shell through form exclusions and
a final single-apex exhaustion:

- [`FiniteEndpointShell`](lean/Erdos9796Proof/P97/N9Endpoint/Shell.lean#L39) - the
  structure packaging the fixed 9-point setup (`N9Endpoint/Shell.lean`); the
  closure is assembled in `N9Endpoint/Closure.lean`, with `N9Endpoint/N4e.lean`
  (cap containment) and `N9Endpoint/N67.lean` (rigid common-radius packet).
- **`N4d/` form exclusions** - three geometric "forms" excluded at each of three
  apex relabellings:
  [`N4dExcludesFormA_v1_proof`](lean/Erdos9796Proof/P97/N4d/ExcludesFormAv1.lean#L645),
  [`…FormB…`](lean/Erdos9796Proof/P97/N4d/ExcludesFormBv1.lean#L742),
  [`…FormC…`](lean/Erdos9796Proof/P97/N4d/ExcludesFormCv1.lean#L766), with the
  `v₂`/`v₃` variants produced by `N4d/CyclicTransport.lean` and the many other
  [`N4d/`](lean/Erdos9796Proof/P97/N4d) files supplying form-specific geometry.
- **`N8` single-apex exhaustion** - the final contradiction, routed by
  [`N8k_single_apex_false`](lean/Erdos9796Proof/P97/N8/N8kDistribution.lean#L949)
  through the two-circle / endpoint-pair / reflection primitives in the
  [`N8/`](lean/Erdos9796Proof/P97/N8) subdirectory.

### The descent step and the single open lemma

- [`RemovableVertexAxiom.lean`](lean/Erdos9796Proof/P97/RemovableVertexAxiom.lean)
  - the lone `sorry`: every minimal counterexample with `|A| > 9` has a
  removable vertex.
- [`SmallerCounterexample.lean`](lean/Erdos9796Proof/P97/SmallerCounterexample.lean)
  - turns a removable vertex into a strictly smaller counterexample.
- [`Descent.lean`](lean/Erdos9796Proof/P97/Descent.lean) - packages the two into
  the contradiction-with-minimality shape the induction wrapper consumes.

### Status of the open lemma: proof strategy and obstruction

`RemovableVertexOfLarge` is the **only** open obligation on the whole spine. The
other three descent inputs are closed and audited: the base case
`FiniteN9Closure` (kernel-clean: `#print axioms` reports only
`propext, Classical.choice, Quot.sound`), the cap-sum bridge
(`|A| > 9 ⇒ some opposite cap is surplus`), and the counting bound
`counterexample_card_ge_nine` (`|A| ≥ 9`). So all remaining mathematical risk is
concentrated in this one lemma. It is genuinely open - a proof program in
progress, not a proof. (Active off-repo work; this section summarizes its state.)

**Strategy (the "U-lane" deletion spine, U1–U6).** Structural induction on the
surplus-cap size. Starting from a minimal strict-convex `PerVertexK4`
counterexample with a surplus cap (`|Cᵢ| > 4`):

1. **U1 - two-short-cap reduction:** reduce to a terminal `(m, 4, 4)` packet (one
   surplus cap of size `m`, two exact-4 caps), or extract a removable vertex
   directly.
2. **U2 - equilateral-MEC / Apollonius caps:** force the two short caps onto the
   equilateral min-enclosing-circle interface (their points lie on Apollonius
   arcs).
3. **U3 - short-cap saturation:** show the short caps are deletion-saturated, so a
   failed deletion localizes to a specific dangerous packet rather than a global
   obstruction.
4. **U4 - large-cap mode dichotomy:** the surplus-apex witness radius splits into
   Mode A (`r = d`, the apex radius) and Mode B (`r ≠ d`, the genuinely large-`n`
   case).
5. **U5 - Mode A deletion:** produce a removable vertex in the surplus cap.
6. **U6 - Mode B exclusion or descent:** contradiction, reduction back to Mode A,
   or export to the escaped-witness branch.

Many sub-lemmas are proven (MEC arc-angle parametrization, the two-circle
crossing kernel, single-center cap-arc monotonicity, the U2 Apollonius-arc step,
the U5 q-critical pattern kill over 16,181,520 patterns, and the finite-audit
extinction). The program stops at one place.

**The obstruction (`Obstruction OQ-1`, "same-circle export").** At the U5 Mode-A
leaf, closing the deletion reduces to: after deleting the failed-deletion vertex
`q`, the structure-selected fourth witness `u` still lies on the center's fixed
circle - `dist(p, u) = r`, equivalently the cocircularity determinant `Δ = 0` -
**without re-using `q`**. This metric equality is the conserved core of the lemma:
it is selection-independent (the same `Δ = 0` reappears across replacement
routes). Several routes to it are **proven dead**, for a structural reason rather
than for lack of effort:

- a finite conjunction of cap-order / sign inequalities cannot imply the metric
  equality `Δ = 0` (the selected `u` ranges over a positive-dimensional order
  stratum on which `Δ` is not identically zero);
- no closed-cone SOS / Positivstellensatz certificate for the cap-monotonicity
  inequality exists at any degree (degenerate strata in the closure violate it);
- Ptolemy-equality and the saturation-as-equality-source arguments are both
  circular (each is equivalent to the conclusion `Δ = 0`);
- multi-deletion collapses to a global blocker-hypergraph problem.

The root cause is that the realization variety is `∃ℝ`-complete (Mnëv
universality), which blocks general topological / incidence arguments from
forcing `Δ = 0`.

**Current frontier.** The live target is a narrowed row-specialized confinement
statement (the `c5d3b` consumer payload). Finite SMT / `msolve` screens of the
residual leaves are all UNSAT to date (a 525-open-leaf baseline; the exact
346-family tail discharged by Gröbner certificates), but the *producer* theorem
itself is still open. A recent statement refactor - stating the payload directly
as an exact-two-overlap "vesica" exclusion, retiring the same/opposite-side split
- awaits an opposite-side realizability falsification check before further proof
effort is spent.

**Independent route.** A rigidity / metric-variety programme attacks the
underlying extremal statement directly (no U-lane structure). It has proven kills
for small `n` (`n ≤ 12`, and the `n = 14` floor cell) but the uniform theorem for
large `n` remains conjectured. Its unit-distance results do not by themselves
discharge this lemma - the unit-distance → same-distance bridge has no valid
form, so `RemovableVertexOfLarge` must be attacked in its native variable-radius
form.

### Problem 96

Self-contained in the [`P96/`](lean/Erdos9796Proof/P96) directory and much
smaller: a vertex-peeling argument gives the per-set bound
[`unit_distance_pairs_bound`](lean/Erdos9796Proof/P96/EuclideanPeeling.lean#L239)
(`≤ 3·|A|`), which [`UpstreamBridge.lean`](lean/Erdos9796Proof/P96/UpstreamBridge.lean#L55)
lifts to the asymptotic `O(n)` statement.

### Supporting clusters

These provide reusable geometric machinery imported throughout the above:

- **[`Cap/`](lean/Erdos9796Proof/P97/Cap)** - cap partition, structure, and
  cone/arc containment (plus `ArcPartitionCount.lean` in the root).
- **[`ConvexCyclicOrder/`](lean/Erdos9796Proof/P97/ConvexCyclicOrder) /
  `SignedAreaOangle.lean` / `OangleBridge.lean`** - cyclic-order construction and
  the bridge between the algebraic `signedArea2` and Mathlib's oriented angle
  `oangle`.
- **[`U2/`](lean/Erdos9796Proof/P97/U2)** - similarity normalization and one-hit
  witness bounds.
- **`A1*`** (incl. [`Bridge/A1SpineWiring.lean`](lean/Erdos9796Proof/P97/Bridge/A1SpineWiring.lean))
  - the row-layer context producers wiring shell facts into the endpoint forms.
- **Geometry kernels** - `TwoCircleCrossing.lean`, `NoDiameterUnderK4.lean`,
  `CircumcenterSide.lean`, `MidpointInequality.lean`,
  `CircumscribedMECPacket.lean`.
