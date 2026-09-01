# Generic A-ROW n=18 Wave 1

This is a bounded generic A-ROW incidence experiment, not Card18.  It
does not test metric realizability.  SCC modes assume the guarded
conditional `MINIMAL-FAITHFUL-CONSEQUENCE` consequence.

Controls: PASS.

| mode | status | candidates | survivors | SCC cuts | verified UNSAT |
|---|---:|---:|---:|---:|---:|
| baseline | PARTIAL_SURVIVOR_CAP | 16 | 16 | 0 | false |
| dual2 | PARTIAL_SURVIVOR_CAP | 16 | 16 | 0 | false |
| scc | PARTIAL_SURVIVOR_CAP | 16 | 16 | 0 | false |
| dual2_scc | PARTIAL_SURVIVOR_CAP | 16 | 16 | 0 | false |

`PARTIAL_SURVIVOR_CAP` and `PARTIAL_CANDIDATE_CAP` are bounded
checkpoints. `UNKNOWN` is inconclusive. `COMPLETE_UNSAT` is emitted
only after fresh proof production over the byte-identical terminal
CNF and successful `drat-trim` replay; even then the claim is limited
to that exact finite CNF and its recorded conditional clauses.

Canonical coverage is identity-only. Motif coverage is explicitly
bounded to the first lexicographic subsets and uses a deterministic
WL-refined fingerprint, not an exact isomorphism canonical form.
