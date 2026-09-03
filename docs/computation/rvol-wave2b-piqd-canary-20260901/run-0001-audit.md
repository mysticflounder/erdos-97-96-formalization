# RVOL Wave 2b PiQD canary — run 0001 audit

**Lane:** `rvol-wave2b-piqd-canary-20260901`  
**Run:** `run-0001`  
**Status:** verified partial census; `MAXITER`, not closure

## Declared cell

The contract is the discovery-only `Fin 9` natural-cyclic-order cell in
`docs/specs/rvol-wave2b-piqd-canary-v1.json`. It has 72 semantic row-membership
variables, no auxiliary variables, and 4,551 root clauses. Nine byte-identical
clauses are intentionally retained because source cover and the corresponding
strong-connectivity cuts are distinct declared root producers.

The root formula asserts exactly four memberships per row, excludes each row's
center, covers every source, bounds row intersections and pair codegrees by two,
asserts strong support connectivity, and enforces the shared-pair alternation
condition. The source-to-cell bridge is not proved. Nothing in this run proves a
source, `Card18`, cap, MEC, arbitrary-cardinality, or Lean theorem.

## PiQD execution and custody

The explicitly reviewed root CNF had SHA-256
`778d14255f26fac6176f721cf4b1bd2f14d90fdea4bbb10c3f9e2edd316a5d1f`.
The PiQD-only loop used session `6b74399e-4baf-4ee2-8855-756b79e5fd57`, one
requested core, and a conflict limit of 1,000,000 per solve. It completed 64
SAT solves and 64 admitted semantic cuts in about 6.3 seconds, then stopped at
the contract's iteration budget. The final CNF has 4,615 clauses and SHA-256
`fd75cbc6c3884e835b7d0a99401054ee6f7e5888795e9c93e1feb13e456f8e0b`.
The final formula was not solved after the last cut, so its status is unresolved.

The independent verifier now validates the receipt envelope and every receipt:
session, lane, count, contiguous solve index, empty assumptions, status,
conflict limit, model-recorded flag, parent clause count, and parent byte count
and SHA-256. PiQD's `base_bytes` and `base_sha256` cover the canonical clause
body, omitting the DIMACS header; all 64 reconstructed bodies match. A direct
export of the closed PiQD session is byte-identical to the independently
reconstructed `artifacts/final.cnf`.

The receipt `result_sha256` values are shape-checked but cannot be bound to the
ledger assignments because raw PiQD result/model artifacts were not retained.
The producer called session close successfully, but this run has no independent
close receipt. These are custody limitations, not reasons to reject the verified
formula and cut chain.

## Independent replay

The verifier reconstructs the variable map, all root predicates, every model,
decoded row system, equality path certificate, Kalmanson reduction, exact cut,
parent/child CNFs, record chain, terminal, receipt parent, and final session
formula without importing the producer. It reports `VERIFIED` with scope
`AUTHENTICATED_FINITE_ABSTRACT_CELL_ONLY`.

The 11 targeted tests cover the exact variable map and inventory, 300
independent CNF/predicate comparisons plus a cyclic positive assignment,
canonical zero-vector detection and forged-cut rejection, a no-certificate
control, producer-to-verifier replay, fail-closed statuses, idempotent resume,
PiQD open failure, and receipt-parent corruption rejection. Ruff check and
format check pass. A separate producer differential check covered 3,000 row
systems.

## Mandatory post-wave pattern mine

All 64 sampled models are `SPURIOUS_WITH_REFINEMENT`, and all certificates are
single-inequality `ZERO_VECTOR` certificates: 48 use K1 and 16 use K2, across
20 inequality/quartet shapes. There are no `OPPOSITE_PAIR` certificates. The
equality-component partitions of the four signed distance terms are exactly:

- all four terms in one component: 29;
- first positive paired with first negative and second with second: 22;
- first positive paired with second negative and second with first: 13.

Thus an empty reduced vector must not be read as an all-four equality. The
general reusable schema is coefficient balance in the equality quotient: a
strict K1 or K2 inequality is impossible whenever its positive and negative
distance terms cancel componentwise. Existing repository candidates found by
the bounded reuse preflight include
`false_of_four_ccw_late_centers_bisect_early_pair`,
`false_of_four_ccw_middle_centers_bisect_endpoint_pair`,
`dist_add_dist_lt_diagonal_sum_of_ccw`, and
`false_of_four_ccw_three_shell_equalities_012_102_301`. The dynamic
equality-quotient version is not yet a direct Lean theorem candidate worth
promoting ahead of the source-to-cell bridge.

Every sampled model also has support indegree four at every vertex. This is an
empirical `0/64`-counterexample finite-cell conjecture, not a theorem: `MAXITER`
prevents universal closure. All 64 cuts are unique; 71 of the 72 membership
literals occur in their antecedent union, with `(8,6)` the sole omission. No
membership literal is common to every model. These data support a larger
successor census, but not a fixed-literal or fixed-certificate shortcut.

## Promotion boundary and next cell

There is no UNSAT result and no DRAT/LRAT proof. The only authenticated result
is a partial census of 64 finite abstract models, each rejected by a checked
local Kalmanson cut. The next immutable cell should retain the same semantic
contract, raise the bounded iteration budget, and preserve the stronger
receipt/session-export gate. Any later finite exhaustion would still require
the missing source-to-cell bridge before Lean promotion.
