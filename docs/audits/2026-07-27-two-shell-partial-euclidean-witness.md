# Two-shell partial Euclidean witness

## Scope

This audit concerns the open leaf

```text
Problem97.ATailFrontierLiveClosure.
  exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows
```

in `Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean`.

The current exact witness shows consistency of the following strict subset of
the leaf's local data:

- one first-apex cap;
- two distinct two-point first-apex cap pairs;
- the two corresponding distinct blocker centres;
- both complete four-point blocker shells;
- the four cross omissions; and
- strict convexity and cyclic order.

It does **not** realize the two full exact-four first-apex radius classes.

## Exact partial witness

The exact eleven-point parabola model in
`scratch/two-shell-partial-euclidean-model/REPORT.md` realizes the listed
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
uv run python scratch/two-shell-partial-euclidean-model/check_model.py
```

## Consequence for the live proof

The witness rules out a contradiction using only the two complete blocker
shells: their off-cap pairs can be disjoint in a strictly convex
configuration.  It does **not** yet rule out a local argument using the
additional four off-cap points forced by the two exact-four first-apex
classes.  That is the next local question to resolve before concluding that a
global field is necessary.

This is a partial route exclusion, not a proof of the live leaf and not a
counterexample to its full Lean statement.
