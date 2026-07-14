# Round-28 `(5,5,5)` six-point circle-overtake analysis

## Verdict

**PROVEN (exact Euclidean argument; not yet Lean-checked).**  The round-28
residual is incompatible with its strict cyclic order.  In fact, the
obstruction is substantially smaller than the nine-label surface suggested by
the five complete rows.  It uses only

```text
(O,A,C,D,E,F) = (0,1,2,3,4,5),
```

the three rows centered at `O`, `A`, and `D`, and the cyclic subsequence

```text
O,A,D,E,F,C.
```

The exact metric hypotheses are

```text
OA = OC = AC = OD = OE,
DA = DE = DF.
```

They force a contradiction with the seven positive orientations inherited
from that cyclic subsequence.  No equality involving `U=6`, `V=7`, `W=8`, no
row centered at `C` or `E`, and no exact-row exclusion is needed.

**NOT YET KERNEL-CHECKED.**  This report gives a division-free polynomial
proof intended for a small normalized Lean core.  At this checkpoint there is
no Lean implementation, carrier adapter, matcher, or regression for this new
six-point family.

## Provenance and pinned temporary residual

The input to this analysis was explicitly a **temporary matcher replay**, not
an immutable saved-checkpoint claim.  The handed-off replay residual was

```text
profile: (5,5,5)
temporary replay round: 28
rows:
  0:{1,2,3,4}
  1:{0,2,6,7}
  2:{3,8,9,10}
  3:{1,4,5,6}
  4:{5,7,8,11}
hull order:
  (0,9,10,11,1,3,4,5,2,6,7,8)
```

No saved-checkpoint hash was part of that handoff, so none is promoted here
as the provenance of the result.  During this concurrent analysis the shared
`common_system_metric_probe.json` advanced and came to contain the same row
set as its round 28.  That later concurrent write is corroboration of the row
transcription, not the original pin used by this report.

## Required theorem-bank preflight

Before deriving the core, the following required registries and their JSON
companions were inspected:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

The indexed Lean corpus was searched for, among other formulations,

```text
qcritical_equilateral_bridge_incompatibility
u5_common_bisector_triple_incompatibility
equilateral shared-radius common-bisector metric kernels
two-circle common intersections with convex cyclic order
nested equal chords and circle crossing
OA=OC=AC=OD=OE and DA=DE=DF
```

The searches recovered the current U5 class-level consumers, the direct U5
metric kernels, `TwoCircleCrossing`, and the existing Census-554 order cores.
They did not recover the six-point metric/order surface above.

### Exhaustive direct-metric unification

**EMPIRICALLY VERIFIED, EXHAUSTIVE WITHIN THE DECLARED REGISTRIES AND
UNIFICATION MODEL.**  An in-memory constraint-unification pass tested all
`131` non-packet sibling declarations classified
`metric-point-uniform` with conclusion `False`.  For each theorem it parsed

- every `dist x y = r` radius equation;
- every `dist x y = dist u v` edge-class equation;
- positive-radius and positive-distance hypotheses;
- explicit point inequalities; and
- the one exact-row off-radius hypothesis in this inventory.

Role repetition was allowed unless the theorem itself forbade it.  Radius and
edge equations were checked in the undirected transitive edge quotient of the
five exact rows.  Off-radius facts were accepted only when supplied by one of
the five exact rows (or by zero distance against a known positive radius).
The result was:

```text
direct surfaces tested: 131
exact embeddings:        0
search timeouts:          0
maximum CSP nodes:        4,083
```

The two structured `MetricPacket.incompatibility` wrappers reduce to direct
metric surfaces in that same zero-hit inventory.  The two legacy JSON
registries each expose only the same three Radon eliminators as direct
metric-point contradiction consumers.  Their first unavailable antecedent is
a convex-hull intersection/segment packet, not any row-distance equality.

This is an exhaustive negative result for the listed declarations and this
hypothesis-unification model.  It is not a claim that no future composition of
bank lemmas can help.

### Named bank near-hits and first missing antecedents

`U5QCriticalTripleClass.qcritical_equilateral_bridge_incompatibility` is a
class-level consumer, not a direct metric surface.  The temporary residual
produces no `CounterexampleData`, `U5DangerousTriple`,
`U5SelectedCandidateSkeleton`, or `U5Q*Class` witness.  Its first typed
antecedent already unavailable here is

```text
htriple : U5DangerousTriple D q p T.
```

Erasing the class vocabulary does not reveal a hidden metric embedding: the
proof needs two distinct centered circles with three common points `p,a,x`.
The round-28 equality quotient has no pair of centers with three common
equal-radius points.

The same issue blocks `u5_common_bisector_triple_incompatibility`.  Its first
unavailable typed producer is

```text
Kx : U5QDeletedK4Class D q x Bx,
```

and equality-side erasure still needs three points simultaneously on the
`p`- and `x`-centered circles.  Exhaustive enumeration of the quotient finds
only one two-center/two-common-point pair,

```text
centers (1,4), common points (0,3),
```

and no pair with a third common point.

Among the already formalized order cores, the closest statement is
`SixPointNestedCenterOrderCore.metric_orientation_incompatibility`, under

```text
(O,A,D,E,X,C) = (0,1,3,4,5,2).
```

All of its base and `D`-circle equalities are present, but its first missing
antecedent is exactly

```text
EO = EX,  i.e.  EO = EF.
```

Round 28 supplies `EF = EV = EW`, not `EF = EO`.  The new proof below removes
that unnecessary extra circle equality by using the order of `E,F,C`
directly.

## Exact three-row core

Only nine support memberships are used:

