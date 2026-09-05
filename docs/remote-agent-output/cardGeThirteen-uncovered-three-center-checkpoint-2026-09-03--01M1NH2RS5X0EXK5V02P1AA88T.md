# `false_of_cardGeThirteenUncoveredThreeCenterPacket`: closure checkpoint

Date: 2026-09-03 / 2026-09-04 collaboration window

## Current conclusion

The strengthened V2 packet is a real source reduction, but its visible local
geometry is **not itself contradictory**.

An exact rational 15-point configuration has been constructed and independently
encoded in `cardge13_uncovered_local_countermodel.py`.  It verifies all of the
following simultaneously:

- every one of the 15 named points is a vertex of a strictly convex polygon;
- `O` is a carrier point with two disjoint exact four-point distance classes
  `K0` and `K1` at distinct positive radii;
- `b0` and `b1` are distinct carrier points with exact four-point rows `C0`
  and `C1`;
- `C0` and `C1` contain their own named sources and mutually omit the other
  source;
- two distinct points `d` and `z` are omitted by `C0`, `C1`, and the same named
  A2 row `K1`;
- `z ∈ K0`, so `K1` is exactly the named opposite row required by the current
  `thirdRow_named` interface;
- on one open hull arc, the two A2 classes have a `3+2` interior profile, the
  two blocker rows cover two points each, and `z` is the unique uncovered
  class point—the exact `2+2+1` residual.

The four exact supports are

```text
K0@O  = {p0,p1,p2,p3}
K1@O  = {p4,p5,p6,p7}
C0@b0 = {p1,p5,e00,e01}
C1@b1 = {p3,p4,e10,e11}.
```

Take

```text
source0 = p1,
source1 = p3,
z       = p2,
d       = p0.
```

Then `C0`, `C1`, and `K1` are exact card-four rows omitting both `d` and `z`.
In particular, even a source-neutral strengthening to **two distinct common
deletions at the same three centers with identical rows** is geometrically
consistent.

This is not a full P97 counterexample.  The model deliberately does not encode:

- global K4 and deletion minimality;
- the assertion that `b0,b1` are the actual blockers of the two source points;
- first-apex and critical-frontier provenance of `d`;
- fully deletion-robust apex packets;
- the exact MEC/Moser-triangle construction identifying the displayed hull arc
  with `oppIndex2`.

Therefore the correct proof boundary is now precise:

> No valid terminal can depend only on the three exact rows, the two named A2
> classes, support intersection bounds, mutual source omission, one or two
> common deleted points, and strict convexity.  A closure theorem must consume
> actual-blocker/deletion-failure data, full seven-source provenance, or another
> genuinely global K4/minimality consequence.

## Source-backed strict-interior refinement

The current V2 record should retain the large-interior premise from which its
uncovered arm is produced.  Let

```text
I := (firstRow.support ∩ S.oppInterior2) ∪
     (secondRow.support ∩ S.oppInterior2),
```

with `5 ≤ I.card`, and let `C0,C1` be the two actual blocker rows.

There is an exhaustive reduction:

1. If either `Ci` contains at least three points of `I`, two of those three lie
   in one A2 radius class.  The same-radius pair localizes the blocker center
   into the strict cap, and
   `ATailCapInteriorEquidistant.false_of_capInterior_center_equidistant_three_points`
   gives `False`.
2. Otherwise each `Ci` contains at most two points of `I`, so at least one
   strict-interior class point is omitted by both rows.
3. Writing `U := I \ (C0.support ∪ C1.support)`:
   - if `2 ≤ U.card`, retain two distinct strict-interior common deletions;
   - if `U.card = 1`, then necessarily `I.card = 5`, both row traces in `I`
     have cardinality two, they are disjoint, and together with the unique
     uncovered point partition `I`.  The two A2 classes have interior sizes
     `3+2` or `2+3`.

A Lean-facing residual should therefore be no broader than:

```lean
inductive CardGeThirteenUncoveredInteriorOutcome ...
| twoDeletions
    (z0 z1 : ℝ²)
    (hz_ne : z0 ≠ z1)
    (hz0I : z0 ∈ I) (hz1I : z1 ∈ I)
    (hz0C0 : z0 ∉ C0.support) (hz0C1 : z0 ∉ C1.support)
    (hz1C0 : z1 ∉ C0.support) (hz1C1 : z1 ∉ C1.support)
    -- plus the named A2 row avoiding each deletion
| exactFiveInterior
    (z : ℝ²)
    (hIcard : I.card = 5)
    (hC0card : (C0.support ∩ I).card = 2)
    (hC1card : (C1.support ∩ I).card = 2)
    (htracesDisjoint : Disjoint (C0.support ∩ I) (C1.support ∩ I))
    (hpartition : I = (C0.support ∩ I) ∪ (C1.support ∩ I) ∪ {z})
    (hradiusProfile : ... = (3,2) ∨ ... = (2,3)).
```

The exact rational model realizes the second outcome with both blocker-row
pairs cross-radius.  Consequently that outcome also needs actual-blocker or
global provenance before it can be contradicted.

## Additional source route under audit

Since two card-four blocker rows have union cardinality at most eight and
`13 ≤ D.A.card`, the existing `SevenSourcesOutsideTwoShells` theorem supplies
five carrier points outside both rows.  A selected row at one such point cannot
contain all four of the other points as well as its own source, so one obtains a
deleted point with five distinct surviving centers:

```text
first apex, second apex, the two fixed blockers, and another actual blocker.
```

The deleted point's own actual blocker supplies a sixth center.  This route is
source-promising, but no contradiction should be claimed until the downstream
`FiveSurvivorExactRowsBoundary` / faithful-carrier consumer graph is checked.
Private-support abstract row systems show that a six-center packet without
additional positive incidence need not be contradictory.

## Highest-priority missing theorem

The missing theorem is no longer a generic three-row Kalmanson statement.  It
must be one of the following, stated with exact source provenance:

1. an actual-blocker/failure theorem converting the two-deletion three-center
   network into a positive cross-row occurrence;
2. a full-seven-good-source selector forcing an additional row or shared
   support in the uncovered branch;
3. a five-survivor/six-center theorem that uses deletion minimality—not merely
   five anonymous q-omitting rows—to force a checked geometric no-good.

Until one of these is proved, `false_of_cardGeThirteenUncoveredThreeCenterPacket`
should be marked **source-open/global-provenance terminal**, not local Euclidean
geometry.
