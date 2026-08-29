# Level-5 named metric fragment: numeric realizability audit

Date: 2026-08-16

Active leaf:
`Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_freshThird_firstNonHit`,
which is structurally equivalent to the level-5 theorem
`false_of_capSourceThirdCanonicalRowSurface`
(`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceRetainedMinimalCore.lean:369`)
via `false_of_freshCanonicalRowOverride` and `|A| ≥ 17` (see the
2026-08-15/16 session notes in nthdegree, fact "P97 FirstNonHit structural
finding").

This note records (1) an assessment of
`attic/stale-dirty-cleanup-2026-08-28/docs/solve-prompts/gpt-pinned-multiplicity-08-16-2026.md`
against the leaf,
(2) an explicit numeric realization of the *named metric fragment* of level 5,
and (3) the resulting constraints on any closing argument. Nothing here closes
a `sorry`. Numeric statements are labelled; none is a proof.

## 1. Assessment of the pinned-multiplicity survey

- Witness census `d ≥ 6n − C(n,2)` (§4): vacuous for `n ≥ 13`; level 5 has
  `|cap₁| ≥ 8`, hence `n ≥ 17`. The branch-local form `T − M` does not bite in
  cap₁ either (each cap-interior center gives at most one base inside cap₁ by
  `selectedClass_inter_capByIndex_card_le_two`, so `T ≤ |cap₁| + …` while
  `M = C(|cap₁|, 2) ≥ 28`).
- Normal-incidence events (§2): along the boundary the distance from a vertex
  `c` has maxima only at vertices and minima only in edge interiors. A 4-shell
  forces three events (max–min–max), but a 3-shell forces three as well, so
  the count does not separate multiplicity 3 from 4 (Danzer's 9-gon has ≥ 3
  events at every vertex). Encoding tool only.
- Semicircle (§5), opposite chains (§4), cap-endpoint monotone distances
  (§3): already banked (`alternates_between_firstApex_and_commonBlocker`,
  `commonBlocker_mem_firstCapInterior_of_sources_mem`,
  `CGN6c_dist_strict_from_first`, `support_inter_capByIndex_card_le_one`,
  ShellCurvature window charts).
- Cut matrices (§6), bisector energy (§7), three-pin identity (§8): encoding
  or asymptotic; no inequality that bites at `n = 17`.
- Bárány–Roldán-Pensado 15-gon with `N(K) = 6`: the continuous relaxation of
  P97 fails at thresholds 4 and 5. Consequently no proof can rest on extremum
  or turning arguments alone; vertex discreteness must enter through counting.
  Level 5 is exactly where the banked counting (fibers `b_P`, `b_Pρ`, one third
  collision) is spent.

## 2. Named metric fragment and a numeric witness

Points are indexed in counterclockwise order: `0 = v1`, `1..4 = I₃`,
`5 = v2`, `6..11 = I₁`, `12 = v3`, `13..16 = I₂`; so `cap₁ = {5..12}`,
`cap₂ = {12,…,16,0}`, `cap₃ = {0,…,5}` and the cap sizes are `(8, 6, 6)`
(`n = 17`, the smallest instance of level 5).

Encoded hypotheses (all metric, all in the level-5 context):

- MEC is the unit circle; `v1, v2, v3` on it, non-obtuse; all other points
  strictly inside; strict convex position in index order (positive turn at
  every vertex, total turning `2π`).
- `Γ_r(v1) = {p1, p2, a1, a2}` with `p1 = 6, p2 = 11 ∈ I₁`, `a1 = 4 ∈ I₃`,
  `a2 = 13 ∈ I₂` (one point in each adjacent cap, as forced by
  `selectedClass_exactOne_eachAdjacent_of_card_four_of_interior_card_two`).
- `Γ_ρ(v1) = {p1', p2', a1', a2'} = {7, 10, 3, 14}`, `ρ ≠ r`.
- `sh(b_P) = {p1, p2, x, y} = {6, 11, 2, 15}` with `b_P = 9 ∈ I₁` between
  `p1, p2`; `sh(b_Pρ) = {7, 10, 1, 16}` with `b_Pρ = 8`. Nested order
  `p1 p1' b_Pρ b_P p2' p2`.
- Genericity: no unnamed vertex on any of the four circles (so the classes are
  exact-four and each meets cap₁ exactly in its named pair).

Witness (double precision; equalities hold to `2·10⁻¹⁵`, all seventeen
exterior angles positive with minimum `0.071°`, total turning `360°`, apex
triangle angles `75.78°, 52.09°, 52.13°`, all non-apex radii `≤ 0.995`):

| idx | role | x | y |
|---|---|---|---|
| 0 | v1 | 0.0038876250234102174 | 0.99999244315728586 |
| 1 | x' (I₃) | -0.78675146943969398 | 0.02860824337709611 |
| 2 | x (I₃) | -0.90085243432549145 | -0.11220932465034905 |
| 3 | a1' (I₃) | -0.9555264346764698 | -0.18406726004962778 |
| 4 | a1 (I₃) | -0.97163101063196644 | -0.21437858843246621 |
| 5 | v2 | -0.97012746511679682 | -0.24259575723012586 |
| 6 | p1 | -0.9204549874759379 | -0.25377162778794843 |
| 7 | p1' | -0.85599904864457232 | -0.25820771069601184 |
| 8 | b_Pρ | -0.021699727301342262 | -0.30786986778564068 |
| 9 | b_P | -0.0067025971781977242 | -0.30816327547015826 |
| 10 | p2' | 0.81390362819529738 | -0.29087811321685719 |
| 11 | p2 | 0.90781063190349254 | -0.26857241860901654 |
| 12 | v3 | 0.96854956285758653 | -0.24882070711333101 |
| 13 | a2 (I₂) | 0.96993480635840412 | -0.22192672532727423 |
| 14 | a2' (I₂) | 0.95286151097542382 | -0.19245096534870393 |
| 15 | y (I₂) | 0.88621778579212296 | -0.10668108819653931 |
| 16 | y' (I₂) | 0.6396673824426341 | 0.20312448990285289 |

Radii: `r = 1.557669288031091`, `ρ = 1.523966114685051`,
`s = |b_P p1| = 0.915369806205350`, `s' = |b_Pρ p1'| = 0.835776098868931`.
Every vertex other than `v1, b_P, b_Pρ` has distance multiplicity 1; in
particular `v2, v3` are not rich in the witness.

Shape: a fat triangle. Cap₁ hugs the chord `v2v3`; the four collision points
sit near the cap ends, the two blockers near the foot of the altitude from
`v1`; `x, y` (resp. `x', y'`) lie on the two other sides at distance
`s ≥ dist(b_P, chord v1v2)`.

Method: SLSQP (scipy) on the 34 coordinates with the equalities as
constraints and the convexity, disk, non-obtuse, winding, separation and
`r ≠ ρ` conditions as inequalities, from a hand-designed seed. Scripts are
session scratch (`l5_seed.py`, `l5_general.py`, `l5_soft2.py`); the table
above is sufficient to re-verify the witness directly.

## 3. Consequences for the closing argument

1. Any proof of level 5 must use hypotheses about points *not* named by the
   two collisions: `K4` at unnamed vertices, the blocker map `β` /
   `no_qfree`, and apex richness (`FrontierAllLargeCapsTriApexRobustResidual`:
   `ApexRichClassStructure` at all three apexes). The named metric structure
   alone is realizable.
2. In particular the sorry-free four-arc turning terminal
   (`false_of_four_separated_quarter_turn_arcs`) cannot close level 5 from the
   named structure alone: the witness is a genuine convex polygon, so no set of
   four disjoint `> π/2` arcs is forced by these hypotheses.
3. Tight case (`n = 17`, caps `(8,6,6)`, apexes rich): by
   `support_inter_capByIndex_card_le_one` an apex 4-class meets each other
   closed cap in at most one point, so a rich `v2` with `|I₂| = 4` has either
   two exact-four classes each with exactly two points of `I₂` and one point
   in each adjacent closed cap, or a single 6-class `I₂ ∪ {c₁, c₃}`. Either
   way every point of `I₂` lies within `min(|v2v1|, |v2v3|)` of `v2`
   (cap-endpoint monotonicity), and symmetrically for `I₃`. Combined with the
   collision structure at `v1` (`a2 ∈ I₂` at distance `r > h₁` from `v1`),
   this constrains the apex triangle: for an isosceles triangle with the
   two-class option and interior side hits, `|v2 a2| ≤ min(|v2v1|,|v2v3|)`
   with `r ≤ 2|v1v2| cos A` forces roughly `sin B < 2 cos A`, i.e. a small
   angle at `v1`. The base fragment itself is realizable over a wide range of
   apex angles: with small solver margins (separation `0.004`, convexity
   margin `1e-4`) it was realized at `A = 62°, 68°, 72°, 76°`, always with
   minimum exterior angle `≈ 0.01°`, i.e. nearly flat caps (a first trace with
   larger margins suggested `A ≥ 75°`; that was a margin artifact). So the
   base fragment does not pin the triangle; the tension with apex richness, if
   any, must come from the full apex-class incidence pattern. The extension
   "base fragment + two exact-four classes at each of `v2`, `v3` covering
   `I₂`, `I₃`" was run with a soft class-assignment stage; see §4 for the
   outcome. {{UNVALIDATED}} — local-solver evidence only. If some finite
   pattern family is confirmed infeasible for every combinatorial pattern
   (which apex-side points are strictly interior, 6-class options, kite
   orders, `x, y` placements), that finite metric statement is a candidate
   lemma for the exact tools. It would cover only `|I₂| = |I₃| = 4`; for
   larger caps the reach argument leaves a free point in each side cap and the
   contradiction must come from `K4` at the remaining vertices.
4. Working conclusion: level 5 needs a new counting/discreteness inequality
   for the two-kite configuration; the tight case is the place to find it.

## 4. Apex-rich extension (tight case): outcome

Extension tested: the base fragment above plus, at each of `v2` and `v3`, two
exact-four classes with distinct radii, each taking exactly two points of the
opposite cap interior (`I₂` for `v2`, `I₃` for `v3`; the two classes cover the
whole interior), one point of the left adjacent closed cap and one of the
right adjacent closed cap (the only two-class option compatible with
`support_inter_capByIndex_card_le_one` when `|I₂| = |I₃| = 4`; the 6-class
option was not tested). The class memberships were chosen by a soft
least-squares stage (disjoint per center) and polished with SLSQP; margins
separation `0.004`, convexity `1e-4`, disk `0.002`; seeds: the fat witness and
the `A = 62°, 68°, 72°` base solutions; 10 restarts each.

Outcome: no feasible point found. Soft-stage cost floors at `≈ 4·10⁻³` in
every run; the best polished residual was `7·10⁻³` and that candidate is
doubly wound. All runs drift to an equilateral apex triangle with `v2`'s and
`v3`'s first classes passing through the other two apexes
(`{a2, a2', v3, v1}` at `v2`, `{a1, a1', v2, v1}` at `v3`, both allowed by
`no_center_covers_all_apices`) and second classes through the mid-side points
`x, x', y, y'` and one collision point each.

Status: {{UNVALIDATED}} negative numeric evidence (local solver; two-class
option only; one kite order; interior side hits). It is consistent with the
working conclusion of §3: the first hypothesis beyond the named metric
structure that resists realization is apex richness of `v2, v3` in the tight
case. The corresponding finite statement — "two-kite collision structure at
`v1` with `|I₁| = 6`, `|I₂| = |I₃| = 4`, plus `ApexRichClassStructure` at
`v2, v3`, is not realizable" — is the candidate for exact/interval decision.
It is not a closure of level 5 (which has arbitrary `n ≥ 17`).
