# Round-20 `(5,5,5)` split-bridge kernel analysis

## Verdict

**PROVEN (exact Euclidean argument, not yet Lean-kernel checked).**  The
round-20 residual contains a seven-label, five-row subconfiguration that is
incompatible with the saved cyclic order.  It is not another placement of the
round-17 circle-chain point: the last row has split that point into two bridge
labels.  The exact new core is

```text
(O,A,C,D,E,U,W) = (0,1,2,3,4,6,8)
```

with

```text
OA = OC = AC = OD = OE,
DA = DE = DU,
AO = AU,
CD = CW,
EA = EW,
```

and the four positive orientations `OAC`, `OAD`, `OAE`, `OEC`.  Those four
signs are consequences of the cyclic subsequence `O,A,D,E,C` (up to the
repository-wide reflected-sign consumer).

The contradiction uses only these nine distance equalities and four signs.
The other round-20 labels and exact-row exclusions are irrelevant.

**PROVEN NEGATIVE for the U5 Gram route.**  Homogeneous row equalities plus
all planar Gram-determinant facts do **not** admit a positive-norm certificate
of the U5 kind.  There is an explicit real planar equality realization with
positive base norm when the cyclic order is omitted.  Consequently, no sound
certificate whose target is a nonzero nonnegative polynomial in anchor-norm
variables can lie in that equality ideal.  The order signs are essential.

**CONJECTURED / UNVALIDATED.**  The generic Lean theorem, reflected consumer,
`EdgeClosure` wrapper, round-20 carrier adapter, and CEGAR matcher described
below have not been written or elaborated.  No Lean or Lake command was run in
this lane.

## Pinned checkpoint

- checkpoint: `scratch/atail-force/common_system_metric_probe.json`;
- checkpoint SHA-256:
  `6fa370d48226b2f8aab571e9f3bda97a5ed0c1baa9a2caa1be5da971a3b8f426`;
- profile: `(5,5,5)` / `CARD-EQ-12`;
- round: `20`;
- assignment SHA-256:
  `cf430fcdcb5a0f3747822381083882cdc3900f225fb86d32c7807f5704c02a67`;
- rows:

  ```text
  0:{1,2,3,4}
  1:{0,2,6,7}
  2:{3,8,9,10}
  3:{1,4,5,6}
  4:{1,7,8,11}
  ```

- saved hull order:

  ```text
  (0,9,10,11,1,3,4,5,2,6,7,8).
  ```

`common_system_metric_probe.py --check` replayed the checkpoint from round 0
through round 20 and passed.  Its exhaustive current formalized-core scan
returns no core at round 20.

## Theorem-bank and indexed-search preflight

The required registries were checked before deriving the new core:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed `nthdegree docs search --lean` searches covered:

```text
seven point two bridge equal-distance circles convex cyclic order
*circle*order* / shared points equal radius convex
signedArea2 / equal distance circle bridge cyclic order
five circle unit distance configuration convex polygon obstruction
Gram certificate planar determinant positive norm row equidistance
```

The searches recovered the production six-point order cores, the current and
sibling U5 Gram checker/soundness modules, the generic planar Gram determinant,
and unrelated chord/Radon reserves.  They found no theorem with the round-20
split-bridge surface.

The live `_formalized_metric_core(..., include_extended=True,
include_ordered=True)` scan already checks every currently registered
equality-only family (including all six/seven/eight-point five-circle, both
seven-point six-circle, twin-four-circle, orbit, circle-network, and
circle-chain families), both directions of the older order cores, and the
available MEC core.  Its null result therefore agrees with the manual bank
inspection.

### Why the old circle-chain cores do not embed

Rounds 17--19 had one label `Y` with both

```text
EA = EC = EY     and     CD = CY.
```

Round 20 drops `EC` and splits the incidence into two labels:

```text
U=6:  AU = AO and DU = DA,
W=8:  CW = CD and EW = EA.
```

There is no label supplying both `EY` and `CY`, so neither
`SixPointCircleChainOrderCore` nor `SixPointCircleChainWrapOrderCore` is
applicable.  Pretending otherwise would omit an antecedent and would be
circular.

## Why a generalized U5 positive-Gram certificate cannot close round 20

The sibling U5 checker uses vectors from one anchor, homogeneous linear row
facts, every planar `3 x 3` Gram determinant, and a target with nonnegative
coefficients supported only on squared norms.  At least one target monomial
must use norms already known strictly positive.  Its soundness theorem then
shows that a checked identity would make the target both zero and positive.

