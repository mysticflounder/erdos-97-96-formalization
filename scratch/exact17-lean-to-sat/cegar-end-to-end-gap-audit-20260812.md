# Exact-17 CEGAR end-to-end gap audit — 2026-08-12

Status: read-only audit; child 32 remains blocked.

## Stage verdicts

- SAT model to theorem scan: **BLOCKED**.  The no-terminal path in
  `analyze_exact17_thirty_first_root_model.py` can set
  `production_authenticated = true`; the pinned analysis lacks a model digest,
  PIQD job identity, and terminal completion identity.
- General theorem enumeration: **bounded completeness only**.  The producer
  exhausts registered two-Kalmanson quads/forms/groups/permutations and fails on
  its core limit, but this is neither an exhaustive general-bank scan nor a
  proof of every automorphic copy.
- Support minimization and orientation: inclusion minimization and the named
  order plus its reversal are explicit.  No independent structural clause-set
  completeness check exists yet.
- Lean clause count: generated evidence reports 237 records, 135 supports, 84
  minimal supports, 336 clauses, but promotion is blocked by the row-choice
  projection mismatch.
- Raw DIMACS: **missing for child 32**.  No parent-prefix, header, clause-order,
  duplicate, or omission validation exists for the proposed 5,847,240-clause
  root.
- Next-root ingress/runner: **missing for child 32**.  The existing wrapper is
  for child 31 and does not establish child-32 publication or PIQD identity.

## Required repair

1. Require a complete authenticated PIQD terminal receipt for production
   theorem mining and bind the job, CNF, model, daemon, backend/profile, and
   completion identities.  No-terminal analysis must be diagnostic-only.
2. Preserve full producer-record replay but project and validate exactly the
   row choices consumed by the Lean cancellation paths.
3. Publish the Lean shards/coordinator/ledger immutably under a strict fixed
   schema and verify every bound identity before downstream use.
4. Add a child-32 exporter and validate raw bytes, parent prefix, header, clause
   sequence, duplicate policy, and Lean-owned hash before provisioning.
5. Add a hash-pinned child-32 runner that rejects unvalidated publication and
   cross-checks PIQD daemon/backend/profile/job identities.

The independently replayed child-31 model remains an authenticated finite SAT
result; these defects block reuse and child-32 promotion rather than changing
that replay result.
