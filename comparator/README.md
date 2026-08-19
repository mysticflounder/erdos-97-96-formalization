# comparator/ — mathlib-only auditability gate

This directory restates every headline theorem of the repository **in mathlib
vocabulary alone** and checks that the project's proofs really discharge those
restatements. It answers *"is this claim real, and is it exactly what you say it
is?"* — a reviewer reads [`Challenge.lean`](Challenge.lean) and needs to trust
no definition from this repository.

**These are not the two publish targets.** `Problem97.erdos97_rhs` and
`Problem96.erdos96_rhs` are OPEN — they reach `sorryAx`. Everything gated here
is unconditionally proved, or is an explicitly conditional theorem whose
hypothesis is visible in its statement.

## One manifest

| Manifest | Permitted axioms | Count |
|---|---|---|
| [`config.json`](config.json) | `propext`, `Classical.choice`, `Quot.sound` | 24 |

Three axioms, no exceptions. A reviewer who declines to trust the Lean compiler
can read this gate in full and get a complete, self-consistent result.

### The retired compiler-trusted tier

Until 2026-08-18 a second manifest, `config-native.json`, gated 6 further
results — the exact-ten and exact-eleven finite endpoints, whose proofs run
their certificate banks through `native_decide` and so additionally depend on
`Lean.ofReduceBool` and `Lean.trustCompiler`.

It was removed because those six are **off-spine**. Nothing in the proof library
imports `Erdos9796Proof.P97.FiniteN10` or `.FiniteN11`; only `Solution.lean` did.
`Problem97.erdos97_rhs` cannot reach them, so the tier published six extra
claims without gating any part of the proof. What it did gate — the finite floor
— the core tier already covers to `counterexample_card_ge_ten`; the retired six
raised that to twelve, which the descent engine makes unnecessary.

The Lean modules `P97/FiniteN10.lean` and `P97/FiniteN11.lean` are untouched and
still build. Only their comparator packaging is gone. Recover it from history if
the claims are ever wanted again:

```bash
git show bd33f739 -- comparator/config-native.json comparator/axiom-audit-native.lean
```

Note that removing the tier does **not** make the publish targets three-axiom.
`erdos97_rhs` still carries both compiler axioms, from the certificate banks on
the spine — a separate trust boundary that this directory never gated.

## The artifacts

| # | Requirement | Here |
|---|-------------|------|
| 1 | `Challenge.lean` — **mathlib-only**, headline claims as `sorry` stubs | [`Challenge.lean`](Challenge.lean) (module `Challenge`, `import Mathlib`) |
| 2 | `Solution.lean` — imports the project, discharges the stubs | [`Solution.lean`](Solution.lean) (module `Solution`, `import Erdos9796Proof`) |
| 3 | Config + axiom audit | [`config.json`](config.json) + [`axiom-audit.lean`](axiom-audit.lean) |
| 4 | Offline pre-flight | [`check-conformance.sh`](check-conformance.sh) |

Both modules declare all 24 results in a shared `Headline` namespace, so the
manifests list `Headline.counterexample_card_ge_ten`, … The comparator looks
each name up in *both* exports, so they must agree on the fully-qualified name;
the namespace also keeps Solution's restatements from colliding with the
project's own theorem names.

The two modules are wired into the build as extra `lean_lib` targets in
[`../lean/lakefile.toml`](../lean/lakefile.toml) with `srcDir = "../comparator"`,
so `lake build Challenge Solution` works from `lean/`.

## Run it

Offline pre-flight — manifest cross-check, build, axiom audit:

```bash
./comparator/check-conformance.sh
```

It exits 0 iff the config and its audit file list the same names, every listed
theorem's `#print axioms` closure is a subset of `permitted_axioms`, and both
modules build. The permitted set is read from the config file, so the manifest
is the single source of truth and the script needs no edit when the budget
changes.

The membership check subsumes the old grep-based `sorryAx` and `native_decide`
guards: `sorryAx` is not permitted, and a listed theorem that starts using
`native_decide` reports `Lean.ofReduceBool`, which `config.json` does not
permit. Since the compiler-trusted tier was retired there is no second manifest
to move such a theorem into — the check now rejects it outright.

