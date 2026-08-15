PIQD SAT-SESSION-001: custody and retry fixes before persistent CEGAR migration

The existing SAT session API has enough solver functionality, but these are
blocking correctness/reproducibility gaps for P97's persistent CEGAR lane:

1. Make clause append acknowledgement-safe. Add an exact cumulative
   `expect_clauses`/frontier hash CAS and/or canonical request ID+hash. An exact
   replay returns the existing frontier and `replayed:true`; mismatched ID or
   expected frontier returns 409. Current journal-before-worker behavior plus an
   ambiguous HTTP failure can duplicate clauses on retry.

2. Make single solve idempotent, as requested for SMT in #4273. Bind canonical
   request ID/hash, assumptions, limits, include_model/core flags, starting
   clause/frontier hash, and solve index in response and receipt. Exact replay
   returns the committed result without launching another solve; mismatched
   reuse is 409. Batch semantics are not a substitute for timeout+model CEGAR.

3. Preserve the exact declared DIMACS variable universe in seeded sessions.
   Journal/export/status/receipts must retain `declared_num_vars`, including
   unused variables. Return a total assignment over exactly 1..declared_num_vars
   with an explicit stable completion policy. Current session behavior drops
   unused variables and completes unassigned variables differently from legacy
   P97 IPASIR, which can change refinement trajectories.

4. Bind terminal status to the exact last solve receipt and assumptions. A
   consumer must be able to distinguish assumption-free UNSAT from UNSAT under
   assumptions; only the former can be considered for terminal proof handoff.

5. Add operational resource custody for sessions: daemon-wide live-session
   worker cap, requested/attested solver-process count, and preferably per-
   session RSS/CPU-set enforcement. The static-job max-workers setting does not
   currently bound session workers. Keep core claims false unless OS-enforced.

Please add adversarial tests for response loss before/after journal and worker
commit, duplicate/mismatched request IDs, stale CAS, restart/revival, unused
declared variables, assumption-bound UNSAT, concurrent sessions at the cap, and
solver startup failure using the zero-process `SOLVER_DID_NOT_START` decision
from #4274. Report exact commit/API/tests here. P97 will keep the current fresh
certificate publisher and production opt-in closed until a semantic canary and
the existing performance gate pass.
