# Exact-n=11 common-blocker projection

This directory contains a cheap SAT projection for the common-obstruction-center
leaf at cardinality 11. It wraps:

- `scratch/census-554/sat_cover.py` for the canonical Census-554
  C1/one-hit/C2/C4 cube; and
- `census/census_554/separation_encoding.py` for the canonical direct-row
  direct-or-reflected cyclic-separation surface.

For each symmetry shell `(s,o) = (2,0), (2,9), (3,0), (3,9)`, the projection
fixes `q=6`, `w=7`, and common blocker center `b=8`. It adds exactly two
clauses:

1. center `V=1` selects an exact-four candidate contained in
   `U5={6,7,8,s,o}` and containing `{6,7}`;
2. center `8` selects an exact-four candidate containing `{6,7}`.

The existing C4 constraint then prevents any third selected center-row from
containing `{6,7}`.

Run:

```bash
uv run python scratch/card11-exact5-common/self_test.py
uv run python scratch/card11-exact5-common/probe.py --timeout 600
```

The second command runs the four CaDiCaL jobs serially. SAT assignments are
checked against every emitted CNF clause, the independent Census-554
`cube_ok`, the shell conditions, and every selected boundary order. Any UNSAT
result is replay-checked with `drat-trim`.

## Scope and trust boundary

Source-faithful here means only that the canonical labeled Census-554
C1/one-hit/C2/C4 cube, its direct-row cyclic-separation theorem surface, and
the two explicit shell row requirements above are reused or checked directly.

This projection does **not** encode or prove the full exact-five source
statement, a source-to-valuation theorem, uniqueness/minimality, `noM44`,
existence of blocker rows for all source indices, or the claim that the four
shells exhaust every geometric realization without the upstream symmetry and
common-center reductions. A SAT result is therefore a witness that this cheap
projection remains feasible. An UNSAT result would close only these four
finite CNFs, conditional on the stated upstream reductions and encoding
correspondence.