The sparse-polynomial engine in
`lean/Erdos9796Proof/P97/U5GramCertPoly.lean` is generic, but the sibling fact
builder and soundness layer are hard-coded to `Fin 8`, six selected rows, and
the U5 base labels.  Generalizing the indexing to `Fin 12` would be routine
engineering.  It would not help this residual, because the required
certificate does not exist.

Here is a real equality realization.  Put

```text
O = (0,0),
A = (1,0),
C = (1/2, sqrt(3)/2),
D = (0,1),
E = (-1,0).
```

Then `OA=OC=OD=OE=AC=1` and `DA=DE=sqrt(2)`.  Let

```text
U = ((3+sqrt(7))/4, (1+sqrt(7))/4),
V = (3/4, sqrt(15)/4).
```

Direct expansion gives

```text
AU = 1,       DU = sqrt(2),
AV = 1,       EV = 2.
```

Write `s = sqrt(2-sqrt(3)) = CD`.  The circle centered at `C` of radius
`s` and the circle centered at `E` of radius `2=EA` meet, because their
center distance is `CE=sqrt(3)` and

```text
|2-s| < sqrt(3) < 2+s.
```

Choose either intersection as `W`.  Choose one further point on the
`D`-circle of radius `sqrt(2)`, two further points on the `C`-circle of
radius `s`, and one further point on the `E`-circle of radius `2`; the circles
are infinite, so these may be chosen away from the finitely many existing
labels.  Assign them to labels `5`, `9`, `10`, and `11`, respectively.  This
realizes all five round-20 row-equality families with distinct labels and
positive base norm.  It deliberately has the wrong cyclic order (`C` occurs
before `D` and `E`).

Every planar Gram determinant vanishes for an actual planar realization.
Thus this witness satisfies exactly the homogeneous facts a generalized U5
fact table would contain.  Any positive-norm target evaluates strictly
positively here, so it cannot be an ideal combination of those zero facts.
This is a mathematical nonexistence result for that certificate shape, not a
failure of a bounded generator search.

A reusable Gram theorem would therefore need a richer ordered
Positivstellensatz interface (signed-area inequalities and nonnegative
multipliers), not merely a larger `Fin n` version of `u5GramCertChecker`.
That is substantially heavier than the direct order proof below.

## Exact split-bridge contradiction

Normalize by the similarity sending `O` to `(0,0)` and `A` to `(1,0)`.
Write

```text
C = (1/2,h),
D = (x,y),
E = (w,z).
```

The equilateral equalities and `OAC>0` give

```text
h^2 = 3/4,   h > 0.
```

The `O`-row and `OAD,OAE>0` give

```text
x^2+y^2 = 1,
w^2+z^2 = 1,
y > 0,
z > 0.
```

### The `D`-bisector branch

The equality `DA=DE` reduces to

```text
x = x*w + y*z.
```

Together with the two unit equations, the alternatives are `E=A` or the
reflection of `A` across the `O-D` line.  The first has `z=0` and is excluded
by `OAE>0`.  Hence

```text
w = 2*x^2 - 1,
z = 2*x*y.
```

For a division-free derivation, first obtain

```text
x*(1-w) = y*z,
z^2 = (1-w)*(1+w),
z*(x*z-y*(1+w)) = 0;
```

then use `z>0` and solve the resulting two linear dot/cross equations.

The sign `OEC>0` becomes

```text
h*(2*x^2-1) - x*y > 0,
```

or, using `x^2+y^2=1`,

```text
h*(x^2-y^2) > x*y.                      (1)
```

Since `y,z>0` and `z=2xy`, both `x` and `y` are positive.  Equation (1)
also gives `x^2>y^2`.

Now suppose `x <= h`.  Then `y^2 >= 1/4`, while `x^2>y^2` gives
`y^2<1/2`.  Squaring the two positive sides of (1) would give

```text
h^2*(x^2-y^2)^2 - x^2*y^2 > 0.
```

Exact reduction by `x^2+y^2=1` and `h^2=3/4` gives instead

```text
((4*y^2-1)*(4*y^2-3))/4,
```

which is nonpositive for `1/4 <= y^2 < 1/2`.  Therefore

```text
x > h.                                           (2)
```

### The first bridge forces `D` close to the `30`-degree boundary

From `AU=AO=1` and `DU=DA`, the triangle inequality in triangle `A,D,U`
gives

