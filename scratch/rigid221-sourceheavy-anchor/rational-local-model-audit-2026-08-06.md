# Rational local model for the Rigid221 off-class residual

This is a no-go certificate for a contradiction using only the currently named
cyclic-order, perpendicular-bisector, and physical-five-class facts.  It is not
a counterexample to the full Lean theorem: it does not construct all anonymous
selected rows or the global minimal `CounterexampleData` surface.

Identify the plane with the complex numbers and put

```text
r = (312 + 25 i) / 313,             |r| = 1,
O = 0,
X = r^0, Y = r^8, E = r^10, V = r^12, U = r^16,
e = (10001/10000) r^5,
c = (10001/10000) r^11.
```

Add cap endpoints

```text
L = (10001/10000) r^(-1),
R = (10001/10000) r^17.
```

Every coordinate is rational.  Exact rational arithmetic verifies that the
circle through `O,L,R` contains every other named point strictly in its
interior and has its center strictly inside triangle `OLR`.  It is therefore
the minimum enclosing circle of the named configuration with three-point
support `O,L,R`.  The checker also verifies that

```text
O < L < X < e < Y < E < c < V < U < R
```

is a strictly convex cyclic order.  Thus `X,Y,E,c,V,U` lie in the strict open
cap between `L` and `R`, while `c,e` are outside the `O`-unit class.

The exact intersections of the five named centered circles with
`C = {X,Y,E,V,U}` are

```text
circle(Y, dist(Y,X)) cap C = {X,U},
circle(V, dist(V,Y)) cap C = {Y,U},
circle(E, dist(E,Y)) cap C = {Y,V},
circle(c, dist(c,E)) cap C = {E,V},
circle(e, dist(e,X)) cap C = {X,E}.
```

In particular, all named equal-distance hooks and all named physical-class
omissions in the residual coexist in a Euclidean convex configuration.  The
remaining contradiction must consume information not represented here:

- the three anonymous non-`c` members of the selected row centered at `c`;
- carrier-wide K4/minimality; or
- a source theorem localizing `centerAt c` or another anonymous row point.

Run the exact checker with:

```bash
uv run python scratch/rigid221-sourceheavy-anchor/verify_rational_local_model.py
```
