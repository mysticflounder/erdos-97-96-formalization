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

## The artifacts

| # | Requirement | Here |
|---|-------------|------|
| 1 | `Challenge.lean` — **mathlib-only**, headline claims as `sorry` stubs | [`Challenge.lean`](Challenge.lean) (module `Challenge`, `import Mathlib`) |
| 2 | `Solution.lean` — imports the project, discharges the stubs | [`Solution.lean`](Solution.lean) (module `Solution`, `import Erdos9796Proof`) |
| 3 | Comparator config + axiom audit | [`config.json`](config.json) + [`axiom-audit.lean`](axiom-audit.lean) |
| 4 | Offline pre-flight | [`check-conformance.sh`](check-conformance.sh) |

Both modules declare the 24 results in a shared `Headline` namespace, so
`config.json` lists `Headline.counterexample_card_ge_ten`, … The comparator
looks each name up in *both* exports, so they must agree on the fully-qualified
name; the namespace also keeps Solution's restatements from colliding with the
project's own theorem names.

The two modules are wired into the build as extra `lean_lib` targets in
[`../lean/lakefile.toml`](../lean/lakefile.toml) with `srcDir = "../comparator"`,
so `lake build Challenge Solution` works from `lean/`.

## Run it

Offline pre-flight — manifest cross-check, build, axiom audit:

```bash
./comparator/check-conformance.sh
```

It exits 0 iff `config.json` and `axiom-audit.lean` list the same names, both
modules build, and every listed theorem's `#print axioms` closure is a subset of
`{propext, Classical.choice, Quot.sound}`.

The authoritative check is the real
[leanprover/comparator](https://github.com/leanprover/comparator) run: it
re-exports both modules through `lean4export`, checks statement identity and
axiom compliance, then re-runs both the `nanoda` kernel and the Lean default
kernel.

### Running the real comparator at Lean v4.27.0

This repository is pinned to `leanprover/lean4:v4.27.0` (see `lean-toolchain`),
and the comparator must be built at the matching tag so its export path is
compiled against the same Lean. Three things differ from the comparator's
current documented flow, all because they were introduced *after* v4.27.0:

* **`lake build lean4export` does not work at comparator tag `v4.27.0`.** The
  `[[require]] name = "lean4export"` entry was added at `v4.28.0`. Build
  [`leanprover/lean4export`](https://github.com/leanprover/lean4export) from its
  own repository at its own `v4.27.0` tag instead.
* **The `COMPARATOR_LANDRUN` / `COMPARATOR_LEAN4EXPORT` / `COMPARATOR_NANODA`
  environment overrides do not exist at `v4.27.0`** (added at `v4.30.0`). At
  this tag the binary names are hardcoded `PATH` lookups, so setting those
  variables silently does nothing. Put the binaries on `PATH` under their
  literal names `landrun` and `lean4export`.
* **`scripts/fake-landrun.sh` does not exist at `v4.27.0`** (the `scripts/`
  directory arrived at `v4.30.0`). That shim is upstream's no-sandbox stand-in
  for non-Linux development hosts; Linux uses the real `landrun` sandbox.

`enable_nanoda` is a required field at this tag — `Config` declares it with no
default, so omitting it is a hard error rather than a skip.

```bash
TC="$(cut -d: -f2 lean-toolchain)"                      # v4.27.0
git clone --branch "$TC" https://github.com/leanprover/comparator   /tmp/cmp
git clone --branch "$TC" https://github.com/leanprover/lean4export  /tmp/l4e
( cd /tmp/cmp && lake build )
( cd /tmp/l4e && lake build )

mkdir -p /tmp/shimbin
ln -sf /tmp/l4e/.lake/build/bin/lean4export /tmp/shimbin/lean4export
# plus a `landrun` shim on non-Linux hosts

cd lean
PATH=/tmp/shimbin:$PATH lake env /tmp/cmp/.lake/build/bin/comparator \
  ../comparator/config.json
```

**Status of the real run: incomplete.** The v4.27.0 comparator builds, runs, and
successfully exports all 24 `Headline` constants from `Solution`, then aborts on
a format-version handshake with `lean4export` v4.27.0, which reports
`{"exporter":{"version":"3.1.0"},"format":{"version":"3.1.0"}}`:

```
uncaught exception: Version invalid: '{"meta":{"exporter":{"name":"lean4export",...
```

{{NEEDS_RESEARCH}} which `lean4export` revision emits the format the v4.27.0
comparator accepts, and whether that revision can be built against Lean v4.27.0
at all. Until that is resolved, the guarantees below rest on
`check-conformance.sh` plus the `pp.explicit` statement diff described next —
**not** on a completed upstream comparator run. Do not describe the gate as
having passed the comparator.

### Statement identity, verified without the comparator

Statement identity between `Challenge` and `Solution` is what the comparator
would check. Pending that, it is checked directly: every gated theorem is
elaborated from each module separately under `set_option pp.explicit true` and
the two outputs are diffed. All 24 agree with **0 differences** (verified
2026-07-26). This is weaker than the comparator's export-level comparison — it
compares pretty-printed terms rather than exported expressions — and is stated
here as exactly that.

## What is in the gate

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
* **`Problem97.exists_isCcwConvexPolygon_of_convexIndep`.** Its conclusion uses
  `EuclideanGeometry.IsCcwConvexPolygon`, which needs
  `[Module.Oriented ℝ V (Fin 2)]` and `[Fact (Module.finrank ℝ V = 2)]`
  instances supplied by `formal_conjectures`, not mathlib. Quantifying over the
  orientation to remove the instance would make the statement **false**, since
  `oangle.sign` flips under orientation reversal. There is no faithful
  mathlib-only restatement, so it is excluded rather than weakened.
* **The A-tail frontier machinery.** Working lemmas on the open descent path are
  audited by reading the repository and by `proof-blueprint spine`, not here.
