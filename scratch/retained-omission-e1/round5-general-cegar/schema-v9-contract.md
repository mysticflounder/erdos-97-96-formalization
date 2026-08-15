# Schema 9 coherent shared-pair contract

Schema 9 repairs the Schema-8 quantifier error.  For each selected endpoint
center `c`, every anchor `a`, and every global K4 row center `b`, it defines

```text
Aclass[p] := p ≠ c ∧ ¬deleted[p] ∧ E(c,a,p)
Good(c,a,b) := Avalid(c,a) ∧ b ≠ c ∧
  (at least two Aclass∩m[b,*] points both btw(c,b,*)
   ∨ at least two both outside btw(c,b,*))
```

`good_exists` is the finite OR over all `N³ = 17³ = 4913` triples.  The
countermodel query adds `Not(good_exists)`; it introduces no anchor, B-row, or
pair selector variables.  `btw` is exactly
`(c < p ∧ p < b) ∨ (b < p ∧ p < c)` under the full `pos` permutation.

The permutation is constrained to the source-proved five-role order for each
endpoint mapping and order arm:

```text
qOutside, freshCenter=q1_center, qBetween, sourceCenter=c_center[slot], canonicalSource
```

The self-check builds all 16 mapping/arm/deletion-query cases, verifies the
4913 candidate count and absence of Schema-9 selector variables, and checks
`good_exists ∧ ¬good_exists` is UNSAT.  The public `--run` path executes the
self-check first; the serial runner does likewise.  Results remain bounded
external evidence with no Euclidean realization or universal-cardinality lift.
