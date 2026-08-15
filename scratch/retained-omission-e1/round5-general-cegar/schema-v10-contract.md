# Schema 10 direct-negation contract

Schema 10 is the direct per-candidate form of Schema 9.  It reuses Schema 7
ingress and the Schema 9 full dynamic `BoundaryIndexing.indexOf` permutation and
five-role order arms.  For every `c,a,b` in the 17-point carrier it adds

```text
b ≠ c → Avalid(c,a) →
  (at most one shared point strictly between c and b) ∧
  (at most one shared point outside that interval).
```

Here `Avalid` and `shared` are exactly the Schema 9 definitions.  The 4,913
direct clauses are logically equivalent to
`Not (Or_{c,a,b} Good(c,a,b))`; `b = c` contributes a tautology because
`Good` already requires `b ≠ c`.  Terms for `Aclass`, `Avalid`, interval
membership, and shared rows are structurally cached.

`--self-check` exhausts the Boolean/count polarity on a small finite domain,
builds all 16 mapping/order/deletion cases without solving them, and checks a
full Schema-9 `Good` OR against the direct clauses (`UNSAT`).  `--run-one` is
available for a single bounded probe; no 16-case production round is launched
by this change.

The result remains external exact-incidence evidence.  It supplies no
Euclidean realization, cyclic-order lift beyond the source arm, or
arbitrary-cardinality Lean theorem.
