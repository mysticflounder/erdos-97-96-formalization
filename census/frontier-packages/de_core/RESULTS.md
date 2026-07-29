# D–E Session-3 results

Run date: 2026-07-28.

Commands:

```text
uv run python -m py_compile census/frontier-packages/de_core/{encoding,smoke,run}.py
uv run python census/frontier-packages/de_core/smoke.py
uv run python census/frontier-packages/de_core/run.py
```

## Official diagnostic runs

| run | verdict | variables | clauses | checked model |
|---|---:|---:|---:|---:|
| `base-E` | SAT | 172 | 609 | yes |
| `D3-left` | SAT | 172 | 625 | yes |
| `D3-right` | SAT | 172 | 625 | yes |
| `D4` | SAT | 172 | 624 | yes |

The emitted manifest records per-tag clause counts.  In particular, all four
runs include 354 `[GEOM]` clauses; the D3 deltas each add 15 `[BANKED]`
clauses and one `[HYP]` clause, while D4 adds eight `[BANKED]`, one
`[DERIVED]`, and six `[HYP]` clauses.

Interpretation: none of the four named-local incidence projections is
propositionally contradictory.  These SAT assignments are not Euclidean
realizations and do not settle the Lean leaves.

## D4 bisector smoke

| gate | expected | result | DRAT |
|---|---:|---:|---:|
| positive D4 pair + fresh distinct `c3` | SAT | SAT | n/a |
| add `bis(q,w;c3)` | UNSAT | UNSAT | verified |
| remove only `perpBisector.carrier_atMostTwo` | SAT | SAT | n/a |

The checked proof artifacts are:

```text
CNF  sha256 59f5e6dba1bc828491685c4baf8ee9096ace336e718736ad6a583bc07bff99c1
DRAT sha256 951ba24f22f1b30ce70ba32fd6e601b5924f41f7a39c6a08a170d71d3f01bbaf
```

The dependency gate matters: it shows the third-bisector UNSAT is not coming
from D4's direct no-third field.  It is forced by the general convex-carrier
perpendicular-bisector at-most-two clause.

## Trust boundary

All verdicts concern the exact emitted CNFs only.  The package is an open
named-witness projection with `carrierCard_ge(10)` and no carrier upper bound:
it does not enumerate `n=10..15`, assert a finite complete universe, encode
minimality, or encode no-M44.  DRAT checks the smoke CNF, not the
clause-to-geometry translation.  The first theorem-completeness blocker remains
the absence of a proved finite cardinality cutoff (or a cardinality-free
symbolic certificate).
