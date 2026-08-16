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

- `c3_symmetric_search.py` — heuristic search for convex polygons with
  three-fold rotational symmetry (the branch's natural symmetric ansatz: the
  outer orbit is the Moser triangle) in which every vertex has `K` other
  vertices at one common distance.  Alternates greedy class choice (best
  window of `K` nearly equal distances) with least squares; hinge penalties
  for strict convexity, minimum separation `SEP`, and the unit disc.
  `uv run python c3_symmetric_search.py K M RESTARTS SEED SEP` (n = 3M).
- `verify_multiplicity.py` — independent check of a point list: strict
  convex position, minimum separation, per-vertex maximum multiplicity.
- `dk_symmetric_search.py` — the same alternating scheme for dihedral
  symmetry `D_k` with `A` generic orbits (size 2k) and `B` axis orbits
  (size k), using the free rotation pairs `dist(p, w^i p) = dist(p, w^-i p)`
  and, for axis points, free mirror pairs.  For K4 this ansatz is only one
  equation overdetermined (`2A + B` equations, `2A + B - 1` unknowns);
  for K3 it is underdetermined.  `uv run python dk_symmetric_search.py K k A B RESTARTS SEED SEP`.
- `c3_k3_15gon.json` — verified C3 K3 15-gon in the route-B tail shape
  (Moser triangle on the MEC, all closed caps of size 6).
- `dihedral_alternating_scan.py` — exact scan of two-orbit dihedral 2k-gons
  (orbit A at radius 1 on even rays, orbit B at radius rho on odd rays,
  k = 3..60): every rho at which some A-vertex has an equal-distance
  coincidence is solved in closed form and both orbits are checked exactly.
  Result: no convex 2k-gon of this family has multiplicity at least 4 at
  every vertex (`done; found 0`).

Results (2026-08-16, seed 7, 60 restarts, SEP 0.3):

| K | M (n) | best squared residual | note |
|---|-------|-----------------------|------|
| 3 | 3 (9) | 1e-19 | exact; Danzer-type nonagon (control) |
| 3 | 4 (12) | 4e-26 | exact; C3 K3 12-gon, verified convex, min sep 0.32, all multiplicities 3 |
| 3 | 5 (15) | 1e-5 | near |
| 4 | 3..6 (9..18) | 2e-3 .. 5e-3 | no K4 candidate; best spreads 1e-2 .. 4e-2 |
| 4 | 7, 8 (21, 24) | 2e-2, 2e-1 | separation binds inside the disc |
| 4 | 6, 7, 8 (SEP 0.15, seed 11, 100 restarts) | 1.5e-4, 4.4e-4, 8.5e-4 | spread-out near misses, class spreads 0.1..0.9 percent, least squares plateaus |

`D_k` results (seed 5, 40 to 60 restarts, SEP 0.15; `n = 2kA + kB`):

| K | k | (A,B) : n | best squared residual |
|---|---|-----------|-----------------------|
| 3 | 3 | (2,1) : 15 | 6e-18 exact |
| 3 | 5 | (2,0) : 20 | 6e-29 exact |
| 4 | 3 | (2,1) 15, (3,0) 18, (3,1) 21, (4,0) 24, (4,1) 27, (5,0) 30 | 1.6e-4, 3.4e-4, 1.8e-4, 1.7e-4, 2.1e-4, 1.5e-3 |
| 4 | 3 | (2,2) 18, (3,2) 24, (3,3) 27, (4,2) 30 | 1.4e-2, 1.3e-2, 5.5e-2, 1.2e-2 (axis orbits conflict with convexity/separation) |
| 4 | 4 | (1,1) 12 .. (3,1) 28 | 5e-3 .. 3e-1 |
| 4 | 5 | (1,1) 15, (2,0) 20, (2,1) 25, (3,0) 30 | 4.3e-3, 2.7e-3, 3.5e-4, 4.2e-4 |
| 4 | 6 | (1,1) 18, (2,0) 24, (2,1) 30 | 1.4e-2, 1.8e-2, 8.0e-3 |
| 4 | 8 | (1,1) 24, (2,0) 32 | 8.2e-3, 1.1e-2 |

With `SEP` 0.08 the K4 search collapses to three tight clusters at the
vertices of an equilateral triangle (all cross-cluster distances close to
the side), which is a spurious near-K4 attractor, not a candidate.  This is a
heuristic probe only: it shows the machinery finds genuine K3 solutions and
finds no K4 solution among C3-symmetric polygons up to 24 vertices; it is
not evidence about non-symmetric configurations.

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
