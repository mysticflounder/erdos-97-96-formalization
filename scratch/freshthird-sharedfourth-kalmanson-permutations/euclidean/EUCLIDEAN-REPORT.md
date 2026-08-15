# Euclidean check of the two abstract survivors

This is bounded theorem-discovery evidence only. It is not a P97 closure claim
and adds no production Lean or documentation facts.

## Exact encoding

Six points p₀,…,p₅ have real coordinates, with p₀=(0,0) and p₁=(1,0) to
remove translation/scale symmetry. For every cyclic edge pᵢ→pᵢ₊₁ and every
other vertex pₖ, the exact polynomial constraint

```
cross(pᵢ₊₁ − pᵢ, pₖ − pᵢ) > 0
```

is asserted. These 24 strict edge-support inequalities are a source-faithful
characterization of strict convex CCW order; they also imply pairwise
distinctness. Squared Euclidean distances are used, so each row equality is
exactly equivalent to equality of the corresponding Euclidean distances.

The matching convention is the prior one: m[i] omits support slot m[i], with
slots 0,1,2 corresponding to points 3,4,5.

## Classification

Both patterns are genuinely geometrically realizable.

| pattern | Z3 nonlinear proposal | cvc5 exact-rational checker |
|---|---:|---:|
| m012 | SAT | SAT |
| m210 | SAT | SAT |

The direct nonlinear cvc5 search did not provide a useful free-variable model
within its bounded run; the cvc5 SAT results above are checks of the exact
rational witnesses below. Thus the geometric classification does not rely on
cvc5's nonlinear search completeness.

## Exact rational witnesses

```
m012:
  p0 = (0, 0)       p1 = (1, 0)       p2 = (25/12, 1/4)
  p3 = (4, 1)       p4 = (1, 2)       p5 = (-2, 1)

m210:
  p0 = (0, 0)       p1 = (1, 0)       p2 = (7/4, 1/4)
  p3 = (2, 1)       p4 = (1, 2)       p5 = (0, 1)
```

The row equalities are:

```
m012: d²(0,4)=d²(0,5)=5;
      d²(1,3)=d²(1,5)=10;
      d²(2,3)=d²(2,4)=305/72.
m210: d²(0,3)=d²(0,4)=5;
      d²(1,3)=d²(1,5)=2;
      d²(2,4)=d²(2,5)=29/8.
```

Independent exact Fraction checking gives minimum edge-support cross product
1/4 for both patterns, minimum pairwise squared distance 1 for m012 and 5/8
for m210, and zero residual for all three row equalities in each case.

The generated QF_NRA inputs, solver outputs, fixed-rational checks, and exact
checker are in this directory. No UNSAT core or Lean consumer shape applies,
because neither pattern is UNSAT.
