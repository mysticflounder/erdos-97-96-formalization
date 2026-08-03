# A=X two-exact-circle local witness

This exact rational witness rules out a purely local obstruction based only on
strict convexity and the two exact four-point circle classes in the shared
blocker branch.

The centers are

\[
A=(0,0),\qquad O=(6/5,0).
\]

The common hits are

\[
C=(3/5,4/5),\qquad J=(3/5,-4/5).
\]

The private points of the unit circle centered at `A` are

\[
K=(7/25,-24/25),\qquad L=(9/41,-40/41),
\]

and the private points of the unit circle centered at `O` are

\[
U=(53/65,12/13),\qquad V=(23/25,24/25).
\]

Among these eight points, the full positive-radius unit classes are exactly

\[
\Gamma(A,1)=\{C,J,K,L\},\qquad
\Gamma(O,1)=\{C,J,U,V\}.
\]

All eight points are strict vertices in counterclockwise order

```text
A L K J O V U C
```

so `O,A` alternate with the common pair `C,J`.  The verification script uses
exact `Fraction` arithmetic for both circle membership and every supporting
line inequality.

Run:

```bash
uv run python scratch/retained-omission-e1/a-x-two-exact-circles/verify_witness.py
```

Scope: this is not a full P97 counterexample and does not model the three Moser
caps or critical rows at every carrier point.  It proves that any contradiction
for the live A=X leaf must use at least one of those additional global inputs;
the two exact circles and convex cyclic order alone are consistent.
