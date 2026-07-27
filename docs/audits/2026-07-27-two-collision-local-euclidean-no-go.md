# Two-collision-row local Euclidean no-go

## Scope

This audit concerns the open leaf

```text
Problem97.ATailFrontierLiveClosure.
  exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows
```

in `Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean`.

The leaf cannot be closed by a contradiction involving only:

- one first-apex cap;
- two distinct exact-two first-apex radius rows;
- the two corresponding distinct blocker centres;
- both complete four-point blocker shells;
- the four cross omissions; and
- strict convexity and cyclic order.

## Exact witness

The exact eleven-point parabola model in
`scratch/full-local-euclidean-model/REPORT.md` realizes all of those local
features.  In the notation used there, the cap is

```text
a, u, c, d, b, v
```

and the two shells are

```text
center c: a, b, e, f
center d: u, v, g, h.
```

All eleven points are in strict convex position.  The four shell equalities,
the two first-apex equalities, the cap separation, and all supporting-edge
determinants are checked exactly by:

```bash
uv run python scratch/full-local-euclidean-model/check_model.py
```

## Consequence for the live proof

The remaining proof must use a genuinely global field that the witness does
not model: the counterexample distance restriction, deletion minimality,
MEC/three-cap structure, or the tri-apex robustness/cover data.  In
particular, trying to force a shared off-cap shell point from ordered-cap
geometry alone is unsound: the witness has two disjoint off-cap shell pairs.

This is a route exclusion, not a proof of the live leaf and not a
counterexample to its full Lean statement.