```text
1 = AU <= AD+DU = 2*AD.
```

Since `AD^2=2-2*x`, this implies

```text
x <= 7/8.                                        (3)
```

Combining (2), (3), and `x^2+y^2=1` yields

```text
y^2 >= 15/64,
y > 12/25,
```

where the exact margin is

```text
15/64 - (12/25)^2 = 159/40000 > 0.               (4)
```

### The second bridge violates the triangle inequality

The normalized distances satisfy

```text
EA^2 = 4*y^2,
CD^2 = 2-x-2*h*y,
CE^2 = 2-w-2*h*z.
```

Equation (4) gives

```text
EA > 24/25.                                      (5)
```

Also

```text
h > 41/49
```

because

```text
h^2 - (41/49)^2 = 479/9604 > 0.
```

Using `x>h` and `y>12/25` in the formula for `CD^2` gives

```text
x+2*h*y > h+24*h/25 = 49*h/25 > 41/25,
CD^2 < 9/25,
CD < 3/5.                                        (6)
```

Likewise `w=2*x^2-1>1/2` and
`z=2*x*y>24*h/25`, so

```text
w+2*h*z > 1/2 + 48*h^2/25 = 97/50,
CE^2 < 3/50 < 1/16,
CE < 1/4.                                        (7)
```

Finally, triangle `E,C,W` and the bridge equalities give

```text
EA = EW <= EC+CW = EC+CD
   < 1/4+3/5 = 17/20
   < 24/25 < EA,
```

a contradiction.

## Exact-computation cross-check

An exact SymPy reduction was used only to check the displayed identities, not
as the proof of the inequalities.  Modulo
`x^2+y^2-1` and `h^2-3/4`, it returned zero remainders for

```text
CD^2 - (2-x-2*h*y),
CE^2 - (2-w-2*h*z),
EA^2 - 4*y^2,
```

after substituting `w=2*x^2-1`, `z=2*x*y`.  It reduced the squared gap in
(1) to

```text
(2*y-1)*(2*y+1)*(4*y^2-3)/4
 = (4*y^2-1)*(4*y^2-3)/4.
```

The exact rational margins returned were

```text
159/40000,
-1/400  = 3/50 - 1/16,
479/9604.
```

This is **EXACT COMPUTATION** supporting the handwritten algebra.  It is not
kernel evidence.

## Exact next Lean theorem

The smallest useful generic theorem found by this analysis is the following
seven-point statement (name provisional):

```lean
theorem seven_point_split_bridge_orientation_incompatibility
    {O A C D E U W : ℝ²}
    (hOA : O ≠ A)
    (hOA_OC : dist O A = dist O C)
    (hOA_AC : dist O A = dist A C)
    (hOA_OD : dist O A = dist O D)
    (hOA_OE : dist O A = dist O E)
    (hDA_DE : dist D A = dist D E)
    (hDA_DU : dist D A = dist D U)
    (hAO_AU : dist A O = dist A U)
    (hCD_CW : dist C D = dist C W)
    (hEA_EW : dist E A = dist E W)
    (hOAC : 0 < signedArea2 O A C)
    (hOAD : 0 < signedArea2 O A D)
    (hOAE : 0 < signedArea2 O A E)
    (hOEC : 0 < signedArea2 O E C) : False
```

Recommended production shape:

1. a private normalized scalar theorem implementing the bounds above;
2. `metric_orientation_incompatibility` using `normSim`;
3. an `EdgeClosure` `Core` with the nine equality fields;
4. `false_of_core` and a reflection-derived `false_of_core_of_neg`;
5. a round-20 adapter with
   `(O,A,C,D,E,U,W)=(0,1,2,3,4,6,8)`; and
6. a monotone matcher for the equality closure plus the four cyclic signs.

The row-to-field map is exact:

```text
row 0 -> OA=OC=OD=OE
row 1 -> AO=AC=AU
row 3 -> DA=DE=DU
row 2 -> CD=CW
row 4 -> EA=EW
```

The saved order supplies `OAC`, `OAD`, `OAE`, and `OEC` in one global
orientation.  `BoundaryIndexing` uses the repository's negative convention,
so the concrete adapter is expected to call the reflected consumer, as in the
round-18 adapter.

This theorem would close the pinned round-20 **metric consumer** and produce
the next CEGAR cut.  It does not by itself produce the five rows from the live
ATAIL hypotheses and therefore does not close the live producer theorem.
