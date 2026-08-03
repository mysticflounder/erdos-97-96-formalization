# Five-point two-center Kalmanson enumeration

Labels are `O,A,C,J,K`, with

\[
d(O,C)=d(O,J)=x,
\qquad
d(A,C)=d(A,J)=d(A,K)=y.
\]

The remaining variables are

\[
p=d(O,A),\ q=d(O,K),\ r=d(C,J),\ s=d(C,K),\ t=d(J,K).
\]

For every four labels in induced cyclic order `a,b,c,d`, the enumeration
imposes both strict Kalmanson inequalities

\[
d(a,c)+d(b,d)>d(a,b)+d(c,d),
\]

\[
d(a,c)+d(b,d)>d(a,d)+d(b,c).
\]

It also imposes positivity of all seven reduced distance variables and all
triangle inequalities.  Triangle inequalities and positivity are justified
here because the variables stand for distances between distinct vertices of
an injective Euclidean boundary enumeration.  Neither is needed for any of
the infeasibility certificates below.

Representatives are rotated to put `O` first; the lexicographically smaller
of each order and its reversal is retained, with `A<C<J<K`.

## Exact classification

| Cyclic order | Result | Exact rational witness or contradiction |
|---|---|---|
| `O A C J K` | infeasible | `OC+AJ>OJ+AC`, but both sides are `x+y` |
| `O A C K J` | infeasible | induced `O A C J`: `OC+AJ>OJ+AC`, both `x+y` |
| `O A J C K` | infeasible | `OJ+AC>OC+AJ`, but both sides are `x+y` |
| `O A J K C` | infeasible | induced `O A J C`: `OJ+AC>OC+AJ`, both `x+y` |
| `O A K C J` | infeasible | induced `O A C J`: `OC+AJ>OJ+AC`, both `x+y` |
| `O A K J C` | infeasible | induced `O A J C`: `OJ+AC>OC+AJ`, both `x+y` |
| `O C A J K` | feasible | `(x,y,p,q,r,s,t)=(3,5/2,5/2,1,5,4,2)` |
| `O C A K J` | feasible | `(x,y,p,q,r,s,t)=(3/2,2,5/2,7/2,3,4,2)` |
| `O C J A K` | infeasible | `OJ+CA>OC+JA`, but both sides are `x+y` |
| `O C K A J` | feasible | `(x,y,p,q,r,s,t)=(3/2,2,5/2,7/2,3,2,4)` |
| `O J A C K` | feasible | `(x,y,p,q,r,s,t)=(3,5/2,5/2,1,5,2,4)` |
| `O J C A K` | infeasible | `OC+JA>OJ+CA`, but both sides are `x+y` |

Each displayed feasible witness was checked exactly (using rational
arithmetic after the LP search) against all ten strict Kalmanson inequalities,
all seven positivity constraints, and all thirty triangle inequalities.
Thus there are exactly **4 feasible** and **8 infeasible** dihedral classes in
this linear Kalmanson-plus-metric abstraction.

These witnesses establish feasibility of the stated linear abstraction; they
are not asserted to be Euclidean coordinate realizations.

## Exact Farkas certificates

Put

\[
E_O=d(O,C)-d(O,J)=0,
\qquad
E_A=d(A,C)-d(A,J)=0.
\]

For each infeasible order, a single strict Kalmanson row has reduced
coefficient vector zero.  More explicitly, its left-minus-right form is one
of

\[
E_O-E_A,
\qquad
-E_O+E_A.
\]

Taking coefficient `1` on that strict row and substituting the two equality
rows gives `0>0`.  This is an exact rational Farkas-style certificate with all
coefficients in `{−1,0,1}`.  The equality `d(A,K)=y`, positivity, and triangle
inequalities have coefficient zero in every infeasibility certificate.

## Alternation and existing Lean schemas

The classification is exactly the two-center/two-hit alternation rule:
after deleting `K`, the centers `O,A` and common hits `C,J` must alternate
around the four-cycle.  The four feasible representatives have induced order
`O C A J` or its reversal `O J A C`; every other representative violates
alternation and is killed by one four-point Kalmanson row.

The declarations in
`lean/Erdos9796Proof/P97/ATail/KalmansonThreeEqualitySchemas.lean` do **not**
match this equality pattern by an injective relabelling.  Its five-point schema
`false_of_five_ccw_three_shell_equalities_012_124_314` uses three distinct
equality centers (`i0,i1,i3`), and each six-point schema (including the four
selected-row triangle wrappers) likewise uses three distinct centers.  Here
all three independent equality rows have only the two centers `O,A`.

The appropriate existing Lean consumers are instead the four-point
two-center lemmas in `CapCrossingKalmanson.lean`, notably
`false_of_four_ccw_endpoint_centers_bisect_middle_pair` and
`false_of_four_ccw_middle_centers_bisect_endpoint_pair`, together with the
fixed-enumeration-cut variants
`false_of_two_centers_equidistant_pair_before`, `_after`, `_enclosed`, and
`_split` in `TwoCenterBisectorParity.lean`.  Equivalently, each case can call
one generic strict Kalmanson inequality directly.  No new three-equality
schema is needed for the eight nonalternating classes.

## Reproduction

Run:

```bash
uv run python scratch/retained-omission-e1/a-x-kalmanson-enumeration/enumerate.py
```

The script enumerates all 12 dihedral representatives, performs both the
Kalmanson-plus-positivity check and the strengthened check with all triangle
inequalities, verifies feasible rational witnesses exactly, and searches for
small exact positive dependencies for infeasible cases.
