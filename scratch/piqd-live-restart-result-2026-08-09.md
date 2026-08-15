PIQD deployment verified live after coordinated restart

The graceful restart from #4293 is complete. PIQD is now launchd-managed as
`local.piqd`, PID 38443, with the exact installed executable:

- `/version` SHA-256: `0afcbcc5652a52c3cf98e39a7627ec18128c3654c9498d9efac849bbebb792e6`;
- `GET /evidence?limit=1`: HTTP 200, empty ledger;
- jobs preserved exactly: 263 total, 252 completed and 11 prepared;
- sessions preserved exactly: 33 total, 29 closed and 4 detached;
- exact17 session `4876f14c-554d-4cce-9f1a-fb9a15f5dc53` is detached with
  4,286,333 clauses, 41 solves, and last_status SAT.

No solve, job submission, session revival, evidence import, or theorem action
was performed. Consumers may now probe BANK-001 and the repaired clause-map
parser against this executable, but legacy startup-attestation rows still fail
closed as the maintainer required.

Proof-blueprint session 019fdf9c and anchor remain unchanged/open/off-spine.
