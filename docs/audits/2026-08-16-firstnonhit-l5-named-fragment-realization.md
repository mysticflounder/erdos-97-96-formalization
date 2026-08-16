# FirstNonHit / level-5 named fragment: numerical realization audit

Date: 2026-08-16

Active leaf:
`Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_freshThird_firstNonHit`
(`TwoSourceFreshThirdResidual.lean`, two `sorry` children).

Level-5 target:
`false_of_capSourceThirdCanonicalRowSurface`
(`TwoSourceRetainedMinimalCore.lean`).

Evidence: `scratch/p97-l5-realization/` (constructive realizer, verifier,
parameters, two realizations).

## 1. Question

The previous audit (2026-08-15) stopped local carrier waves on this leaf and
asked for a source-clean contradiction from the level-5 ingress.  This audit
asks a prior question: can any argument that uses only the named points of
level 5 close the leaf?  A named-point argument is one whose hypotheses are
metric or order facts about the named points (the three Moser apexes, the two
`v1` classes, the two blocker shells, rich-apex classes, the cap-1 source
witness and its blocker), including shell-curvature packing (Lemmas 30/37 and
`false_of_four_separated_quarter_turn_arcs`), cap counting, and bisector
facts.  If the named hypotheses admit a strictly convex realization, no such
argument exists.

## 2. Hypotheses realized

All of the following hold in `realization_named37.json` (37 points), checked
independently by `l5_verify.py` from coordinates alone:

- MEC is the unit circle; `v1`, `v2`, `v3` lie on it; the triangle is acute
  (76.4, 50.5, 53.1 degrees); all other points are strictly inside.
- The polygon is strictly convex in the stated cyclic order (minimum cross
  product 2.5e-7, minimum exterior turn 0.095 degrees).
- Closed cap sizes 13 / 12 / 15 (cap 1 opposite `v1`), so all caps have at
  least 6 points and cap 1 has at least 8.
- `v1` has exactly two classes of size at least 4, both of size exactly 4, at
  distinct radii; each meets the strict cap 1 in exactly two points and each
  adjacent cap in exactly one point.
- The two strict-cap pairs are co-blocked: `bP` and `bR` are distinct points
  of the strict cap 1, each lies strictly between its pair in the cyclic
  order, each has exactly one class of size at least 4, that class has
  exactly 4 points, contains its pair, and meets the closed cap 1 only in the
  pair (the other two shell points lie in the two other strict caps).
- `v2` and `v3` are rich: each has two classes of size 4 at distinct radii,
  each class with exactly two points in the opposite strict cap and one point
  in each adjacent cap.
- A cap-1 source point outside the four pair points has a critical blocker
  `bS` (a point of strict cap 3, not in `{bP, bR, v1, v2}`) whose unique
  four-point shell contains the source and omits all four pair points, so
  the cross-pair deletion view holds.
- No class at any center contains all three apexes; no accidental extra
  equidistances at any named center (classes are exact to 1e-9).

`realization_extended81.json` extends this by adding critical blocker shells
through `bP`, `bR`, `v1`, and the eight outer class points of the two `v1`
classes and the two blocker shells (81 points, still strictly convex, all
classes exact).  Every finite "next row" extension tried was realizable at
once; each new shell adds three equations and up to eight coordinates.

## 3. Method

`l5_construct.py` builds each cap chain as a strictly convex curve (chord plus
a concave outward offset with piecewise-constant curvature) inside the disc.
Class members are exact intersections of circles with these curves, and the
blocker centers are the intersections of the pair bisectors with the cap-1
curve.  Equalities therefore hold to root-finding precision (bisection to
1e-18 in the curve parameter); the checks are inequalities only.
`l5_search.py` widens the margins by random local search; `l5_extend.py`
adds critical shells through chosen points.

Consistency oracle: the earlier SLSQP realizations of the sub-fragment
without rich apexes (`out_base*.json`, 17 points, session scratch) agree that
the sub-fragment is realizable; the constructive method reproduces this and
adds the rich apexes and the source witness.

## 4. Consequences

1. The leaf cannot be closed by any named-point argument, including the
   shell-curvature packing route (four disjoint quarter-turn arcs), the
   Lemma 37 budgets, cap counting, bisector uniqueness, or any finite
   extension by further named rows.  Every such hypothesis set is satisfied
   by an explicit convex polygon.
