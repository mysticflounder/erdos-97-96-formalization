# B1 post-MEC exact rational 12-point core

This is a source-static negative control for consult `01M1KN4B72QCVYTQQ0SG039DFS`.
It realizes the declared nonobtuse MEC triangle, the six common-radius points centered at `A`, all three paired blocker equalities, and the retained cyclic order in strict convex position. It deliberately omits the six row-completion points and every deletion/minimality field.

## Construction

For rational `t`, put

```text
U(t) = ((1-t^2)/(1+t^2), 2*t/(1+t^2)).
```

Use

```text
A = (0,0)
s = (1,0)
R = 1011244583 / 1000000000

t0 = 128840103 / 1000000000
t1 =  20990903 /  100000000
t2 = 262063741 / 1000000000
t3 = 183438467 /  500000000
t4 =   8484611 /   20000000
t5 =  64900969 /  125000000

x_i = R * U(t_i)

lambda0 = 250629953 / 500000000
lambda1 =  32104341 /  62500000
lambda2 = 501455283 / 1000000000

b0 = lambda0 * (x0+x1)
b1 = lambda1 * (x2+x5)
b2 = lambda2 * (x3+x4)

t_o = 12821891 / 25000000
r_o = 1018753467 / 1000000000
o1 = r_o * U(t_o).
```

The cyclic order is

```text
A, s, x0, b0, x1, x2, x3, b1, b2, x4, o1, x5.
```

Let `o1=(u,v)` and let the circumcenter of `(A,s,o1)` be

```text
M = (1/2,m),   m = (u^2-u+v^2)/(2*v).
```

## Exact verification

1. `v>0`, and the three nonobtuse numerators are strictly positive:

```text
u > 0,
1-u > 0,
u^2-u+v^2 > 0.
```

The smallest is

```text
320163947399941293409427 / 789400888815881000000000 > 0.
```

2. Every `x_i` has exact squared distance `R^2` from `A`.

3. The paired blocker equalities hold exactly:

```text
|b0-x0|^2 = |b0-x1|^2,
|b1-x2|^2 = |b1-x5|^2,
|b2-x3|^2 = |b2-x4|^2.
```

This also follows algebraically from `b=lambda*(p+q)` for equal-norm `p,q`.

4. All `C(12,3)=220` ordered orientation determinants for the displayed order are strictly positive. The exact minimum is

```text
395163799568710700014628743114155802911528026200895018335228855434301301109055596491447223
/
8869301738526159386394360806435857323721485077431274214301863423528125000000000000000000000000
> 0.
```

Hence the twelve points are distinct and in strict convex position in the stated cyclic order.

5. Every point lies in the closed circumdisk of `(A,s,o1)`. For `P=(x,y)`, the normalized disk power is

```text
x^2-x+y^2-2*m*y.
```

It is exactly zero for `A,s,o1` and strictly negative for the other nine points. The smallest positive slack is attained at `x5` and equals

```text
316819906170141324819011705987478311503
/
127174796343338024897625500000000000000000
> 0.
```

## Consequences

- The bare packet consisting of MEC/nonobtuse geometry, six common-`A`-radius points, three paired blocker equalities, direct cyclic order, disk containment, and strict convexity is satisfiable.
- Therefore a contradiction must use at least one of: the six row-completion points/full four-point blocker rows, exact source/deletion survivals, first-apex-class provenance, no-qfree/minimality, or another omitted cross-row incidence.
- This example also has `R != |A-s|=1`. Thus the current A-row equalities do not justify applying `disk_apexCircle_iff_halfplane` with `(v2,v3)=(A,s)` unless an additional source equality identifies the A-row radius with `dist A s`.

This is not a `B1GlobalTransportContext` and is not a Problem 97 counterexample.
