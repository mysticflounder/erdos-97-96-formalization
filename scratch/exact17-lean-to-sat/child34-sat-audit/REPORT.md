# Exact17 child34 terminal SAT custody audit

Date: 2026-08-13. Read-only audit; no production files or Lean builds changed.

## Verdict

The exported root, ingress manifest, terminal job, model, solver log, and
independent full-CNF replay are internally consistent and pass the requested
308-variable / 5,847,256-clause checks. The live PIQD database has exactly one
job for this root and identity, with one completed run (`run_epoch=1`),
`recovery_action=null`, and no duplicate job.

There is nevertheless a custody exception relevant to a strict “no
recovery” promotion gate: `piqd-child34-core1-custody-prepared.json` records
`submission_mode=reconciled_after_prepare_response_failure` and
`submitted=null`. Thus the solver run itself shows no requeue/recovery, but
submission custody did use response-failure reconciliation. If “no
duplicate/recovery” is literal, this is a promotion blocker requiring an
explicit policy disposition; it must not be silently reported as a clean
no-recovery submission.

## Evidence

- Root CNF SHA-256: `ea8311540af709cf991c932c38e52f9767227cf55781508f2791b1dc42c4a819`.
  Header is `p cnf 308 5847256`; byte size is 291,620,980.
- Ingress validator and child34 `validate_local` both returned PASS, including
  manifest SHA `01a53c3772486002cbb7a54fb1db24a21027c38bd9670ab2814eb26fe3ef62a2`,
  parent root binding, export receipt, and the eight new clauses.
- The immutable export receipt is `status=PASS`, `publication_state=PROVISIONED`,
  and binds the child (308 / 5,847,256) to parent SHA
  `775eb42db7bdac52eb7e5609a1cf33111c953d26f4cee9c8d95bde3b468563b9`, Lean
  root SHA `bd9a2ee92333b50f86a3cd6f3875d47e07af3651befa894ae49709cbf689f6fb`,
  and export SHA `c1f02d7804e5834243a33314ddad4fd946a3cd3f326cb64b9abbb6a4b4d7d149`.
  Validation reports `ordered_suffix_exact=true`, `new_clauses=8`, and
  `duplicate_new_clauses=0`.
- Exact job is `3dc8ef3d-5cc3-49c1-b0e4-afc9d2552941`; identity hash is
  `75663ec19c88e9cbc2b3a949f95b3ba739917a85e9849777816673d997ea97a2`.
  The database query finds one matching identity and one job for the root.
- Terminal binding: project `erdos-97-96-exact17-child34`, backend `cadical`,
  profile `sat`, core limit 1, timeout 3600 s, march timeout 900 s; daemon
  SHA `f89994bc10fcad69a264d8efbd7d76b8203c94c08f22b4536d3b473a12cee089`;
  solver SHA `0ee355934249f1b3f14a20928877391a87a0dd51326cf8c6135f75cba0b6b965`.
  Live `piqc status`, `version`, and `solvers` agree with these bindings.
- Timestamps in terminal status: created 1786634908, confirmed 1786635493,
  started 1786635494, completed 1786636118; wall time 622.950 s. The 7,788-byte
  solver log has SHA `4070e1829e50f6ccf5aa19460b7539afe70ff2dbf6ef61dee4df678849efb2b5`,
  `s SATISFIABLE`, a complete 308-literal `v` assignment terminated by `0`,
  and `c exit 10`.
- Independent replay (`independent_replay.py`) parses every CNF line itself,
  checks assignment domain/range and exact header, and verifies all
  5,847,256 clauses. Result: PASS. The log assignment independently matches
  the custody model; `schema_and_log_audit.py` also returns PASS.
- Final artifact has the exact expected top-level key set. Model check is
  SATISFIED with 308 assigned variables, all clauses checked, `ce_scope=null`,
  `announcement=NONE`, and detail explicitly states that the project declares
  no counterexample scope. No CE claim is made. Next gate is
  `mandatory_general_theorem_search`.

## Reproducible audit outputs

- `independent-replay.json`
- `schema-log-audit.json`
- `live-piqc-status.txt`
- `live-piqc-bindings.txt`
- `db-exact-job.txt`
- `db-same-root-jobs.txt`
- `child34-audit-ingress-run.txt`
- `child34-audit-local-run.txt`
