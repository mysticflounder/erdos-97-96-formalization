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

## Two tiers

The gate is split by **axiom budget**, into two manifests over the same pair of
modules:

| Tier | Manifest | Permitted axioms | Count |
|---|---|---|---|
| **core** | [`config.json`](config.json) | `propext`, `Classical.choice`, `Quot.sound` | 24 |
| **native** | [`config-native.json`](config-native.json) | those three **+** `Lean.ofReduceBool`, `Lean.trustCompiler` | 6 |

The native tier exists because the exact-ten and exact-eleven finite endpoints
discharge their certificate banks with `native_decide`. Those proofs are
sorry-free, but they
ask you to trust the Lean compiler as well as the kernel. Project policy permits
that under the `bv_decide` standard (see the repository README), on the
condition that the cost is **explicit and reported, never silent** — which is
exactly what a separate manifest makes it.

The split is what keeps the core tier meaningful: a reviewer who declines
compiler trust reads `config.json` alone and still gets a complete,
self-consistent gate. The two tiers list disjoint theorem sets, and
`check-conformance.sh` enforces that.

## The artifacts

| # | Requirement | Here |
|---|-------------|------|
| 1 | `Challenge.lean` — **mathlib-only**, headline claims as `sorry` stubs | [`Challenge.lean`](Challenge.lean) (module `Challenge`, `import Mathlib`) |
| 2 | `Solution.lean` — imports the project, discharges the stubs | [`Solution.lean`](Solution.lean) (module `Solution`, `import Erdos9796Proof`) |
| 3 | Core-tier config + axiom audit | [`config.json`](config.json) + [`axiom-audit.lean`](axiom-audit.lean) |
| 4 | Native-tier config + axiom audit | [`config-native.json`](config-native.json) + [`axiom-audit-native.lean`](axiom-audit-native.lean) |
| 5 | Offline pre-flight (both tiers) | [`check-conformance.sh`](check-conformance.sh) |

Both modules declare all 27 results in a shared `Headline` namespace, so the
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

It exits 0 iff, **for each tier**, the config and its audit file list the same
names, and every listed theorem's `#print axioms` closure is a subset of that
tier's `permitted_axioms` — plus both modules build and the two tiers list
disjoint theorem sets. Permitted sets are read from the config files, so the
manifests are the single source of truth and the script needs no edit when a
tier's budget changes.

The membership check subsumes the old grep-based `sorryAx` and `native_decide`
guards: `sorryAx` is in no tier's permitted set, and a core-tier theorem that
starts using `native_decide` reports `Lean.ofReduceBool`, which core does not
permit.

