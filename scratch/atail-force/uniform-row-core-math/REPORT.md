# Uniform row-core analysis after the robust blocker trichotomy

Date: 2026-07-14

Status: **NO SINGLE UNAVOIDABLE MOTIF; ORDERED BANK CONSUMERS SUPERSEDE BOTH
NEW ALGEBRAIC CORES ON THE WITNESSES THAT PRODUCED THEM.**

## Verdict

The fixed `(5,5,5)` eleven-equality six-row core is not a uniform producer.
It has exactly one injective occurrence in the historical `(5,5,5)` shadow
and no occurrence in either the historical or freshly generated `(4,5,6)`
shadow.  Moreover, the current convex-five-point-reverse theorem already
excludes the historical `(5,5,5)` shadow.

The fresh `(4,5,6)` survivor initially exposed a second, dangerous-row-anchored
six-row core.  Singular over `QQ` proves that its fourteen displayed squared-
distance-difference generators form the unit ideal, and deleting any one of
the fourteen gives a nonunit ideal.  This is an externally exact algebraic
obstruction, not a Lean theorem.  It should remain a fallback: the existing
`SixPointTwoCircleArcOvertakeOrderCore` reverse consumer already excludes that
fresh survivor using cyclic order, and the next regenerated survivor is
excluded by the production `NestedEqualChordCore` consumer.

The useful emerging statement is therefore a **disjunctive ordered
classifier**, not another universal fixed metric motif:

```text
robust blocker branch
  -> existing ordered/equality core
   or endpoint-spending descent/continuation packet
   or genuinely new metric core
```

The first two alternatives must be scanned before mining or formalizing the
third.

## Required bank preflight

The three theorem-bank registries required by `AGENTS.md` and the indexed Lean
corpora were checked.  The old eleven-equality core has no match among the
formalized unordered metric families.  Indexed search recovers the existing
six-circle, collision-alternative, same-cap pushout, arc-overtake, and nested-
equal-chord consumers; none makes the old eleven-equality motif unavoidable.

The current full-row scan also matters.  The historical `(4,5,6)` shadow has
no match among the current 19 unordered metric families or the direct/reverse
ordered families.  This is consistent with the later result: its useful
structure lies in the one-way blocker/endpoint-spending continuation, not in
the old `(5,5,5)` algebraic core.

## Historical `(4,5,6)` one-way branch

For the historical shadow, the surplus cap is `[3,4,5,6,7]`, with opposite
apices `3` and `7`.  Taking `3` as the first apex gives first-apex marginal

```text
{0,10,11}.
```

The row at the second apex `7` contains `11` and omits `0,10`, so the relocated
pair is `{q,w}={0,10}`.  Its blockers are

```text
f(0)=1,  f(10)=3.
```

The blocker rows are

```text
row(1) = {0,3,6,9}
row(3) = {0,5,10,11}.
```

Thus the pair lies in the exact one-way/distinct-blocker arm:

```text
10 notin row(1),  0 in row(3),  1 != 3,
```

and the blocker of `w` is the first apex.  In cap `[0,1,2,3]`, the first
blocker edge `0 -> 1` spends endpoint `3`; the next blocker edge `1 -> 2`
spends the same endpoint, while `2 -> 0` closes the blocker cycle without an
endpoint incidence.  The existing same-cap pushout theorem orders the first
two edges, but does not contradict the final return.  A uniform endpoint route
therefore still needs the cross-cap/lap or rank-drop continuation after the
spent-endpoint prefix.  The first edge alone is only a normal form.

## Exact fallback core from the fresh `(4,5,6)` survivor

Use nine roles

```text
P=0, C=4, Q=5, X=8, Y=9, Z=11, B=1, A=3, U=2.
```

The six selected rows supply:

```text
P : {B,A,C,Q}
C : {B,Q,Z}
Q : {P,B,Y}
X : {P,A,Y}
Y : {P,C,X}
Z : {U,A,X,Y}.
```

Equivalently, the fourteen equalities are

```text
PB=PA=PC=PQ
CB=CQ=CZ
QP=QB=QY
XP=XA=XY
YP=YC=YX
ZU=ZA=ZX=ZY.
```

After normalizing `C=(0,0)` and `P=(1,0)`, their polynomial ideal is the unit
ideal over `QQ`.  Hence the coordinate-free theorem shape is:

```lean
theorem nine_point_six_circle_collision (...) : P = C
```

For the live dangerous labels, `P=p`, `C=t3`, `Q=q`, `B=t2`, `A=t1`, and
`U=u`; `hbase` supplies `p != t3`.  The dangerous `p`-row already gives the
first three equalities, so a future reuse would need selected global rows at
`t3`, `q`, and three auxiliary centers.  Global K4 can choose such selected
four-classes, but no current live producer forces these particular
memberships.

This motif is rigid in the fresh shadow and absent from both historical
shadows.  Its algebra is useful fallback evidence, but the existing reverse
arc-overtake order theorem is strictly preferable on the survivor that exposed
it.

## Recommended producer architecture

After `CriticalPairFrontier`, retain the exact trichotomy already proved in
production:

1. mutual cross membership/common blocker;
2. exactly one cross membership/distinct blockers; or
3. reciprocal cross omissions/distinct blockers.

For each arm, add the actual cyclic cap positions and scan in this order:

1. current production ordered cores, including arc-overtake and nested equal
   chord;
2. same-cap endpoint-spending edge production followed by the already-proved
   pushout, with an explicit continuation/lap alternative;
3. only then a compact equality-ideal detector and certificate.

The fixed finite searches do not yet prove this classifier for all card-at-
least-12 carriers.  A card-12 enumeration also does not automatically cover
larger carriers: selected row supports can escape any chosen 12-label frame.
An honest uniform statement must therefore include a row-escape alternative,
or prove a closed 12-label extraction before invoking a finite classifier.

## Replay

From the repository root:

```bash
UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run python \
  scratch/atail-force/uniform-row-core-math/analyze.py --check
```

The checker verifies the three motif occurrence counts, the fresh fourteen-
equality `UNIT` result over `QQ`, and `NONUNIT` after each single-generator
deletion.  `UNIT`/`NONUNIT` here are exact CAS ideal results; they are not
kernel-checked Lean claims, and `NONUNIT` is not a real-realizability witness.
