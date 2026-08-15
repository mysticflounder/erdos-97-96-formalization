# P97 direct-solver census (2026-08-10)

Machine-readable source of truth: `p97-direct-solver-entrypoint-census-20260810-v1.json`.

The active boundary inventory is 21 grouped entries: raw-DIMACS CaDiCaL callers, the local ctypes/IPASIR persistent seam, QF_NRA Z3/cvc5 library and subprocess probes, msolve, and Singular. Existing PIQD boundaries are recorded separately so “already routed” is not confused with “caller migrated.” No active Prover9/Mace4 invocation or local march_cu invocation was found.

## Ranked next lanes

1. Qualified static: inject the static runner at `sat_generate.run_cadical` consumers (`phase3_structural_cegar`, projected-static-v3, controls3, and card-head encoding). Keep DRAT and CERT-001 observational.
2. Incremental: replace the local `IpasirCadicalFactory` seam in projected-static-v3 with the committed producer-neutral incremental adapter; reconcile frontier/receipts and claim no learned-state persistence.
3. Source-semantic SMT: route the QF_NRA producers and metric probes through the existing z3-then-cvc5 adapter, preserving source packets, named cores/models, and UNKNOWN.
4. Backend/certificate gap: msolve, Singular, and terminal DRAT require PIQD maintainer/backend or source-to-proof work; caller edits cannot close those gaps.

Blueprint session `019fdf9c` remains unchanged/open/off-spine. This census makes no theorem, source-entitlement, proof, or closure claim.
