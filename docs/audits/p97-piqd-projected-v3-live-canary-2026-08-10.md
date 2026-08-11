# P97 projected-static-v3 PIQD live canary

Date: 2026-08-10

Status: authenticated finite discovery checkpoint; no proof, theorem-coverage,
universal-lift, Lean-closure, or publish-spine claim.

## Outcome

The projected-static-v3 incremental discovery route completed its bounded live
qualification canary and an independent offline audit. The historical current
formula was `SAT`; after appending exactly the unit clause `(91)`, the same
sequential PIQD session returned assumption-free `UNSAT` with an empty core.
The session was closed exactly once.

The authenticated output is preserved at:

```text
scratch/p97-piqd-projected-v3-production-canary-20260810-v5/run
```

The public offline validator returned:

```json
{"authenticated":true,"empty_core":true,"global_obstruction":false,"historical_current_sat":true,"lean_closure":false,"local_drat_required":true,"piqd_discovery_only":true,"production":true,"proof_verified":false,"schema":"p97-piqd-projected-static-v3-validation/v3","solve_count":2,"statuses":["SAT","UNSAT"],"terminal_unsat":true,"theorem_coverage":false}
```

PIQD `UNSAT` is deliberately observational here. A fresh local exact proof
run, independently checked DRAT/LRAT, source entitlement, and a named Lean
consumer remain required before this can contribute proof closure.

The proof-blueprint anchor remained
`Problem97.ATailFrontierLiveClosure.false_of_criticalPairFrontier`, open and
off this finite lane.

## Authenticated inputs

- historical source commit:
  `942ba5770a847b9b253916191c9f1bfb3c8946c2`;
- source manifest SHA-256:
  `986e1204d820061c5173604ec5ced25beed6a3e94ea69935283ee8a1e9ba8628`;
- producer SHA-256:
  `74ddf30ef786b9102b34fda4ecf6ed48ea1334ce877a063f54dfaa238197cded`;
- wave SHA-256:
  `abdf66bb69b726a4d75870d0c8ea442bb17a6cc4b5cb3b34761a7ec07a10ba00`;
- variable-map SHA-256:
  `e5f7801c91152dd27a201c7014ae801b8036551e770092ae9419f03321c81802`;
- raw identity:
  `62faf51e4d6b4c926bb0e21675245d51788809f663a6e50395fcb2f94fcce8cf`.

The producer job
`a6282cd3-16d9-4983-9092-f142b608aaf2` was safely reused. The adapter records
`existing=true`; reuse receives no freshness claim. It reauthenticated the
producer manifest, prepared identity, exact job-scoped CNF bytes, completed
`SAT` status, requested core limit, solver-process attestation, and the
independent source and variable-map inputs before opening the incremental
session.

## Exact formula sequence

The independent audit reconstructed these exact artifacts:

| Artifact | Bytes | Clauses | SHA-256 |
|---|---:|---:|---|
| source snapshot | 436,438 | n/a | `a57d2c9b2f45617a068d231cf300c49c36b623908836c05e1f9dffcc7f616e08` |
| base CNF | 1,102,319 | 58,319 | `c9c302d28ef5571f82f802c03f3a487576c648768d948e6d48a0c6da36ae8e18` |
| historical current CNF | 1,980,853 | 71,856 | `b36b25731a5475d32afc74d13950e388fad68183d388704fd3ad311ba925e5d5` |
| historical suffix | 878,534 | 13,537 | `0b5b08dcfe5ec09ed1ce3b948ebf41c59c26a92c6183ca1acbca58cf76c353a8` |
| terminal CNF | 1,980,800 | 71,857 | `03d31c9fb1125c3fe8abd7282e994ecb3c0eb6ee43fe6dc3667f5f9b62a19662` |

The session UUID was `38f4a0e9-0453-4c97-9564-4e19bf7fa0d0`.
Its authenticated journal has SHA-256
`e20e38ba793b2093222b2e33e30cab7e07045cda72aad117a9b41225c59e5ca1`.
The exact sequence was:

1. open from the stable base formula;
2. append the 13,537-clause historical suffix;
3. solve `SAT`, fetch a total model, and replay it against the exact current
   CNF;
4. append only `(91)`;
5. solve assumption-free `UNSAT` with an empty core; and
6. close exactly once.

The daemon's post-close state independently reported 71,857 clauses, maximum
variable 1,194, two solves, final status `UNSAT`, solve index 2,
`last_assumption_free=true`, and `last_terminal_unsat=true`.

## Runtime identity and resource boundary

The pre- and post-session daemon-version snapshots agreed on SHA-256
`6087acb84cf179821240625b60f93502e37eb8b5362840a70b810103c9d1b464`.
The selected worker was `piqd-satworker-cadical-3.0.0`, SHA-256
`0ee355934249f1b3f14a20928877391a87a0dd51326cf8c6135f75cba0b6b965`.

`requested_core_limit=1` and the one-process attestation belong to the producer
job. The incremental-session API does not attest OS CPU affinity, thread
count, or a hardware core allocation; those claims remain false. The
qualification records the daemon's `max_var=1000000` as a session ceiling, not
as an attestation that raw prepare enforced it.

## Failed preflights retained as regression evidence

Four earlier outputs were preserved. Each exposed a P97 adapter defect rather
than a PIQD daemon defect:

1. v1 incorrectly expected blob/identity hashes in the job status response;
2. v2 rejected the documented optional session `solver_stats` object;
3. v3 applied the 1 MiB control-response cap to a valid 1.1 MiB CNF blob; and
4. v4 treated `last_terminal_unsat=null` after `SAT` as invalid instead of the
   correct tri-state lifecycle value.

The qualification, generic incremental adapter, fake transports, and capped
test runner now carry regressions for these failures. Model and receipt routes
remain separately bounded artifact routes; they are not described as fixed
control payloads.

## Remaining work

1. Re-run the exact terminal CNF locally with proof production enabled.
2. Independently validate the resulting DRAT/LRAT against the authenticated
   terminal bytes.
3. Establish source entitlement and the finite-to-required-scope bridge.
4. Connect the checked result to a named Lean consumer and re-run the
   proof-blueprint spine and axiom audits.
