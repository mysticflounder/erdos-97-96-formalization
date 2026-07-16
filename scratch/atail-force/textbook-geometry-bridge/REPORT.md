# Textbook geometry bridge audit for K-A-PAIR

Date: 2026-07-14

Status: **NO DIRECT PRODUCER; SHARP HYPOTHESIS MISMATCH.**

## Scope

This audit searched only the locally ingested nthdegree corpus

```text
bkos08-de-berg-cheong-van-kreveld-overmars-2008-computational-geometry-algorithms-applications
```

and the required local theorem-bank registries.  It used no web search.  The
live target is

```text
Problem97.U1LargeCapRouteBTailMetricResidualTarget
  .DoubleApexOffSurplusSharedRadiusPair
```

and the current paired reduction is

```text
Problem97.ATailCriticalPairFrontier.CriticalPairFrontier.
```

## Verdict

The textbook does not supply an instantiable theorem that turns an arbitrary
`CriticalShellSystem` row into either a prescribed deletion failure or the
required two-blocker/four-center contradiction.

The decisive mismatch is that a critical selected four-class is only an exact
positive distance level set:

```text
support = {z in A | dist center z = radius},  support.card = 4.
```

Its deletion-criticality says that, after deleting the source, no positive
radius at that fixed center has four remaining carrier points.  It says
nothing about whether the other carrier points lie inside or outside the
selected circle.  The textbook's closest circle machinery all requires one of
those missing inequalities.

## Candidate theorem map

### Ordinary Voronoi and Delaunay

The textbook's Theorem 7.4 characterizes an ordinary Voronoi vertex by a
largest empty circle with at least three sites on its boundary.  Theorem 9.6
characterizes Delaunay faces and edges by an empty-circle/empty-disc
condition.  An application to a critical shell centered at `c` would require

```text
forall z in A, z notin shell -> radius <= dist c z.
```

No field of `CriticalSelectedFourClass`, `CriticalShellSystem`, or
`CriticalPairFrontier` supplies this.  Exact support nonmembership gives only
`dist c z != radius`, not its direction.

### Farthest-point Voronoi and minimum enclosing discs

The farthest-point Voronoi discussion and the minimum-enclosing-disc deletion
facts apply when the circle encloses the complete point set.  An application
to a critical shell would require

```text
forall z in A, dist c z <= radius.
```

Again this is absent.  In particular, `CriticalShellSystem.no_qfree_at` is a
multiplicity statement at `c`, not an enclosing-disc optimality statement.
Consequently the constrained minimum-disc deletion lemma cannot be
instantiated.

### Delaunay edge flipping / incircle comparison

The textbook's Lemma 9.4 says that for two triangles forming a convex
quadrilateral, the shared edge is illegal exactly when the opposite vertex is
inside the other triangle's circumcircle; in the non-cocircular case exactly
one diagonal is illegal.  A critical row does not provide a legal
triangulation, an empty circumcircle, or an inside/outside choice for a point
off its support.  Applying the lemma to the four shell points only recovers a
fact about that isolated cocyclic quadruple and does not couple another
critical center.

### Two-circle and perpendicular-bisector facts

The unconditional textbook facts that do apply are already stronger and
kernel-proved in the local bank:

```text
SelectedFourClass.inter_card_le_two
Dumitrescu.perpBisector_apex_bound
eq_of_equidistant_three_noncollinear
CapSelectedRowCounting.outsidePair_unique_capCenter
```

They are already used by `CriticalPairFrontier`: mutual cross membership
collapses the two blockers, while a cross omission yields distinct blockers
and shell-overlap cardinality at most two.  Reimporting the textbook argument
does not strengthen this frontier.

## Exact witness that the missing inequalities are genuinely absent

The existing exact real-algebraic local model in

```text
scratch/atail-force/blocker-cap-geometry/
  exact_blocker_cap_countermodel.py
```

has blocker `D`, source `E`, and exact shell radius squared `2/13` with

```text
shell(D, 2/13) = {A, E, F, I}.
```

Relative to that same circle, the exact squared-distance defects
`dist(D,z)^2 - 2/13` include

```text
J   = -6/65
t2  = -687/520000
K   = 27/65
O   = 11/13.
```

Thus the circle has carrier points strictly inside and strictly outside.  It is
neither an empty circle nor an enclosing circle.  The model retains strict
convexity, the actual MEC/cap geometry, no-M44 profile, the first- and
second-apex survivor data, and the source-critical exact shell.  It does not
claim global K4 or a full critical-shell system, but it is enough to refute any
attempt to derive the empty/enclosing antecedent from the local selected-shell
API plus the current three-center geometry.

## The only potentially useful convex-order lemma

A genuine convex-polygon lemma suggested by the textbook's half-plane model
can be stated as follows.

```text
Convex-order bisector-side lemma.
Let a,y,x,c be distinct vertices of a strictly convex polygon, occurring in
that cyclic order.  If dist x a = dist x c, then dist y a < dist y c.
```

Geometrically, the perpendicular bisector of `a,c` passes through the boundary
vertex `x`; the boundary arc from `a` to `x` cannot cross that line earlier, so
`y` stays in `a`'s open half-plane.  The local file
`Dumitrescu/Lc1Strict.lean` already contains the algebraic
half-plane-to-distance conversion; its declaration named
`convex_order_implies_perpBisector_side` currently assumes the much stronger
segment relation `Wbtw a y x`, not polygon cyclic order.

For the robust pair, one would instantiate

```text
a = q, c = w, x = S.oppApex1, y = H.centerAt q q_mem_A
```

or the symmetric assignment.  The pair supplies
`dist S.oppApex1 q = dist S.oppApex1 w`, and all four points are carrier
vertices.  What it does **not** supply is the displayed cyclic placement of
the blocker.  The current blocker-cap split only says that a blocker is a
Moser vertex or belongs to one of three cap interiors; it does not put it on
the required `q`-to-`oppApex1` boundary arc.

Even if that placement were added, the conclusion is only

```text
dist blocker q < dist blocker w,
```

hence `w` is omitted from the exact shell at `q`'s blocker and the cross
deletion survives.  That is already one open arm of `CriticalPairFrontier`,
not a contradiction and not a prescribed apex deletion failure.  A second
global producer would still be needed to constrain both blocker locations or
their other shell members.

## Closure consequence

The textbook does not change the next theorem target.  Closure still needs a
genuinely global two-blocker/four-center input, for example a theorem that
uses the two complete critical rows (including their other three support
points) to force one of:

```text
* reciprocal cross membership followed by an existing center-collision sink;
* a third common equidistant carrier point, forcing blocker equality;
* a cap-local outside pair shared by two distinct cap centers; or
* failure of one of the prescribed apex deletion survivals.
```

None of these is a consequence of the textbook results without a new producer
for the missing incidence or cyclic-placement antecedent.