2. Local carrier projections and SAT waves over named rows are guaranteed to
   be satisfiable for this leaf; this confirms and strengthens the 2026-08-15
   coverage correction.
3. A closure must use structure that the realizations lack: K4 at the
   unnamed points and the critical-shell system over all of `A`
   (`|A| <= 4 * |notRobustCenters|`, fibers of size at most 4, every point
   in some critical shell), or a cardinality bound that reduces the branch to
   finitely many labelled configurations (as the (m,4,4) branch was closed by
   `surplus_card_le_six_of_convexIndep_K4` and finite classification).  No
   such bound is banked for the route-B tail with all caps of size at least
   6, and the pair-incidence counts available there do not bound `n`.
4. The realizer is a fast negative filter for candidate lemmas: a proposed
   cardinality-independent hypothesis set that is realizable cannot be a
   theorem.  Candidate lemmas for this leaf should be filtered through it
   before Lean work.

## 4a. Addendum (2026-08-16, later): formal content of the leaf and a symmetric probe

- Verified from source: the leaf carries `D : CounterexampleData` with
  `D.K4 : HasNEquidistantProperty 4 D.A` and `D.convex`, and
  `H : CriticalShellSystem D.A` with `shellAt` (a full exact-four radius
  class through every point of `A`) and `no_qfree`.  So the leaf is the
  general K4 problem restricted to the level-5 branch; the named fragment
  is the only part a realizer can test.  Level 5's hypotheses are a subset
  of the leaf's (nthdegree fact `JGK5T7`), so a proof of level 5 is
  required and sufficient.
- Equation count (heuristic, not a proof): with coordinates and one radius
  per center there are `3n - 4` unknowns modulo similarity and `4n`
  incidence equations, so a K4-everywhere configuration without symmetry
  needs at least `n + 4` algebraic dependencies among its incidences.
  Dependencies from mutual membership form cycles of the mutual-incidence
  graph (a mutual pair gives none, a mutual cycle gives one), and even the
  fully mutual case splits into same-distance components each
  overdetermined by three.  Under a rotational symmetry every point has the
  free pair `dist(p, w p) = dist(p, w^-1 p)`, which changes the count
  substantially: `C_k` with `m` orbits needs `2m` equations for `2m - 2`
  unknowns (excess 2), and `D_k` with `a` generic and `b` axis orbits needs
  `2a + b` equations for `2a + b - 1` unknowns (excess 1), while `K3` under
  the same ansatz is underdetermined (`C_k`: excess `2 - m`; `D_k`: excess
  `1 - a`), which is why K3 examples are abundant.  In the realizations here
  all six named class radii are pairwise distinct, so the named fragment
  forces no radius sharing.
- K3 calibration relevant to the branch: the C3 search finds exact
  K3-everywhere convex polygons at n = 9, 12, 15 (`c3_k3_15gon.json`,
  verified: three apexes on the MEC, all other points strictly inside, each
  closed cap has 6 points) and a numerically near-exact one at n = 18
  (residual 4e-11).  So the route-B tail shape (Moser triangle, all caps at
  least 6) contains K3-everywhere configurations; any closure of level 5
  must use the fourth class point essentially, and a candidate global lemma
  should first be checked to fail on these K3 examples.
- `D_k` probe (`dk_symmetric_search.py`, k = 3, 4, 5, 6, 8, up to 32
  vertices, separation 0.15): K3 controls exact at k = 3 (n = 15) and
  k = 5 (n = 20); K4 finds nothing, best squared residuals 1.5e-4 (k = 3),
  3.5e-4 (k = 5), worse for k = 4, 6, 8.  Heuristic only.
- Symmetric probe: `c3_symmetric_search.py` searches three-fold symmetric
  convex polygons (outer orbit = Moser triangle, the branch's natural
  symmetric ansatz).  Controls: it finds an exact Danzer-type K3 nonagon and
  an exact C3 K3 12-gon (`c3_k3_12gon.json`, verified independently).  For
  K4 it finds nothing up to 24 vertices (best squared residuals
  `2e-3 .. 5e-3` at separation 0.3; a spurious three-cluster attractor at
  small separation).  Heuristic only.

## 5. Status

This checkpoint closes no `sorry`.  It records a negative result about the
proof route and moves the leaf's closure requirement to the global blocker
system.  Labels: the realizations are numerical (double precision with
explicit margins), not certified; the equivalence between the leaf and the
level-5 target is the structural finding of the previous session (nthdegree
fact `JGK5T7`).
