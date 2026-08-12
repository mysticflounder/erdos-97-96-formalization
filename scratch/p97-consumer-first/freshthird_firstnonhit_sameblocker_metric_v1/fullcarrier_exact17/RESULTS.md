# Results: exact-17 same-blocker × same-blocker

Run command:

```text
uv run --offline python metric_round.py --timeout-ms 10000 --cvc5-timeout-ms 10000
```

The assignment validator passed. The source-valid gauge control was
`SAT/SAT/SAT` (Z3 Python / Z3 CLI / cvc5), with exact substitution and
fraction replay both `PASS`. The staged metric results were:

| stage | Z3 Python | Z3 CLI | cvc5 |
|---|---:|---:|---:|
| row preflight | timeout | timeout | unknown |
| geometry core | SAT | SAT | unknown |
| cap classification | SAT | SAT | timeout |
| K4 witnesses | timeout | timeout | unknown |
| selected supports | timeout | timeout | unknown |
| rich radius pattern | UNSAT | UNSAT | UNSAT |

All four malformed controls (`reversed boundary`, broken K4 equality,
equal D44 radii, and broken same-blocker row) were `UNSAT/UNSAT/UNSAT`.

The only minimized source-clause result is group-level: the combination of
`k4_witness_equalities` and `rich_radius_pattern` (97 clauses) is already
`UNSAT/UNSAT/UNSAT`. This is an exact-17 local obstruction, not a
cardinality-independent producer. It omits the universal ingress/lift, all
other exact-17 incidence assignments, every cardinality other than 17, the
other FreshThird constructors/arms, and the final Lean consumer theorem.

The conflict has an immediate five-atom explanation at the frozen apex 3:
`k4_equal_3_5`, `k4_equal_3_6`, `rich_equal_0_0_6`,
`rich_equal_0_1_4`, and `rich_distinct_0`. The selected K4 support was fixed
to `[4,5,6,7]`, while the rich arms were fixed to `[6,7]` and `[4,5]` at
distinct radii. The live FirstNonHit ingress does not force that arbitrary K4
support/rich-arm overlap. The UNSAT verdict therefore rejects this proposal;
it is not coverage of the live branch.

Conclusion: finite/local theorem-discovery signal only; no P97
counterexample and no Lean sorry closure.