```text
A,C,D,E in row(O),
O,C     in row(A),
A,E,F   in row(D).
```

They yield

```text
OA = OC = OD = OE,
AO = AC,
DA = DE = DF.
```

Symmetry of distance combines the first two lines into
`OA = OC = AC = OD = OE`.  Injectivity of the convex-boundary realization
supplies `O != A` and all other distinctness needed for strict orientation.

The selected hull order restricts to `O,A,D,E,F,C`.  A positive-orientation
form of the metric theorem may consume

```text
OAC, OAD, OAE, ODE, OEC, OEF, EFC > 0.
```

If the production boundary convention supplies all seven signs negatively,
reflect the realization across the x-axis once, exactly as in the existing
Census-554 order cores.

## Division-free normalized proof

Apply the orientation-preserving similarity sending

```text
O -> (0,0),  A -> (1,0).
```

Write

```text
C = (1/2,h),
D = (x,y),
E = (w,z),
F = (r,s).
```

The equilateral base and the first three signs give

```text
h^2 = 3/4,  h > 0,
x^2+y^2 = 1,  y > 0,
w^2+z^2 = 1,  z > 0.
```

### Reflecting `A` to `E` across the `OD` radius

Squaring `DA = DE` and using the two unit equations gives

```text
x*w + y*z = x.
```

Let

```text
k = x*z - y*w = cross(D,E).
```

The Lagrange identity gives `k^2 = y^2`; `ODE > 0` and `y > 0`
select `k=y`.  Resolving `E` in the orthonormal basis generated by `D`
therefore yields

```text
w = x^2-y^2,
z = 2*x*y.
```

Since `z>0` and `y>0`, we have `x>0`.  The unit equation and `y>0` also give
`x<1`.  Hence

```text
y^2 - (1-x)^2 = 2*x*(1-x) > 0,
```

so, with both sides positive,

```text
y > 1-x.                                      (1)
```

### Coordinates of `C` in the `E` basis

Define

```text
a = w/2 + z*h       = dot(E,C),
b = w*h - z/2       = cross(E,C).
```

The sign `OEC > 0` is exactly `b>0`.  It also implies
`w*h > z/2 > 0`, hence `w>0`; consequently `a>0`.  Because `C` and `E`
are unit vectors, Lagrange gives

```text
a^2+b^2 = 1.
```

Thus `a<1`, and

```text
b^2 - (1-a)^2 = 2*a*(1-a) > 0.
```

Both quantities being positive, this implies

```text
b > 1-a.                                      (2)
```

### Coordinates of `F` in the `E` basis

Define

```text
alpha = w*r + z*s   = dot(E,F),
beta  = w*s - z*r   = cross(E,F),
u     = 1-alpha.
```

The sign `OEF > 0` is `beta>0`.  Expressing `DF = DE` in this basis gives the
exact polynomial identity

```text
u^2 + beta^2 + 2*y*beta = 2*(1-x)*u.          (3)
```

The left side is strictly positive, so `(3)` and `1-x>0` imply `u>0`.
Moreover,

```text
(1-x)*u > y*beta > (1-x)*beta
```

by `(1)`.  Therefore

```text
u > beta.                                     (4)
```

Finally, in the `E` basis,

```text
signedArea2 E F C = beta*(1-a) - u*b.
```

But `(2)` and `(4)`, with all four factors positive, give

```text
u*b > beta*(1-a),
```

whereas the cyclic-order sign `EFC>0` says the strict reverse.  This is the
required contradiction.

Every step is polynomial after normalization.  The anticipated Lean proof
needs only `ring`, `nlinarith`, positivity of squared distances, and the same
`normSim`/reflection helpers already used by the neighboring order cores.

## General pattern and replay consequence

The new theorem is not round-specific.  A suitable public name is, for
example,

```text
SixPointTwoCircleArcOvertakeOrderCore.metric_orientation_incompatibility
```

with abstract statement:

> Six distinct points in cyclic order `O,A,D,E,F,C` cannot satisfy
> `OA=OC=AC=OD=OE` and `DA=DE=DF`.

This is the general pattern emerging from the current census: the `O`- and
`D`-centered circles meet at `A,E`; the `D`-circle cannot place its next point
`F` ahead of `E` but before the equilateral outer point `C` in strict convex
order.

The shared saved replay currently shows the same `O`-, `A`-, and `D`-rows in
every `(5,5,5)` round from `10` through `28`.  Therefore this one monotone
three-row matcher would recognize all `19` of those recorded residuals,
including the temporary round-28 target.  Earlier accepted cuts remain valid,
but this core explains them as refinements of one more general order
obstruction and should make the next regeneration jump past the entire known
round-10--28 block.

That replay consequence is **EMPIRICALLY VERIFIED on the currently recorded
rounds**, not a completeness claim about all future rounds.  A fresh residual
after registering the cut may alter one of the three shared rows and expose a
new family.

## Lean handoff

The smallest implementation route is:

1. Add a scratch metric theorem with `O != A`, the six independent distance
   equalities, and the seven positive orientations above.
2. Package a generic `EqualityCore.Core` containing six labels, one
   distinctness field, and the six required `EdgeClosure` fields.
3. Add positive and reflected-negative consumers.
4. Add a carrier adapter extracting the `O,A,D,E,F,C` subsequence from strict
   boundary order.
5. Register the matcher after the older families, minimize its accepted cut
   to rows `0,1,3`, and replay from the last immutable checkpoint.
6. Require a narrow Lean build, source scan, and axiom audit before upgrading
   this report's status to kernel-checked.

No new `sorry` or custom axiom is justified by this analysis.
