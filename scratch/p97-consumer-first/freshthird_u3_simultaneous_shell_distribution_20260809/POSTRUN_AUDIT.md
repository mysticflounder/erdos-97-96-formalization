# Post-run audit

This was one substantive wave only.  No CEGAR refinement or second wave was
started.

- The known controls were checked first: `smoke_sat` was SAT in Z3 and cvc5;
  `smoke_unsat` was UNSAT in both.
- The predecessor q-deleted schema was preserved: 468 strengthened confined
  patterns, with reason counts `378,54,0,18,0,12,6` in the recorded priority
  order, and the same 12-case matrix.
- All 12 cases ran with both engines, strictly sequentially.  There were 24
  primary solver calls, no timeouts, no nonzero exits, and empty solver stderr.
- All 16 SAT model readbacks passed the independent finite checker.  The live
  models were escape-mode models, not shell realizations.
- The generated live SMT contains six shell-arm blocks.  Each block declares
  four `shell_pc_*` bits and one `shell_outside_*` integer and asserts the
  licensed ≤2 intersection, ≥2 complement, and total-cardinality-4 equations;
  the readback checker independently checks these equations whenever mode 2
  is materialized.
- Source hashes are recorded in `manifest.json`.  The predecessor/current
  comparison files preserve the predecessor hash record and expose source
  drift in `U3ToU5Terminal.lean`, `TwoSourceClosure.lean`, and
  `U5GlobalIncidenceSupport.lean`; the active manifest hashes are the current
  source snapshots used by this wave.

## Semantic boundary

The live result is **SAT-abstraction**.  The all-prefilter result is bounded
finite **semantic-UNSAT** under the audited ingress clauses.  Leave-one-out
UNSAT cases remain **relaxation-UNSAT**.  Nothing here is a Euclidean
counterexample, Euclidean realization, universal closure, or Lean proof
closure.
