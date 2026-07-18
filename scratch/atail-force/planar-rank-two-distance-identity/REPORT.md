# Planar rank-two distance identity

Date: 2026-07-18

Status: **kernel-checked scratch consumer; no finite coverage and no live
`sorry` closure.**

## Purpose

The integrated exact-six search works with an abstract table of pairwise
distances.  Kalmanson inequalities and selected-shell equalities are linear in
those distances, but they do not require one common realization by points in
`ℝ²`.  The next load-bearing gate is therefore planar rank two.

`PlanarRankTwoDistanceIdentity.lean` exposes the standard three-vector Gram
determinant directly in the six squared distances of four points
`p,a,b,c : ℝ²`.  It also supplies a certificate-facing theorem: after six
distance-square values are rewritten to exact scalars, their determinant
polynomial must be zero, plus an immediate `False` adapter for a replayed
nonzero scalar determinant.

The corpus already contained the same calculation inside specialized Census
and U5 collision proofs, including
`Census554.EqualityCore.circleNetwork_planar_gram_det_zero`, but those helpers
are private to their modules.  This scratch theorem isolates the reusable
normal form needed by the current exact-witness route.

## Rigor boundary

This theorem can turn one exact nonzero four-point determinant into a short
Lean contradiction once a source-faithful role assignment supplies the four
actual points and six exact distances.  It does **not** prove that every
abstract survivor has such a minor, that the current structural surface is
planar, or that the direct parent theorem follows.  A witness-specific
determinant is not finite role coverage.

Validation from `lean/`:

```text
lake env lean -DwarningAsError=true \
  ../scratch/atail-force/planar-rank-two-distance-identity/PlanarRankTwoDistanceIdentity.lean
```

All three public theorems report only `propext`, `Classical.choice`, and
`Quot.sound`.
