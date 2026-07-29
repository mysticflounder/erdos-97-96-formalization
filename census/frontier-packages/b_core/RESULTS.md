# B-core results (2026-07-28)

## Verdict matrix

| Run | Verdict | Variables | Clauses | Classification |
|---|---:|---:|---:|---|
| base | SAT | 162 | 57 | diagnostic baseline |
| B1-direct-shadow | SAT | 162 | 85 | prerequisite ingress missing; **not an official B1 verdict** |
| B2 | SAT | 162 | 262 | B2 named-local package verdict |
| B2-collision-u | SAT | 162 | 263 | pinned arm |
| B2-collision-v | SAT | 162 | 263 | pinned arm |
| B2-collision-b2 | SAT | 162 | 263 | pinned arm |
| B3 | SAT | 162 | 66 | B3 named-local package verdict |
| B3-square-a2 | SAT | 162 | 67 | pinned arm |
| B3-square-bu | SAT | 162 | 67 | pinned arm |
| B3-square-bv | SAT | 162 | 67 | pinned arm |
| B3-square-b2 | SAT | 162 | 67 | pinned arm |

Exact machine-readable records and decoded atom tables are in
`out/manifest.json` and `out/*.model.json`.

The official B1 verdict is:

`OMITTED_PREREQUISITE_INGRESS_MISSING`.

The SAT verdicts show only that these conservative, one-way named-local
projections do not themselves close B2 or B3. They are not finite geometric
models and do not overturn the kernel-checked bank theorems. In particular,
the B3 bank's global off-named-centers quantifier was deliberately not replaced
by a finite named subset.

## Third-bisector smoke

| Case | Verdict | Clauses | Check |
|---|---:|---:|---|
| all third-bisector premises | UNSAT | 7 | DRAT verified by `drat-trim` |
| drop `Bis(t)` | SAT | 6 | model checked; omitted atom false |
| drop `Ne(t,b1)` | SAT | 6 | model checked; omitted atom false |
| drop `Ne(t,a2)` | SAT | 6 | model checked; omitted atom false |

Overall smoke status: `PASS`. The persisted record is
`out/smoke-manifest.json`. DRAT is an UNSAT certificate format; the three SAT
near-misses are validated by decoded CaDiCaL models, not described as
DRAT-verified.

## Reproduction

Executed successfully from the repository root:

```text
uv run python -m py_compile \
  census/frontier-packages/b_core/encoding.py \
  census/frontier-packages/b_core/smoke.py \
  census/frontier-packages/b_core/run.py
uv run python census/frontier-packages/b_core/smoke.py
uv run python census/frontier-packages/b_core/run.py
```

## Trust boundary

The DIMACS verdicts are `EMPIRICALLY VERIFIED` for the exact generated CNFs.
The full smoke UNSAT proof was checked externally by `drat-trim`. None of the
production results is a Lean theorem or a universal geometric claim. Promotion
would require clause-level Lean ingress plus kernel certificate replay. B1
first requires an adapter producing support equality, both cross-memberships,
and the two-point class-intersection premise used by the historical B1 bank.
