# Convex-independent line-cover bound

Copyright (c) 2026 Adam McKenna. Released under GPL-3.0-or-later; see LICENSE.

The four declarations now live in
[`Erdos9796Proof.P97.ConvexIndepLineCover`](../lean/Erdos9796Proof/P97/ConvexIndepLineCover.lean).
This scratch directory retains only the [import/axiom probe](ConvexIndepLineCover.lean)
and this provenance and validation record. Integration on 2026-09-08 UTC follows
the user's authorization after pausing the upgrade workflow. The active checkout still uses
Lean 4.27.0; Lean/mathlib 4.33.1 compatibility is not claimed.

## Discovery credit and exact scope

**Discovery credit: GitHub user sallerk**, owner of `sallerk/erdos-notes`, for the
mirror-line counting observation in
[the inspected P97 note](https://github.com/sallerk/erdos-notes/blob/6f0ff6e3937ad5bcd341afbf8cf857cd5403913b/p97/NOTE.md).
The credit remains in both the production module docstring and the main theorem
docstring. This project contributes the Lean formalization, generalizes the
observation to collinear-set covers, and supplies the numerical specializations.

For `A : Finset ℝ²` and `L : Fin m → Set ℝ²`, convex independence of `A`,
collinearity of every `L i`, and membership of every point of `A` in some `L i`
imply `A.card ≤ 2 * m`. The sets may overlap, repeat, or be empty. No common
intersection, symmetry, equidistance, or nonempty-carrier hypothesis is used.

Four declarations in `Problem97.ConvexIndep` are available:

- `card_le_two_of_collinear_subset` bounds each piece by two points.
- `card_le_two_mul_of_collinear_cover` sums the bounds over a finite cover.
- `false_of_card_fifteen_five_collinear_cover` rules out fifteen points in five pieces.
- `false_of_card_fifteen_three_collinear_cover` rules out fifteen points in three pieces.

The immediate consumers are the two fifteen-point corollaries and the corresponding
search-family exclusions in the
[AlphaEvolve audit](../docs/audits/alphaevolve-p97-artifact-analysis-2026-08-22.md).
There is no import into the published P97/P96 aggregate and no claim to close a
general descent obligation. A use involving dihedral symmetry must still supply
the cover by its three or five mirror lines. No group-action-to-axis interface
or quantitative golden-ratio bound is formalized here.

## Reuse and independent proof audit

The bounded project corpus preflight found no matching general cover theorem.
The geometric ingredient is the existing
`Problem97.ConvexIndep.not_collinear_of_card_ge_three`, together with
`Problem97.ConvexIndep.mono`, in `ConvexIndepHelpers.lean`. The finite-cover count
uses Mathlib's `Finset.card_biUnion_le`.

**Math-skeptic audit: four claims, independently reviewed 2026-09-07.** The
collinear-subset bound applies monotonicity followed by the three-point
noncollinearity theorem. The cover theorem filters `A` by each covering set,
bounds the union by the sum of piece cardinalities, then bounds the sum by `2 * m`.
The specializations yield `15 ≤ 10` and `15 ≤ 6`, contradicted by `omega`.
Overlaps, repetitions, and empty sets are allowed; for `m = 0`, the cover
hypothesis forces `A` to be empty. The review's sole scope clarification was to
state explicitly that the D₃/D₅ applications require supplying the line cover;
that qualification is present in the production docstrings.

The scratch declarations were PROVEN (Lean-formalized) on 4.27.0 before the move,
with the axiom closure of every declaration exactly
`{propext, Classical.choice, Quot.sound}`. Integration preserves all four theorem
statements, proof bodies, and theorem docstrings byte-for-byte. Independent
integration review confirmed the two search-family applications and the explicit
cover hypotheses. The fresh production-module build and import probe both passed
on 2026-09-08 UTC, with the same four standard-only axiom closures. All four
production declarations are PROVEN (Lean-formalized) on the current toolchain.

## Validation and replay

**CERTIFIED on Lean 4.27.0**, mathlib revision
`a3a10db0e9d66acbebf76c5e6a135066525ac900`: module build `BUILD-EXIT=0`, followed by
import/axiom probe `PROBE-EXIT=0`. No `sorryAx`, custom axiom, or
`Lean.ofReduceBool` appears in any of the four closures. No new proof warnings
were reported.

Production module SHA-256:
`26b3fc4744b852f457f63dbf1792d3b1086257e977341d00a2fba689fa247695`.
Import probe SHA-256:
`e83f041894983b1893156358edbcee9668ba241ed98367b6dd1e3c6f1ccd8fe4`.

Run from `lean/`:

```bash
LAKE_BUILD_NO_REFRESH=1 lake-build Erdos9796Proof.P97.ConvexIndepLineCover
lake env lean -M 16384 ../scratch/ConvexIndepLineCover.lean
```

Run the second command after the first finishes. The module build uses the global
locked wrapper. Blueprint refresh is disabled because the published proof graph
is unchanged. The probe imports the built production module and prints the
transitive axiom closure of all four declarations. Repeat these checks after the
4.33.1 upgrade; current validation does not establish that compatibility.

Integration lane: `p97-line-cover-integration-20260907`.
Lane base: `a4f1ff107297cb8a9f2cc38d19feb2293d021d8b`.
The [run manifest](runs/p97-line-cover-integration-20260907/run-0001/run_manifest.json)
authenticates the module, probe, helper, and dependency manifest. Reproducible build
and probe logs are in that run's `artifacts/` directory. Original scratch checkpoint:
`d794e197a`, lane `p97-line-cover-scratch-20260907`.
