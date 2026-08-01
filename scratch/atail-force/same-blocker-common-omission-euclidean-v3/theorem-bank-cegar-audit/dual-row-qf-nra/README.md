# Dual-row fixed-coordinate audit

## Outcome

The frozen dual-row incidence witness is **rejected before QF_NRA**.  It has
two direct increasing-order matches for the production theorem
`false_of_six_ccw_three_shell_equalities_013_235_415`.

The smallest displayed core is the six points

`a1 < t3 < a2 < r2 < a3 < s1`

with three row-derived equalities:

- center `a1`, `outside.apex1`: `d(a1,t3) = d(a1,r2)`;
- center `a2`, `collision.apex2`: `d(a2,r2) = d(a2,s1)`;
- center `a3`, `collision.apex3`: `d(a3,t3) = d(a3,s1)`.

They instantiate the `013/235/415` schema exactly.  A second independent hit
is `a1 < t1 < a2 < r1 < p2 < s4`, using `outside.apex1`,
`outside.apex2`, and `collision.common`.

Consequently the saved Boolean witness is not a valid Euclidean survivor.
The active bounded QF_NRA run was interrupted once this stronger obstruction
was identified; the opposite-blocker distance conjecture was not classified.

## Files

- `ENCODING-LEDGER.md`: exact ENCODED/OMITTED boundary and equation/DOF counts.
- `audit_dual_row_qfnra.py`: reusable fixed-role formula builder.  Its default
  preflight rejects this witness before importing or calling Z3.
- `result.json`: compact replay of both theorem hits and the trust boundary.
- `models.json` and emitted `.smt2` files: superseded development probes only;
  they are not the final verdict.

Run the source-only preflight/result emission with:

```bash
uv run --offline python \
  scratch/atail-force/same-blocker-common-omission-euclidean-v3/theorem-bank-cegar-audit/dual-row-qf-nra/audit_dual_row_qfnra.py
```

## Trust boundary

The match is replayed against the frozen JSON and the theorem statement in
`lean/Erdos9796Proof/P97/ATail/KalmansonThreeEqualitySchemas.lean`.  No
Lean/Lake build, kernel verification, or transitive axiom audit was run in
this lane.  No solver-based statement is made about the discarded witness,
and no conclusion is made about a future Kalmanson-refined witness.
