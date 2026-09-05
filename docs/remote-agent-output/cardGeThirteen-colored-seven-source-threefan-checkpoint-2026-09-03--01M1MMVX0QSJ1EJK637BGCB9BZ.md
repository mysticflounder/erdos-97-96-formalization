# `cardGeThirteen`: colored seven-source / three-fan checkpoint

Date: 2026-09-03

Target:

```lean
Problem97.ATailFrontierLiveClosure.
  false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen
```

## 1. Source count now available

For `G := goodOutsideSources R` and `B := badOutsideSources R`, current source proves

```text
D.A.card = G.card + B.card + 4,
B.card <= 2.
```

Hence

```text
D.A.card <= G.card + 6.
```

The live hypothesis `12 < D.A.card` gives `7 <= G.card`.
The deletion universe in `goodOutsideSources` is the frontier pair
`{F.pair.q, F.pair.w}`, not `{R.interior_q, R.interior_w}`.

## 2. Exact colored seven-source classification

For each actual blocker fiber `F_b` among seven chosen good sources, let `C_b`
be its common selected support and define the literal omission set

```text
O_b := {F.pair.q, F.pair.w} \\ C_b.
```

Source facts are:

- `C_b.card = 4`;
- `F_b subset C_b`;
- `F_b.card <= 4`;
- distinct blocker rows intersect in at most two points;
- `O_b` is nonempty;
- equal blockers give equal supports and hence equal omission sets;
- `F.pair.q` and `F.pair.w` are not good sources.

The desired occurrence is a pair in distinct blocker fibers, sharing an omitted
frontier point, and mutually omitted from one another's rows.

The literal finite classifier has one residual orbit. Every blocker fiber is a
singleton. With `q=7`, `w=8`, the rows can be labelled:

```text
O0=O1={q};  C0={0,1,4,w}; C1={1,5,6,w}
O2=O3={w};  C2={2,3,5,q}; C3={3,4,6,q}
O4=O5=O6={q,w};
C4={1,2,4,5}; C5={0,3,5,6}; C6={0,2,4,6}.
```

It satisfies row-cardinality, own-source membership, every row-intersection
bound, and pair-codegree at most two. Its only mutually omitted source pairs are
`(0,2),(0,3),(1,2),(1,3)`, and each has complementary omission sets. Thus this
orbit is the exact obstruction to obtaining a mutual-omission/common-deletion
pair by incidence counting alone.

## 3. Three-fan hidden in the residual

Rows `C0,C1,C4` form the following pattern. Put

```text
A=1, B=w, C=4, D=5,
X=blocker(0), Y=blocker(1), Z=blocker(4).
```

Then

```text
X is equidistant from A,B,C,
Y is equidistant from A,B,D,
Z is equidistant from A,C,D.
```

Equivalently, `B,C,D` are the reflections of `A` across the three side-lines
`XY,XZ,YZ`.

The rows share the pairs

```text
X/Y share {A,B},
X/Z share {A,C},
Y/Z share {A,D}.
```

The source-clean shared-pair separation theorem therefore gives

```text
sep(A,B;X,Y), sep(A,C;X,Z), sep(A,D;Y,Z).
```

Because centers are distinct and each center is absent from its own row, the
only possible cross aliases are

```text
X=D, Y=C, Z=B.
```

## 4. Finite cyclic-order reduction

An exact enumeration of cyclic orders gives:

- all seven roles distinct: the three separation facts leave exactly two
  orbits under reversal and the natural `S3` action on `X,Y,Z`, represented by

  ```text
  A,X,B,C,Y,D,Z                    (exceptional scalar orbit)
  A,X,B,C,Z,D,Y                    (Kalmanson orbit)
  ```

- exactly one cross alias, say `X=D`: the remaining six distinct roles are
  forced, up to reversal, to

  ```text
  A,Y,B,D,C,Z;
  ```

- two or more cross aliases are inconsistent with the three separation facts.

Thus a 360-order certificate bank is unnecessary. A tiny finite separation
classifier plus two scalar terminals suffices.

## 5. Two-Kalmanson terminal for the second all-distinct orbit