The authoritative check is the real
[leanprover/comparator](https://github.com/leanprover/comparator) run: it
re-exports both modules through `lean4export`, checks statement identity and
axiom compliance, then re-runs both the `nanoda` kernel and the Lean default
kernel. It takes one config, so a full audit is **two runs** — one per tier
manifest, against the same `Challenge`/`Solution` pair.

**Core-tier status: passing** (verified 2026-07-26, Lean v4.27.0, macOS). Final
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

**Native-tier status: offline-verified, not yet run against the real
comparator.** The tier was added 2026-07-30 with the three exact-ten results and
extended 2026-08-01 with the three exact-eleven results. What has been checked:

* `check-conformance.sh` passes for the exact-ten three (2026-07-30) — manifest
  cross-check, build, axiom-budget audit, tier disjointness. A full run covering
  all six is pending.
* All six theorems' `#print axioms` closures measured directly as exactly
  `{propext, Classical.choice, Lean.ofReduceBool, Lean.trustCompiler,
  Quot.sound}` — no `sorryAx`, no custom axioms. The exact-eleven three were
  measured on 2026-08-01 by elaborating their `Solution.lean` statements and
  proof terms against the project.
* `Challenge.lean` elaborates against mathlib alone with the six native-tier
  stubs present (30 stubs total; 24 core + 6 native), and each tier's
  `theorem_names` matches its audit file's `#print axioms` lines.
* Statement identity by the `pp.explicit` diff described below: the exact-ten
  three agree between `Challenge` and `Solution` with **0 differences**
  (455 lines each, 2026-07-30). That diff has **not** been re-run for the
  exact-eleven three.

What has **not** been checked: the export-level identity and dual-kernel replay,
i.e. a real [leanprover/comparator](https://github.com/leanprover/comparator) run
against `config-native.json`. Record it here when it happens.

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
24 core-tier theorems agree with **0 differences**; the first 3 native-tier
theorems were checked the same way on 2026-07-30 and also agree with 0
differences. The 3 exact-eleven theorems added 2026-08-01 have not had this
diff run yet. That
check is weaker than the comparator's — it compares pretty-printed terms rather
than exported expressions — and is kept only because it needs no external
toolchain.

One wrinkle if you re-run it: a theorem with no implicit arguments prints as
`Headline.foo : …` rather than `@Headline.foo : …`, so a filter keyed on the
`@` silently drops it. `finiteN10Closure` is the current instance.

## What is in the core tier (24)

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

## What is in the native tier (6)

Sorry-free, but each descends into the exact-ten or exact-eleven certificate
bank, which is discharged by `native_decide`. Measured closure for all six is
exactly `{propext, Classical.choice, Lean.ofReduceBool, Lean.trustCompiler,
Quot.sound}`.

| Name (under `Headline`) | Project theorem | Claim |
|---|---|---|
| `finiteN10Closure` | `Problem97.FiniteN10Closure` | no 10-point counterexample |
| `counterexample_card_ge_eleven` | *(composed in `Solution.lean`)* | every counterexample has ≥ 11 points |
| `erdos97_of_card_le_ten` | *(composed in `Solution.lean`)* | Erdős 97 holds for \|A\| ≤ 10 |
| `finiteN11Closure` | `Problem97.FiniteN11Closure` | no 11-point counterexample |
| `counterexample_card_ge_twelve` | *(composed in `Solution.lean`)* | every counterexample has ≥ 12 points |
| `erdos97_of_card_le_eleven` | *(composed in `Solution.lean`)* | Erdős 97 holds for \|A\| ≤ 11 |

The four composed rows have no single project namesake, and each is the same
one-step composition: `counterexample_card_ge_eleven` is
`Problem97.counterexample_card_ge_ten` (which gives `10 ≤ |A|`) with equality
ruled out by `Problem97.FiniteN10Closure`, and `counterexample_card_ge_twelve`
is that bound with equality ruled out by `Problem97.FiniteN11Closure`. It is
the same composition `Problem97.counterexample_card_ge_ten` itself uses one
level down, where `FiniteN9Closure` kills `|A| = 9`. `erdos97_of_card_le_ten`
and `erdos97_of_card_le_eleven` are the contrapositives.

The endpoints stack rather than subsume: `FiniteN11Closure` states only the
`|A| = 11` case, and its own proof consumes `FiniteN10Closure` and the
core-axiom `not_hasNEquidistantProperty_four_of_card_le_nine` as the base of
its descent.

`Solution.lean` imports `Erdos9796Proof.P97.FiniteN10` and
`Erdos9796Proof.P97.FiniteN11` explicitly: the project
root imports only the two upstream-vocabulary bridges, and their descent route
does not pass through the fixed-card exact-ten or exact-eleven endpoints, so
neither `Problem97.FiniteN10Closure` nor `Problem97.FiniteN11Closure` is in the
root's import closure.

## The audit boundary: what is NOT gated

* **The two publish targets.** `Problem97.erdos97_rhs` and
  `Problem96.erdos96_rhs` are open and reach `sorryAx`. They are excluded on
  purpose: the gate certifies proved results only.
* **The general A-tail residuals above card eleven.** The exact-eleven endpoint
  is gated (native tier), but only as the fixed-`|A| = 11` statement. The
  arbitrary-cardinality obligations it was carved out of — including
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
