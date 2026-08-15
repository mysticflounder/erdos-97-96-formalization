# FreshThird six-center global-K4 canary, v2

This directory contains an exact-17 bounded theorem-discovery experiment for
the live FreshThird six-center constructor.  Its ingress is deliberately a
*pair* of inputs:

```text
C : TwoCapSourceThirdCanonicalRowSurface P Pρ
TwoCapSourcesSixCenterSourceProvenanceBoundary
  Q C.firstSource C.secondSource
D.A.card = 17
```

The boundary abbreviation alone does not expose the cap-source witnesses or
the cap profile.  The ambient `T` hypotheses used by
`twoCapSourceSurface_exact_seventeen_cap_profile` supply the other two cap
lower bounds.  See `INGRESS-CONTRACT.md` for the clause-by-clause source audit.

## Outcome

The full exact-17 incidence/cap-composition formula is SAT in Z3 4.16.0.  A
compact assignment is in `model.json` and passes the script's independent
ordinary-Python readback.  cvc5 1.3.3 returned `unknown` after 30 seconds on
the unpinned full search, then returned SAT when every variable was pinned to
the Z3 assignment.  All ten independent malformed-clause controls are UNSAT
in both solvers.

This is finite diagnostic evidence.  It is not a Euclidean realization, a
Lean theorem, a universal general-n argument, or closure of the FreshThird
branch.

## Run

From this directory:

```bash
uv run --with z3-solver python canary.py > latest-run.log 2>&1
uv run --with ruff ruff check canary.py
uv run python -m py_compile canary.py
jq '{base, controls, forced_clauses, retained_pair_discovery, row_union_projection}' run-results.json
```

The script invokes the independently installed `cvc5` executable as a second
SMT solver.  It rewrites only these local artifacts:

- `run-results.json`: solver versions, statuses, controls, and probes;
- `model.json`: one compact verified exact-17 assignment;
- `latest-run.log`: compact stdout from the latest run.

## Model outline

The carrier consists of 17 physical point indices.  Every carrier source `q`
has a carrier blocker `b(q) != q` and an exact four-point canonical shell that
contains `q` and omits `b(q)`.  Actual-blocker fibers have size at most four.
Same-center shells are equal physical radius classes or disjoint; rows at
distinct centers meet in at most two physical points.

Six exact-four deleted rows are materialized at the two collision blockers,
the three Moser apices, and the surviving cap-source blocker.  The rows have
six distinct centers, omit the common deleted source and their own centers,
and carry the exact B0/B1/B5 provenance.  The B3/B4 retained-pair intersection
cuts are encoded exactly as the proved theorem supplies them.

Cap composition is represented pointwise: closed cap sizes `(8,6,6)`, exact
Moser-apex membership, exactly one cap per non-Moser carrier point, and both
oriented cap sources in the strict first-cap interior.  Physical aliases are
retained except where a Lean field proves distinctness or an index choice is
an explicit symmetry normalization.

The originally requested n=15 scope is outside this live residual because the
cap bounds force `|A| >= 17` (proved directly by
`twoCapSourceSurface_carrier_card_ge_seventeen`).  The n=15 check retained here is only an
invalid-scope arithmetic UNSAT control and is not live evidence.
