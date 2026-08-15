# FreshThird pinned-center/global-data probe

This scratch probe extends `freshthird_two_shell_22_probe.py` with the
source-retained global information in
`TwoSourceFreshThirdResidual.lean`:

* a pinned center chosen from the six-point two-shell seed;
* the pinned selected K4 intersects that seed in at most three points;
* the remaining K4 points are explicitly outside the seed;
* the canonical row at the designated outside point is split into the
  same-center/non-robust and distinct-center/intersection-`<= 2` arms;
* the endpoint row is independently split into escape and exact-support arms,
  with the endpoint center either equal to or distinct from the pinned center.

The metric layer keeps only the source-proved five-point cyclic/Kalmanson
orders, shell equidistance, and selected-row equidistance.  No cyclic placement
is invented for auxiliary seed or escape points.  The canonical distinct-center
intersection bound and the exact-support center identity are retained as
finite/combinatorial branch facts, not guessed metric equations.

The script enumerates all 26 K4 support shapes allowed by the `<= 3` seed
bound (0, 1, 2, or 3 seed points, with the rest fresh outside points).  A
branch is reported SAT when at least one of those legal support shapes is SAT;
it is reported UNSAT only when every support shape is UNSAT.

## Result

`freshthird_pinned_center_global_probe.results.txt` reports:

```
branch summary (SAT if any legal K support survives): {'sat': 176, 'unsat': 16, 'unknown': 0}
support-check summary: {'sat': 4352, 'unsat': 640, 'unknown': 0}
```

The 16 universally UNSAT branches are exactly the four source-entitled order
arms times the two endpoint choices (`qOutside`, `qBetween`) with

```
pinned center = endpoint center
endpoint branch = exact two-shell support
```

The canonical-row arm (`same` versus `distinct`) does not affect this cut.

## Smallest source-level clause

The smallest universal clause is therefore already available without a new
solver-discovered geometric cut:

> If the endpoint center equals the pinned center, the endpoint exact-support
> arm is impossible.  Equality of centers makes that endpoint row the pinned
> selected K4, while exact two-shell support contributes four seed points;
> this contradicts the pinned-center multiplicity bound of at most three seed
> points.

This is a producer candidate for the existing endpoint escape consumer.  The
Lean ingress still has to package the two rows on the same `BoundaryIndexing`
and transport the endpoint exact-support branch into the pinned K4 before this
can close a live theorem.  The probe itself is only an exact-rational,
source-faithful abstraction check; SAT rows are not countermodels to the
formal theorem and no UNSAT certificate is promoted from this artifact.

