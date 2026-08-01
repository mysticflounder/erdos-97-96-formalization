# Metric-core miner v8

## Outcome

The bounded search found a six-point equality core on
`a1, a2, p2, q1, r1, t1`.  After the similarity gauge
`a1 = (0,0)`, `r1 = (1,0)`, its nine squared-distance equalities generate the
unit ideal over characteristic zero.  Thus these equalities have no complex
solution in this gauge, and in particular no pairwise-distinct real planar
realization.

Singular 4.4.1 returned `UNIT`; msolve 0.10.1 returned `UNIT` in both forward
and reverse variable orders.  The algebra smoke tests returned `NONUNIT` for
an equilateral triangle and `UNIT` for an equal-edge K4.

Z3 4.16.0 and cvc5 1.3.3 both timed out on the final core after 30 seconds, so
their verdict is recorded as `UNKNOWN`, not `UNSAT`.  In the initial bounded
tranche, the full 17-point formula and all 40 selected induced subsets were
also `UNKNOWN`; there were no Z3 `SAT` or `UNSAT` verdicts.

## Core equalities

1. `d2(a1,q1) = d2(a2,p2)`
2. `d2(a1,q1) = d2(p2,r1)`
3. `d2(a1,p2) = d2(a1,t1)`
4. `d2(a1,r1) = d2(a2,q1)`
5. `d2(a1,r1) = d2(a2,r1)`
6. `d2(a1,r1) = d2(p2,q1)`
7. `d2(a1,r1) = d2(r1,t1)`
8. `d2(a2,t1) = d2(q1,r1)`
9. `d2(a2,t1) = d2(q1,t1)`

Every atom is inherited from the global undirected-edge equality closure of
the v8 witness.  The witness has 68 radius-class generators and 11 nontrivial
global edge classes.  The closure SHA-256 is
`ed0a4e2ca8fe8c01b61959a33b19a359eeb3a084e28a238d8c60b6a60b2256b5`;
the canonical core-atom SHA-256 is
`a3ed053d6bb256559abe66731bb214d53ba2def8eb65ed3dbdb3cf8af303d76f`.

Greedy induced-point deletion followed by one-pass equality deletion could
remove neither a point nor an equality while retaining a Singular `UNIT`
verdict.  This is deletion-minimal for that procedure, not a proof of global
minimum size.

The current production equality-only signature matcher reported no match.
Exact-radius and convex-order signatures were deliberately excluded because
those predicates are absent from this formula.

## Artifacts and trust boundary

- `result.json`: source hashes, closure provenance, budgets, every solver
  verdict and timing, minimization trials, environments, atoms, and production
  signature check.
- `algebraic-minimal-core.sing`: exact characteristic-zero ideal replay;
  `Singular -q algebraic-minimal-core.sing` prints `UNIT`.
- `algebraic-minimal-core.smt2`: final QF_NRA formula with all 15 pairwise
  distinctness constraints and the similarity gauge.
- `mine_metric_core.py`: deterministic miner and artifact generator.

This is trusted external computation, not a Lean/kernel-checked proof.  The
Singular unit-ideal result is exact algebraic evidence; msolve is corroboration
only.  Numerical Jacobian rank was used only for candidate prioritization.
`SAT` models, if any, are replayed against every asserted formula, and neither
`UNKNOWN` nor numerical failure is ever promoted to infeasibility.
