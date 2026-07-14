# Erdős Problems 97 & 96 - Lean 4 formalization

A Lean 4 formalization of the resolutions of two Erdős problems on convex
point sets in the plane, checked against the canonical problem statements
in [`formal-conjectures`](https://github.com/google-deepmind/formal-conjectures).

The remaining proof surface is **36 `sorry`-carrying symbols / 80 textual
holes in two Front-A clusters**, both descending from the route-B tail of the
removable-vertex core. The endpoint, pinned-surplus, and erased-pin Front-B
branches are closed; the ERASE card-{10,11} classifier closure is committed at
`652fdfcb`. **This is the main repo where the proof is being closed.** The
former companion repo
`p97-rvol` is historical as of 2026-07-06: its U-lane route-B tail was
imported here on 2026-07-05, and its status docs are superseded by this
repo. See **Proof status** below for the kernel-reported state.

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

**Both published claims still reach `sorryAx` through two Front-A proof
clusters.** The hard core of the descent step —
[`RemovableVertexOfLarge`](lean/Erdos9796Proof/P97/RemovableVertexAxiom.lean#L546)
(*every nonempty convex `HasNEquidistantProperty 4` set with `9 < |A|` that is
minimal under the strong-induction hypothesis contains a removable vertex*) —
is assembled from a three-way split (surplus-cap packet extraction, the
`IsM44` pinned-surplus branch, the non-`IsM44` descent branch). The
current source obligations are all in `U1LargeCapRouteBTail.lean`:

| Cluster | Source surface | Symbols | Textual holes |
|---|---|---:|---:|
| Shared-radius pair | `U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair` | 1 | 1 |
| liveData families | 35 named `liveData_*` helpers consumed by the now-sorry-free `u1_largeCap_routeB_tail_liveData_false` | 35 | 79 |
| **Total** | | **36** | **80** |

`proof-blueprint symbols --with-sorry` reports exactly those 36 symbols. The
former Front-B obligations `isM44EndpointResidualsExcluded`,
`isM44PinnedSurplusResidualsExcluded`, and
`isM44NonSurplusContainmentErasedPinTripleResidualsExcluded` are source-clean
and kernel-connected. The downstream exact-pin ERASE target is 0/1376 open
and passes target-specific `proof-blueprint verify-publish` under the approved
axiom set.

The Lean kernel reports the axiom closure of both published claims as the
Lean core axioms plus:

- `sorryAx` — traces exactly to the 36 Front-A symbols above;
- `Lean.ofReduceBool` and `Lean.trustCompiler` — from `native_decide` in the
  generated finite-bank certificate shards (`SurplusCOMPGBank*`,
  `EndpointCertificate/*`), allowed under the project's `native_decide`
  policy (kernel-checked closure + the evaluated checkers are plain verified
  Lean with no `unsafe` / `@[implemented_by]` / `@[extern]`).

Once those two clusters are proven, `sorryAx` drops out and both closures
become the core axioms plus the two compiler axioms — the declared trust
boundary of the certificate infrastructure.

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

A successful build prints `declaration uses 'sorry'` warnings for
`U1LargeCapRouteBTail.lean`, the sole current source file carrying proof holes,
and nothing else of
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
    P97/                      -- Problem 97 proof library
      UpstreamBridge.lean       -- erdos97_rhs (the published theorem)
      UniversalProblem97.lean   -- the strong-induction wrapper
      Counting.lean             -- counting engine (forces |A| ≥ 9)
      Descent.lean              -- descent engine (kills |A| > 9)
      RemovableVertexAxiom.lean -- removable-vertex assembly + 3 residual sorries
      U1LargeCapRouteBTail.lean -- imported U-lane route-B tail (2 residual sorries)
      Foundation.lean           -- shared vocabulary + signed-area primitives
      Dumitrescu/               -- isosceles-counting lemma chain (L1 … Lc3)
      CGN/                      -- cap-witness counting bridge (CGN … CGN8)
      N4d/                      -- n=9 form-exclusion case analysis (20 files)
      N9Endpoint/  N8/          -- n=9 base-case assembly
      Cap/  MEC/  Moser/        -- cap structures, min-enclosing circle, Moser triangle
      U2/                       -- similarity-normalization lane
      SurplusM44Packet.lean     -- (m,4,4) surplus-cap packet vocabulary
      SurplusCOMPGBank*.lean    -- generated finite COMP-G bank + DFS bridge
      EndpointCertificate/      -- generated polynomial-certificate corpus
                                --   (Checker.lean + Patterns/*, native_decide)
      U1*/U3*/U5*.lean          -- imported U-lane modules (2026-07-05)
      ConvexCyclicOrder/        -- convex cyclic-order construction
      ...                       -- other shared geometry kernels in the root
    P96/                      -- Problem 96 proof library (2 files)
      UpstreamBridge.lean     -- erdos96_rhs
      EuclideanPeeling.lean   -- the ≤ 3·n unit-distance bound
  lakefile.toml               -- build config + dependency requires
  lake-manifest.json          -- pinned dependency revisions
  lean-toolchain              -- leanprover/lean4:v4.27.0
certificates/                 -- JSON certificate banks (endpoint/, surplus/)
scripts/
  lake-build.sh               -- locked build wrapper
  endpoint-certificate.py     -- polynomial-certificate generator/emitter
  escape-census.py            -- escape-census enumeration
  surplus-compg-shadow.py     -- COMP-G shadow/bank generator
docs/                         -- working plans, dead-ends log, audits
```

The default `lake build` compiles the import closure of the two published
theorems (~160 modules); the generated certificate corpus under
`EndpointCertificate/Patterns/` builds only when targeted explicitly and is
the input material for wiring the endpoint residual obligation.

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
   which consumes
   [`RemovableVertexOfLarge`](lean/Erdos9796Proof/P97/RemovableVertexAxiom.lean#L546)
   (assembled; carries the five residual obligations) plus the glue
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

Most of the hand-written P97 files implement the finite case analysis behind
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

### The descent step and the removable-vertex lemma

- [`RemovableVertexAxiom.lean`](lean/Erdos9796Proof/P97/RemovableVertexAxiom.lean)
  - assembles `RemovableVertexOfLarge` (every minimal counterexample with
  `|A| > 9` has a removable vertex) from the three-way split. Its three former
  slot-2 residual branches are now closed.
- [`SmallerCounterexample.lean`](lean/Erdos9796Proof/P97/SmallerCounterexample.lean)
  - turns a removable vertex into a strictly smaller counterexample.
- [`Descent.lean`](lean/Erdos9796Proof/P97/Descent.lean) - packages the two into
  the contradiction-with-minimality shape the induction wrapper consumes.

### Status of the removable-vertex lemma: current residuals

The two Front-A clusters in the **Proof status** table are the open frontier;
everything else on the descent path is closed and kernel-audited: the base
case `FiniteN9Closure` (axiom closure: `propext, Classical.choice,
Quot.sound`), the cap-sum bridge (`|A| > 9 ⇒ some opposite cap is surplus`),
the counting bound `counterexample_card_ge_nine` (`|A| ≥ 9`), the surplus-cap
packet extraction (`largeK4SurplusCapPacket`), the pinned-surplus finite-bank
handoff (`pinnedSurplusCOMPGBankBridge`), and the non-`IsM44` descent adapter
(`removableVertexOfLarge_of_nonIsM44`).

**Active work happens in this repo.**
[`docs/closure-plan-full-spec-2026-07-09.md`](docs/closure-plan-full-spec-2026-07-09.md)
is the single current closure plan (cross-cutting strategy, gates, dispatch
specs, uncertainty register), and
[`docs/closure-matrix-2026-07-09.md`](docs/closure-matrix-2026-07-09.md) is its
executable task register.
[`docs/97-rvol-full-prose-proof-2026-07-13.md`](docs/97-rvol-full-prose-proof-2026-07-13.md)
is the dated full prose proof of the Problem 97 target — the end-to-end
mathematical narrative with per-component rigor labels, kernel axiom
closures, and a completion matrix covering the open frontier.
The former July 6 master plan is a historical record
under [`archive/2026-07-10-closure-plan-consolidation/`](archive/2026-07-10-closure-plan-consolidation/).
[`docs/sorry-closure-ledger-2026-07-06.md`](docs/sorry-closure-ledger-2026-07-06.md)
is the dated sorry-level companion — every then-known `sorry` in the tree with
a route and acceptance test. The lane execution logs are
[`docs/u-lane/97-slot3-certificate-closure-plan-2026-07-06.md`](docs/u-lane/97-slot3-certificate-closure-plan-2026-07-06.md)
(the two slot-3 U-lane residuals) and
[`docs/four-point-subpacket-plan.md`](docs/four-point-subpacket-plan.md)
(the now-closed slot-2 lane; historical status matrix + implemented-lemma
ledger). Analysis snapshots live under [`docs/audits/`](docs/audits).
[`docs/dead-ends.md`](docs/dead-ends.md) is the don't-repeat log for closed
proof routes.

**Historical note.** The U-lane route-B tail was developed in the companion
repo `p97-rvol` and imported here on 2026-07-05 (58 modules,
`RVOL.P97.*` → `Erdos9796Proof.P97.*`). As of 2026-07-06, `p97-rvol` and the
other companion repos are historical — frozen references, not live work
targets; their status docs are superseded by this repo.

The former off-spine `U2OppCap2Escape.lean` work is archived under `attic/`.
No current source file outside `U1LargeCapRouteBTail.lean` carries a proof
`sorry`.

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
