# Schema 12 pinned-center universal-escape contract

Schema 12 encodes the public Lean theorem
`exists_freshThirdCrossRow_pinnedCenter_universal_escape_dichotomy` from
`TwoSourceFreshThirdResidual.lean`.

The finite abstraction has a six-point `seed`, two exposed centers, a finite
set of candidate centers, exact-four selected rows, and (for each point) a
canonical blocker center and canonical critical support.  It accepts a model
iff the following quantifiers can be witnessed by one center `c`:

```text
exists c,
  c in seed and c != exposed_C and c != exposed_Q and
  (forall positive shell radius r in the finite inventory at c,
     card(seed intersect SelectedClass(c,r)) <= 3) and
  (forall exact-four row K at c, forall z in K.support,
     z not in seed ->
       ((c = blocker(z) and K.support = critical_support(z) and
         not deletion_robust(c)) or
        (c != blocker(z) and
         card(K.support intersect critical_support(z)) <= 2)))
```

The row and point quantifiers are universal after the single existential
center.  In particular, one successful row cannot mask a failing row, and
branch A requires deletion robustness to fail.  The shell inventory, carrier,
and all supports are finite-only assumptions used for a bounded CEGAR probe;
there is no claim that the inventory exhausts real radii, that the abstract
supports admit a Euclidean realization, or that this script supplies a
universal-cardinality lift or Lean closure.
