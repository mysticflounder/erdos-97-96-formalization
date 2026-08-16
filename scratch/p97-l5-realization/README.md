# P97 level-5 / FirstNonHit named-fragment realization (2026-08-16)

Numerical evidence that the named metric structure of the level-5 target
`false_of_capSourceThirdCanonicalRowSurface` (equivalently the open leaf
`false_of_freshThird_firstNonHit`) is realizable by a strictly convex polygon.
Consequence: no argument that uses only the named points can close the leaf.
See `docs/audits/2026-08-16-firstnonhit-l5-named-fragment-realization.md`.

## Files

- `l5_construct.py` — constructive realizer.  The three cap chains are convex
  curves (chord plus concave outward offset with piecewise-constant curvature)
  inside the unit disc, meeting at the Moser apexes on the circle.  Class
  members are exact circle/curve intersections, so all equalities hold by
  construction; only inequalities (strict convexity, disc, acute triangle,
  exact class multiplicities) are checked.  Input: a parameter JSON.
- `l5_verify.py` — independent verifier.  Uses only the point list and role
  names of an output JSON and recomputes convexity, MEC, caps, class
  multiplicities and the level-5 role predicates.
- `l5_search.py` — random local search on the parameters that keeps the
  construction valid and increases the robustness margin.
- `l5_extend.py` — greedy extension that adds a critical blocker center (a
  new exact four-point shell) through any named point.
- `params_named37.json`, `realization_named37.json` — 37-point realization of
  the full named level-5 fragment (v1 with two exact-4 classes at distinct
  radii each meeting the strict first cap in exactly two points, both pairs
  co-blocked by distinct critical centers in the strict first cap whose shells
  meet the closed first cap only in their pair, rich apexes v2 and v3 with two
  4-classes each, a cap-1 source point with a critical blocker whose shell
  omits all four pair points, all caps of size at least 12, acute MEC
  triangle 76.4/50.5/53.1 degrees).
- `params_extended81.json`, `realization_extended81.json` — the same
  configuration extended by critical blockers through bP, bR, v1 and all eight
  outer class points of v1 and of the two blocker shells (81 points).

## Reproduce

```bash
uv run python scratch/p97-l5-realization/l5_construct.py scratch/p97-l5-realization/params_named37.json > /tmp/out.json
uv run python scratch/p97-l5-realization/l5_verify.py /tmp/out.json
```

The verifier reports `ok: true` with margins: minimum exterior turn about
0.095 degrees, minimum consecutive separation about 0.0016, all interior
points at norm at most 0.994, and the minimum convexity cross product about
2.5e-7 (far above floating-point resolution; roots are bisected to 1e-18).

## What this does not show

The realizations do not satisfy K4 at every point and do not carry a full
critical-shell system; they satisfy exactly the named hypotheses available at
level 5.  They are not counterexamples to Problem 97.
