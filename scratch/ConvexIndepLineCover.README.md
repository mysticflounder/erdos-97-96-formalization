# Convex-independent line-cover bound: scratch integration candidate

Copyright (c) 2026 Adam McKenna. Released under GPL-3.0-or-later; see LICENSE.

Prepared at the user's request during the mathlib upgrade. Keep this candidate in
scratch until the upgrade is complete. No production Lean file, aggregate import,
proof-status document, or existing audit is changed by this lane.

## Scope and provenance

Lane: `p97-line-cover-scratch-20260907`.
Lane base: `3f9db5ec1cb21841810d0fa2b88f0d9027a6900b`.
Source: [ConvexIndepLineCover.lean](ConvexIndepLineCover.lean).

**Discovery credit: GitHub user sallerk**, owner of `sallerk/erdos-notes`, for the
mirror-line counting observation in
[sallerk's P97 note at the inspected revision](https://github.com/sallerk/erdos-notes/blob/6f0ff6e3937ad5bcd341afbf8cf857cd5403913b/p97/NOTE.md).
We generalize its line count to any finite family of collinear sets. No result
about alternating radii, distance multiplicity, or general dihedral symmetry is
formalized here.

The exact target is: for `A : Finset ℝ²` and `L : Fin m → Set ℝ²`, convex
independence of `A`, collinearity of every `L i`, and membership of every point of
`A` in some `L i` imply `A.card ≤ 2 * m`. The cover may overlap or repeat sets;
empty covers and empty sets are permitted.

## Reuse and proof structure

The project corpus preflight found no matching general line-cover theorem. The
existing `Problem97.ConvexIndep.not_collinear_of_card_ge_three` and
`Problem97.ConvexIndep.mono` in `Erdos9796Proof.P97.ConvexIndepHelpers` supply the
geometric step. Their current statements were inspected at the lane base.
Mathlib's `Finset.card_biUnion_le` supplies the finite-union count.

The candidate contains four declarations in `Problem97.ConvexIndep`:

- `card_le_two_of_collinear_subset`: each collinear subset contributes at most two points.
- `card_le_two_mul_of_collinear_cover`: sum these bounds over the cover.
- `false_of_card_fifteen_five_collinear_cover`: fifteen points cannot fit in five sets.
- `false_of_card_fifteen_three_collinear_cover`: fifteen points cannot fit in three sets.

The last two declarations are the immediate consumers. This is an off-spine
search exclusion; there is no publish-reachable obligation under modification,
no new `sorry`, and no claimed decrease in the P97 descent frontier.

## Validation and audit

The final fresh single-file check passed on 2026-09-07 with Lean 4.27.0 and
mathlib revision `a3a10db0e9d66acbebf76c5e6a135066525ac900`, using the command below.
All four declarations reported exactly `{propext, Classical.choice, Quot.sound}`.
The source includes the four `#print axioms` commands. No `sorryAx`, custom axiom,
or `Lean.ofReduceBool` was reported. Exit status was 0, with no proof errors or
warnings. This check includes the final discovery-credit docstrings.

Final candidate SHA-256 (including the discovery-credit docstrings):
`dd310b54461fecac8183ec1d5f78cb4b013bd6a40e2e7a250ca2217fadcdc890`.
The inspected `ConvexIndepHelpers.lean` source SHA-256 is
`58fea6fdfc458ff582e9e12c324d10b6e51a5653a6daa5dc80f586642be49129`;
the selected `lean/lake-manifest.json` SHA-256 is
`48adeb0901038a9dc08e0f80a70d5eb5a609058b849afd582c0c2f6ebe0cbfce`.

The ongoing migration is in `.worktrees/mathlib-v4331-migration-20260907` and
targets Lean/mathlib 4.33.1. No validation in that worktree is claimed; no source,
dependency, build artifact, or lock there was changed. Recheck after the upgrade.

### Math-skeptic audit

**Target:** the four declarations in `ConvexIndepLineCover.lean`.
**Date:** 2026-09-07. **Claims audited:** 4.
**Verdict: CERTIFIED for the four Lean declarations on 4.27.0.** The proof
statements and argument passed independent static review; final fresh elaboration
and transitive axiom checks passed. All four claims below are PROVEN
(Lean-formalized). Compatibility with 4.33.1 remains unchecked.

| Claim | Evidence and scope |
| --- | --- |
| Collinear subsets have cardinality at most two | Existing convex-independence monotonicity and three-point noncollinearity theorem; fresh Lean check. |
| An `m`-set collinear cover gives cardinality at most `2 * m` | Sum of the filtered-piece bounds, using `Finset.card_biUnion_le`; fresh Lean check. |
| Five collinear covering sets exclude fifteen points | Specialization to `15 ≤ 10`, discharged by `omega`; fresh Lean check. |
| Three collinear covering sets exclude fifteen points | Specialization to `15 ≤ 6`, discharged by `omega`; fresh Lean check. |

The review explicitly checked overlapping/repeated/empty covering sets and
`m = 0`; the cover hypothesis forces the carrier to be empty in the last case.
Its sole clarification finding was that the D₃/D₅ source comments must state
that the line cover is still supplied as a hypothesis. Those comments were
clarified without changing statements or proofs. There is no formalized
dihedral-to-mirror-axis interface and no general P97 closure claim.

## Integration after the upgrade

1. With the upgraded dependencies built and no concurrent `lake-build` in this
   Lake root, run from `lean/`:

   ```bash
   lake env lean -M 16384 ../scratch/ConvexIndepLineCover.lean
   ```

2. Check that all four declarations compile and their transitive axiom output
   contains no `sorryAx`, custom axiom, or `Lean.ofReduceBool`.
3. Move the declarations to a small production helper module, proposed path
   `lean/Erdos9796Proof/P97/ConvexIndepLineCover.lean`, retaining the imports and
   `Problem97` namespace. Move the final diagnostic commands to the validation
   probe. Run `lake-build Erdos9796Proof.P97.ConvexIndepLineCover` and a fresh axiom
   probe. Import it only from a concrete consumer when needed.
4. Update `docs/audits/alphaevolve-p97-artifact-analysis-2026-08-22.md`, F3 and the
   untested-neighbor paragraph: the D₅ all-axis fifteen-point family is excluded
   by the five-line bound, and the D₃ family by the three-line bound. This does
   not prove the audit's proposed golden-ratio bound; it makes that stronger
   metric assertion unnecessary for the nonconvexity conclusion.

The symmetry application still requires identifying the three or five mirror
lines and supplying the cover hypothesis. The scratch corollaries formalize the
resulting geometric exclusions, not an API connecting a dihedral group action to
its reflection axes. Mixed on-axis/off-axis families are outside this claim.