The authoritative check is the real
[leanprover/comparator](https://github.com/leanprover/comparator) run: it
re-exports both modules through `lean4export`, checks statement identity and
axiom compliance, then re-runs both the `nanoda` kernel and the Lean default
kernel. It takes one config, and there is now exactly one — a full audit is a
single run against `config.json`.

**Status: passing** (verified 2026-07-26, Lean v4.27.0, macOS). Final
output:

```
Checked 41239 declarations with no errors
Running nanoda kernel on solution
Nanoda kernel accepts the solution
Running Lean default kernel on solution.
Lean default kernel accepts the solution
Your solution is okay!
```

Exit code 0, against this directory's `config.json` unmodified — that is, with
`enable_nanoda: true`, so both independent kernels replayed the export.

Scripted gate — ran 2026-08-18, **passes**:

```
Build completed successfully (12008 jobs).
== axiom audit [core] ==
OK [core]: 24 theorems, axioms ⊆ {Classical.choice, propext, Quot.sound}

OK: all comparator theorems build and respect the axiom budget.
```

Exit code 0. Run against the single manifest, after the compiler-trusted tier
was retired the same day. The two-manifest run recorded earlier that day also
passed, at `OK [native]: 6 theorems` over five axioms.

The gate was queued from 2026-08-02 and took until 2026-08-18 to record, for two
reasons beyond the original import cycle. First, `Solution.olean` went stale on
2026-08-01 and nothing rebuilt it. Second, the `FrontierLiveClosure` package
carried three separate breakages that each hid the next: an uncommitted `aesop`
where a `sorry` belonged in `TwoSourceCanonicalSurface.lean`, a non-compiling
`TwoSourceFreshThirdResidual.lean` committed to `main`, and an uncommitted
invalid proof body in `TwoSourceFirstFiberCollision.lean`. All three were
reverted; `f69f2cb0` carries the one that had reached `main`. Note that
`lake build <single module>` stops at the first failing module in its import
chain, so clearing one error does not tell you the package builds — only
`lake build Erdos9796Proof` does.

The original import cycle was **fixed in commit `b075da44`**. For the record,
that blocker was: a concurrent lane added
`import Erdos9796Proof.P97.PinnedMultiplicity` to `P97/WitnessPacketInterface.lean`
to support a new `selectedClass_card_le_pinnedMultiplicity`, closing the loop

    WitnessPacketInterface → PinnedMultiplicity → UniversalProblem97
      → N9Endpoint.Closure → N8.N8kDistribution → N8.N8aArcTwoCircle
      → U2.OneHitRealization → U2.OneHitMonotone → U2.OneHitBound
      → WitnessPacketInterface

because `U2/OneHitBound.lean:1` already imports `WitnessPacketInterface`. Lake
reported it as `build cycle detected` at `U2.OneHitBound`, and every module
above it failed with cascading `bad import`, including `Solution`. Nothing in it
was attributable to the exact-eleven work.

The fix moved `selectedClass_card_le_pinnedMultiplicity` verbatim into
`P97/PinnedMultiplicity.lean` and dropped the added import. It needs no new
imports, because `PinnedMultiplicity` already reaches `WitnessPacketInterface`
transitively — which is precisely what closed the loop — so `SelectedClass` is
in scope there for free.

The standing rule this exposed: **`U2.OneHitBound` sits underneath
`WitnessPacketInterface` in the import graph**, so any import from
`WitnessPacketInterface` into the `PinnedMultiplicity` / `UniversalProblem97` /
`N8` / `U2` region is a cycle by construction. State such lemmas in the upper
module, or factor the shared content into a new leaf.

If you re-derive this, trust `lake`'s cycle listing — it names every edge on the
loop. A hand-rolled DFS over `^import` lines got this wrong once.

### Running the real comparator at Lean v4.27.0

This repository is pinned to `leanprover/lean4:v4.27.0` (see `lean-toolchain`),
and the comparator must be built at the matching tag so its export path is
compiled against the same Lean. Four things differ from the comparator's current
documented flow. Three are simply features added after v4.27.0:

* **`lake build lean4export` does not work at comparator tag `v4.27.0`.** The
  `[[require]] name = "lean4export"` entry was added at `v4.28.0`. Build
  [`leanprover/lean4export`](https://github.com/leanprover/lean4export) from its
  own repository instead — see the version pin below, which is not obvious.
* **The `COMPARATOR_LANDRUN` / `COMPARATOR_LEAN4EXPORT` / `COMPARATOR_NANODA`
  environment overrides do not exist at `v4.27.0`** (added at `v4.30.0`). At
  this tag the binary names are hardcoded `PATH` lookups, so setting those
  variables silently does nothing — the documented upstream invocation appears
  to run but ignores them. Put the binaries on `PATH` under their literal names
  `landrun`, `lean4export`, and `nanoda_bin`.
* **`scripts/fake-landrun.sh` does not exist at `v4.27.0`** (the `scripts/`
  directory arrived at `v4.30.0`). That shim is upstream's no-sandbox stand-in
  for non-Linux development hosts; Linux uses the real `landrun` sandbox.

The fourth is a genuine trap.

#### The `lean4export` version pin

**Do not use `lean4export` tag `v4.27.0`.** It does not work with comparator
`v4.27.0`, and the reason is not ordinary version skew.

Comparator `v4.27.0` reads a **bare dotted-numeric version line** and requires
it to be exactly `2.0.0` (`Comparator/Parser.lean:501-513`: split on `.`,
`String.toNat?` each part, require 3 parts, require `(2,0,0)`); the body it then
parses is the old line format (`#AX`/`#DEF`/`#THM`/`#IND`/…). It is not
JSON-aware. Today's `lean4export` `v4.27.0` tag emits an NDJSON header, so the
run dies with:

```
uncaught exception: Version invalid: '{"meta":{"exporter":{"name":"lean4export",...
```

That tag is misleading: in `lean4export`, tags `v4.15.0` through `v4.29.1` were
all **re-created on 2026-04-30** as backports of the NDJSON rewrite onto old
version numbers (`git for-each-ref refs/tags` shows every one of them with
commit date `2026-04-30`, subjects `chore: backport v4.27.0` and similar). The
`v4.27.0` tag you fetch today is therefore a 2026-04-30 artifact emitting format
`3.1.0`, not the exporter that existed when comparator `v4.27.0` was cut.

Use the last pre-JSON commit instead: **`bd93e5e`** (2026-01-07), which has
`def semver := "2.0.0"`. Its `lean-toolchain` reads `v4.27.0-rc1` — there is no
pre-JSON commit carrying a v4.27.0-final toolchain, because the toolchain bump
landed after the JSON merge — but overriding that file to `v4.27.0` compiles it
cleanly, and the rc1→final delta does not touch anything it uses. This matters:
the exporter reading this project's `.olean`s must be built with the same Lean
that produced them.

`enable_nanoda` is a required field at this tag — `Config` declares it with no
default, so omitting it is a hard error rather than a skip. The nanoda leg needs
a binary literally named `nanoda_bin` on `PATH`; build
[`ammkrn/nanoda_lib`](https://github.com/ammkrn/nanoda_lib) branch `debug` with
`cargo build --release`. Set `enable_nanoda: false` to skip it — statement
identity and axiom compliance are both checked *before* the nanoda leg, so
skipping it loses only the second-kernel replay.

```bash
git clone --branch v4.27.0 https://github.com/leanprover/comparator /tmp/cmp
( cd /tmp/cmp && lake build )

git clone https://github.com/leanprover/lean4export /tmp/l4e
( cd /tmp/l4e && git checkout bd93e5e \
    && echo leanprover/lean4:v4.27.0 > lean-toolchain && lake build )

git clone --branch debug https://github.com/ammkrn/nanoda_lib /tmp/nanoda
( cd /tmp/nanoda && cargo build --release )

mkdir -p /tmp/shimbin
ln -sf /tmp/l4e/.lake/build/bin/lean4export      /tmp/shimbin/lean4export
ln -sf /tmp/nanoda/target/release/nanoda_bin     /tmp/shimbin/nanoda_bin
# on non-Linux, also drop a `landrun` shim in /tmp/shimbin (v4.30.0's
# scripts/fake-landrun.sh, renamed); on Linux use the real landrun sandbox

cd lean
PATH=/tmp/shimbin:$PATH lake env /tmp/cmp/.lake/build/bin/comparator \
  ../comparator/config.json
```

### Statement identity, also verified directly

Statement identity between `Challenge` and `Solution` is checked by the
comparator run above at the export level. It was independently cross-checked
before that run succeeded: every gated theorem elaborated from each module
separately under `set_option pp.explicit true`, and the two outputs diffed. All
24 gated theorems agree with **0 differences**. The 6 results of the retired
compiler-trusted tier were checked the same way while it existed — 3 on
2026-07-30 and 3 on 2026-08-01 — and also agreed with 0 differences. That
check is weaker than the comparator's — it compares pretty-printed terms rather
than exported expressions — and is kept only because it needs no external
toolchain.

Two wrinkles if you re-run it. A theorem with no implicit arguments prints as
`Headline.foo : …` rather than `@Headline.foo : …`, so a filter keyed on the
`@` silently drops it; `finiteN10Closure` and `finiteN11Closure` are the current
instances. And `lake env lean` cannot `import Challenge`/`import Solution`
unless those oleans are already built, so the practical recipe is to append the
`set_option pp.explicit true` and `#check` lines to a *copy* of each module,
after its `end Headline`, and elaborate the copy.

## What is gated (24)

All 24 are axiom-clean: `#print axioms` ⊆ `{propext, Classical.choice,
Quot.sound}` — no `sorryAx`, no custom axioms, no `native_decide`. Project
policy permits `native_decide` under the `bv_decide` standard, but this set
deliberately excludes it, so `Lean.ofReduceBool` and `Lean.trustCompiler` are
absent and `permitted_axioms` in `config.json` is exactly the three core axioms.

### Erdős 97 — unconditional partial results

| Name (under `Headline`) | Project theorem | Claim |
|---|---|---|
| `counterexample_card_ge_nine` | `Problem97.counterexample_card_ge_nine` | every counterexample has ≥ 9 points |
| `finiteN9Closure` | `Problem97.FiniteN9Closure` | no 9-point counterexample |
| `counterexample_card_ge_ten` | `Problem97.counterexample_card_ge_ten` | every counterexample has ≥ 10 points |
| `erdos97_of_card_le_nine` | `Problem97.not_hasNEquidistantProperty_four_of_card_le_nine` | Erdős 97 holds for \|A\| ≤ 9 |
| `erdos97_iff_pinnedMultiplicity` | `Problem97.universalProblem97Statement_iff_pinnedMultiplicity` | Erdős 97 ⟺ some vertex has pinned multiplicity ≤ 3 |
| `exists_pinnedMultiplicity_le_three_of_card_le_nine` | `Problem97.exists_pinnedMultiplicity_le_three_of_card_le_nine` | the pinned form at \|A\| ≤ 9 |
| `universalProblem97_of_reduction` | `Problem97.UniversalProblem97_of_reduction` | counting + descent ⟹ Erdős 97 |
| `smaller_counterexample_of_removable` | `Problem97.smaller_counterexample_of_removable` | a removable vertex yields a smaller counterexample |

`erdos97_iff_pinnedMultiplicity` is a **reformulation, not a proof**: both sides
are open; only the equivalence is proved.

### Erdős 97 ⟹ Erdős 96, with explicit constant 3

| Name (under `Headline`) | Project theorem | Claim |
|---|---|---|
| `unit_distance_pairs_bound_of_erdos97` | `Problem96.unit_distance_pairs_bound_of_erdos97` | Erdős 97 ⟹ ≤ 3n unit-distance pairs in convex position |
| `erdos96_of_erdos97` | `Problem96.erdos96_rhs_of_erdos97` | Erdős 97 ⟹ Erdős 96 |

Both are conditional on `Problem97.UniversalProblem97Statement`, which appears
as an explicit hypothesis of the gated statement — nothing is hidden. The
implication itself is not new (Pach–Agarwal, *Combinatorial Geometry*, 1995,
p. 206, states it with the constant); what is gated here is its formal proof.

### Minimum enclosing circle, Sylvester, Moser

| Name (under `Headline`) | Project theorem | Claim |
|---|---|---|
| `exists_unique_minimum_enclosing_circle` | `Problem97.MEC.exists_unique_minimum_enclosing_circle` | existence and uniqueness of the MEC |
| `iCount_le_of_convexIndep_circumscribed` | `Problem97.CGN8_circumscribed_iCount_upper_bound` | isosceles count ≤ (11n² − 18n)/12 |
| `sylvester_dichotomy` | `Problem97.MEC.sylvester_dichotomy` | MEC is a diameter, or ≥ 3 points on it |
| `mec_center_mem_convexHull_boundary` | `Problem97.MEC.mec_center_mem_convexHull_boundary` | Welzl invariant |
| `exists_nonobtuse_circumscribed_triple` | `Problem97.MEC.exists_nonobtuse_circumscribed_triple` | Moser non-obtuse triple |
| `no_diameter_under_k4` | `Problem97.MEC.no_diameter_under_k4` | under K4 the dichotomy always circumscribes |

mathlib has no minimum enclosing circle, so this cluster is gated by
**unbundling**: `Problem97.MinEnclosingCircle` is a structure obtained by choice
(`Problem97.MEC.mec A hA`) and therefore not inlinable. Each statement instead
takes `center` and `radius` as ordinary parameters together with the three
defining properties — `radius_nn`, `enclosing`, `minimal` — all mathlib-typed.
`Solution.lean` bridges back with `Problem97.MinEnclosingCircle.unique_pair` and
`subst`. Under that unbundling `Problem97.MEC.boundary A hA` is literally
`A.filter (fun p => dist p center = radius)`.

### Dumitrescu / Fox–Pach isosceles double count

| Name (under `Headline`) | Project theorem | Claim |
|---|---|---|
| `perpBisector_apex_bound` | `Problem97.Dumitrescu.perpBisector_apex_bound` | ≤ 2 apexes on a perpendicular bisector |
| `base_apex_double_count` | `Problem97.Dumitrescu.base_apex_double_count` | the base–apex double count |
| `six_mul_card_le_iCount_of_K4` | `Problem97.six_mul_card_le_iCount_of_K4` | K4 forces `6n ≤ iCount` |

### Planar metric kernels

| Name (under `Headline`) | Project theorem |
|---|---|
| `dist_midpoint_le_half_iff_inner_nonpos` | `Problem97.dist_midpoint_le_half_iff_inner_nonpos` |
| `dist_add_dist_lt_diagonal_sum_of_openSegment_diagonals` | `Problem97.CapCrossingKalmansonBridge.dist_add_dist_lt_diagonal_sum_of_openSegment_diagonals` |
| `complementary_dist_add_dist_lt_diagonal_sum_of_openSegment_diagonals` | `Problem97.CapCrossingKalmansonBridge.complementary_dist_add_dist_lt_diagonal_sum_of_openSegment_diagonals` |
| `u5_unit_triangle_on_p_circle_incompatibility` | `Problem97.u5_unit_triangle_on_p_circle_incompatibility` |
| `equilateral_inscribed_side_eq_radius_mul_sqrt_three` | `Problem97.equilateral_inscribed_side_eq_radius_mul_sqrt_three` |

## How project definitions are inlined

Transparent `abbrev`/`def`s are replaced by their bodies, so `Challenge.lean`
mentions no project symbol:

| Project symbol | Inlined as |
|---|---|
| `ℝ²` | `EuclideanSpace ℝ (Fin 2)` (the notation is from `formal_conjectures`, not mathlib) |
| `Problem97.ConvexIndep A` | `∀ a ∈ ↑A, a ∉ convexHull ℝ (↑A \ {a})` |
| `Erdos97.HasNEquidistantProperty 4 A` | `∀ p ∈ A, ∃ r > 0, #(A.filter (dist p · = r)) ≥ 4` |
| `Problem97.pinnedMultiplicity A p` | `((A.image (dist p ·)).filter (0 < ·)).sup fun r => #(A.filter (dist p · = r))` |
| `EuclideanGeometry.unitDistancePairsCount A` | `#(A.offDiag.filter fun p => dist p.1 p.2 = 1) / 2` |
| `Problem97.iCount A` | `∑ p ∈ A, #(((A.erase p).powersetCard 2).filter fun s => ∃ r, ∀ q ∈ s, dist p q = r)` |
| `Problem97.MEC.boundary A hA` | `A.filter fun p => dist p center = radius` (after unbundling) |
| `Problem97.UniversalReductionHypotheses` | its two fields, as hypotheses |
| `Problem97.IsRemovableVertex` | its body |

## The audit boundary: what is NOT gated

* **The two publish targets.** `Problem97.erdos97_rhs` and
  `Problem96.erdos96_rhs` are open and reach `sorryAx`. They are excluded on
  purpose: the gate certifies proved results only.
* **The exact-ten and exact-eleven finite endpoints, and the general A-tail
  residuals above card eleven.** The endpoints are proved but no longer gated
  here — see "The retired compiler-trusted tier" above. The
  arbitrary-cardinality obligations they were carved out of — including
  `ATailFrontierLiveClosure.false_of_firstApexUniqueRadiusExactFiveCommonObstructionCenterResidual`
  — are still open and still reach `sorryAx` on the publish spine. No `n ≥ 13`
  statement is claimed anywhere.
* **`Problem97.exists_isCcwConvexPolygon_of_convexIndep`.** Its conclusion uses
  `EuclideanGeometry.IsCcwConvexPolygon`, which needs
  `[Module.Oriented ℝ V (Fin 2)]` and `[Fact (Module.finrank ℝ V = 2)]`
  instances supplied by `formal_conjectures`, not mathlib. Quantifying over the
  orientation to remove the instance would make the statement **false**, since
  `oangle.sign` flips under orientation reversal. There is no faithful
  mathlib-only restatement, so it is excluded rather than weakened.
* **The A-tail frontier machinery.** Working lemmas on the open descent path are
  audited by reading the repository and by `proof-blueprint spine`, not here.
