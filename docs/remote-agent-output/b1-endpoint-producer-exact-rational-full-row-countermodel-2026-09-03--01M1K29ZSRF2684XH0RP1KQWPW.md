# B1 endpoint producer: exact rational full-row countermodel checkpoint

## Scope

This checkpoint records an exact rational Euclidean realization showing that the proposed B1 endpoint producer cannot follow from the following package alone:

- strict convex independence;
- one six-point physical radius class centered at the physical apex;
- three disjoint physical pairs;
- three distinct blocker centers;
- three completed exact four-point blocker rows, one through each physical pair;
- exact row-fiber identities, with no accidental extra hits among the carrier points;
- a direct zero-cut cap-block order;
- one winning source in the strict second-cap interval with its mate in an adjacent interval;
- every blocker linearly between the endpoints of its physical pair; and
- failure of every corresponding same-boundary-arc bit.

It is **not** a full inhabitant of `B1GlobalTransportContext`: the `SurplusCapPacket`/MEC provenance and the critical-shell deletion/minimality semantics are not encoded.

## Rational unit-circle points

Let the physical apex be

```text
A = (0,0).
```

For a rational parameter `t`, put

```text
U(t) = ((1-t^2)/(1+t^2), 2t/(1+t^2)).
```

Define six physical points `x0,...,x5` by

```text
t0 = -9399/8933
t1 = -3668/9447
t2 = -2542/8071
t3 = -1813/9335
t4 =  6246/9619
t5 =  2158/3219
xi = U(ti).
```

Then `dist(A,xi)^2 = 1` for every `i=0,...,5`.

## Three blocker centers and physical pairing

Use the nonlocal pairing

```text
row 0: (x0,x1)
row 1: (x2,x5)
row 2: (x3,x4).
```

Define

```text
b0 = (2151/4273)   * (x0+x1)
b1 = (30821/48730) * (x2+x5)
b2 = (47375/86651) * (x3+x4).
```

Because every `bi` lies on the perpendicular bisector of its paired unit-circle chord, it is exactly equidistant from the two named physical endpoints.

## Rational completion points

For a rational center `(h,k)`, a rational base point `(x0,y0)` on its circle, and a rational line slope `m`, the second intersection of that line with the circle is obtained by

```text
tline = -2*((x0-h) + m*(y0-k))/(1+m^2),
point = (x0+tline, y0+m*tline).
```

Use the first endpoint of each physical pair as base and the following slopes:

```text
row 0 completions c00,c01:
  -2459380/85719
  -158749/47297

row 1 completions c10,c11:
  -193027/85341
  -101356/54435

row 2 completions c20,c21:
  -97639/89953
  -27814/37689.
```

The three exact rows are therefore

```text
{ x0, x1, c00, c01 } centered at b0,
{ x2, x5, c10, c11 } centered at b1,
{ x3, x4, c20, c21 } centered at b2.
```

## Exact strict-convex order of the 16-point row core

The order

```text
A,c00,c01,x0,b0,x1,x2,x3,b1,b2,x4,x5,c10,c11,c20,c21
```

is strictly counterclockwise in the strong all-triples sense: every one of the `choose(16,3)=560` ordered orientation determinants is positive.

The exact minimum is

```text
2067811124574768701737895294125233001373985528572686720969
-------------------------------------------------------------------------
395012525333806457941112778986010663310853398201298587488985
```

approximately `0.005234798878408625`.

## Adding direct cap-order markers

For a directed edge `p -> q`, define a rational outward perturbation

```text
Out(p,q) = midpoint(p,q) + (1/10000)*(q.y-p.y, -(q.x-p.x)).
```

Set

```text
s  = Out(A,c00),
o1 = Out(x4,x5).
```

Explicitly,

```text
s = (
 -67994921167415071902313114837522523 /
  2234201068109756914054720830264050000,
 -398893336835777941375209878492039329 /
  1117100534054878457027360415132025000
)

o1 = (
 485665316869677888 / 1234721565960765625,
 1135053967089948416 / 1234721565960765625
).
```

Then the 18-point order

```text
A,s,c00,c01,x0,b0,x1,x2,x3,b1,b2,x4,o1,x5,c10,c11,c20,c21
```

is again strictly counterclockwise in the all-triples sense: all `choose(18,3)=816` determinants are positive. The exact minimum is

```text
106252529296 / 1234721565960765625
```

approximately `8.605383774383371e-8`.

Rotating the order to the zero cut gives

```text
s < c00 < c01 < x0 < b0 < x1 < x2 < x3 < b1 < b2
  < x4 < o1 < x5 < c10 < c11 < c20 < c21 < A.
```

Thus `s < o1 < A` has the direct-block form. The strict interval `(s,o1)` contains exactly five physical points `x0,x1,x2,x3,x4`. Choose the winning row-1 source `x2`; its mate `x5` lies in the adjacent interval `(o1,A)`.

## Exact radius-fiber audit over all 18 carrier points

There are no accidental extra equal-radius hits:

```text
A, radius^2 1:
  exactly {x0,x1,x2,x3,x4,x5}

b0, its chosen radius:
  exactly {x0,x1,c00,c01}

b1, its chosen radius:
  exactly {x2,x5,c10,c11}

b2, its chosen radius:
  exactly {x3,x4,c20,c21}.
```

The exact squared row radii are

```text
b0:
28662016819299575495849 / 157643698548513311114165

b1:
406561325479762444911184 / 638412991052772454165625

b2:
21741297130395620291272369 / 44655606299473673716561369.
```

## Endpoint-order consequences

In the rotated zero-cut order:

```text
x0 < b0 < x1,
x2 < b1 < x5,
x3 < b2 < x4.
```

For each row the physical apex `A` lies outside that endpoint interval, so the production-style `separatedPair A bi left right` relation holds. The exchanged separation holds as well. The two endpoint bits across the cut `(A,bi)` differ, so the corresponding same-boundary-arc predicate fails for every pair.

The winning row-1 mate `x5` is outside the strict `(s,o1)` cap interior and lies in the adjacent `(o1,A)` interval.

## Consequence

Any valid proof of the proposed endpoint producer must use information not represented here. In particular, it cannot be obtained from convex independence, the exact six-point physical class, three exact completed selected rows, direct/mirror boundary blocks, cap counting, blocker localization, or endpoint `btw`/`separatedPair` facts alone.

The first remaining candidate inputs are the genuinely global `SurplusCapPacket`/MEC provenance and the `OriginalUniqueFourResidual`/critical-shell deletion-minimality package: retained q/w survival, outside-first-apex-fiber information, reverse-hit/source-return provenance, no-qfree consequences, or another source-faithful cross-row/deletion incidence.
