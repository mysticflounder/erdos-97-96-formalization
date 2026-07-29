# D-R Session-3 results

Run date: 2026-07-28.  Commands:

```bash
python3 -m py_compile census/frontier-packages/dr_core/{encoding,smoke,run}.py
uv run python census/frontier-packages/dr_core/smoke.py
uv run python census/frontier-packages/dr_core/run.py --timeout-seconds 60
```

`py_compile`: PASS.

## Smoke

`out/smoke/smoke_report.json` records 30 passing gates:

- four positive SAT witnesses: total assignments for `dr-common`, `dr-d1`,
  `dr-d2`, and a legal two-point `B1/B2` overlap;
- 25 negative UNSAT probes, all with CaDiCaL DRAT proofs independently
  accepted by `drat-trim`;
- one direct five-entry double-role/cap-renaming check.

The negative probes comprise all 16 forbidden `X/Y` cross-identifications,
one three-point `B1/B2` overlap, all five negated swap aliases, and three
selector/deletion clashes.  The corrected swap gate explicitly does not
assert `S''=S`, `a0''=a0`, or any packet identity.

## Official 60-second runs

| run | verdict | vars | clauses | wall |
|---|---:|---:|---:|---:|
| `dr-common` | SAT | 478 | 12,888 | 0.011s |
| `dr-d1` | SAT | 478 | 12,928 | 0.012s |
| `dr-d2` | SAT | 478 | 12,985 | 0.011s |

Exact CNFs, decoded models, and the run manifest are under `out/`.

## Interpretation and first remaining boundary

All verdicts concern only the hypothesis-tagged named-local incidence shadow.
SAT is not a Euclidean model, a full finite-carrier model, or closure of either
Lean leaf.  In particular, v1.0 does not encode universal no-five/no-M44
quantification, exact real-radius arithmetic, or unlisted carrier points and
rows.  A sound strengthening needs either an exhaustive row certificate or a
new finite consequence of those universal hypotheses; treating the current
labels as exhaustive would be unsound.