For cyclic order

```text
A < X < B < C < Z < D < Y,
```

strict Kalmanson on `(A,B,Z,Y)` gives

```text
d(A,Z)+d(B,Y) > d(A,Y)+d(B,Z).
```

Since `Y` is equidistant from `A,B`, this reduces to

```text
d(A,Z) > d(B,Z).
```

Strict Kalmanson on `(X,B,C,Z)` gives

```text
d(X,C)+d(B,Z) > d(X,B)+d(C,Z).
```

Since `X` is equidistant from `B,C` and `Z` from `A,C`, this reduces to

```text
d(B,Z) > d(A,Z),
```

contradiction.

## 6. Exceptional all-distinct scalar terminal

For the orbit

```text
A,X,B,C,Y,D,Z,
```

an exact scalar proof has been implemented in an uncommitted source-clean Luna
file:

```text
lean/Erdos9796Proof/P97/Census554/
  SevenPointThreeFanCanonicalExceptional.lean
```

The proposed theorem is

```lean
Problem97.Census554.EqualityCore.
  false_of_threeFan_canonical_exceptional_order_scalar
```

and its direct axiom audit reports only
`propext`, `Classical.choice`, and `Quot.sound`.

## 7. Exactly-one-alias scalar terminal

Take `X=D` and the forced clockwise order

```text
A,Y,B,D,C,Z.
```

Normalize

```text
D=(0,0), Z=(1,0), A=(a,-h), h>0.
```

The distance equalities imply

```text
C=(a,h),
h^2=a(2-a),
Y=(u,v),
au-hv=a,
B=(2a/(u^2+v^2))*(u,v)-(a,-h).
```

The consecutive orientation signs yield

```text
0<a<1,
0<u<1,
2u<a,
u^2+v^2>a.
```

After eliminating `v` and `h^2`,

```text
u^2+v^2-a = a*f/h^2,
f = 2u^2-2au+a^2-a
  = 2u(u-a)+a(a-1).
```

The distance inequality gives `f>0`, while `0<u<a/2<a` and `0<a<1` make both
summands negative, so `f<0`, contradiction.

This covers the other single aliases by the natural symmetry.

## 8. Consequence for the seven-good-source route

Once the finite classifier, source adapter, separation classifier, and the two
scalar/Kalmanson terminals are wired, the unique colored residual is impossible.
Therefore seven good sources force:

```text
there exist distinct good sources s,t,
with distinct actual blockers,
mutually omitted from one another's rows,
and a common d in {F.pair.q,F.pair.w}
omitted from both rows.
```

This is a source-native occurrence theorem, not a wrapper. It is the kind of
refactor recommended by the current spine audit.

## 9. Next exact split after the occurrence theorem

Overlay the pair with the two full disjoint four-point classes at `S.oppApex2`.
For each class `K`, both actual rows meet `K` in at most two points. Hence either:

1. some `z` in the union of the two classes is omitted from both actual rows;
   then the same three centers `blocker(s), blocker(t), S.oppApex2` survive both
   deletions `d` and `z`; or
2. each class is exactly partitioned `2+2` by the two rows. Globally the two
   blocker rows are disjoint card-four supports contained in the eight class
   points, each taking two points from each radius. In particular the selected
   sources themselves lie in the two A2 classes.

The second branch should immediately be split by the already source-audited
`largeInterior-or-grid` theorem. Preliminary exact LP checks show that the bare
grid plus four-row equalities has Kalmanson/triangle survivors, so the final
terminal must use the retained deletion, actual-blocker provenance, or stronger
cap data; order inequalities alone are not expected to suffice.

## 10. Refactor alignment

The spine audit warns against wrapper-only progress and identifies source-native
occurrence as the reusable bottleneck. This checkpoint follows that advice:

- the count theorem is generic and belongs above the radius split;
- the colored seven-source classifier is a low finite kernel;
- the three-fan theorem is a pure geometric kernel;
- only the final adapter mentions the live `cardGeThirteen` packet;
- no subcarrier inheritance, exact-card overclaim, solver axiom, or new sorry is
  used.
