# P97 exact-17 cap-nine all-core replay audit

Date: 2026-08-08

## Scope

This note records the soundness repair and successor search for the exact-17
cap-nine Rigid221 CEGAR lane.  It is a finite search checkpoint for
`false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_card_eq_seventeen_secondCapNine`.
It is not exact-17 closure, closure of the parent Rigid221 production leaf, or
full P97 closure.

## Repaired replay contract

The prior two-Kalmanson stage checked only that some member of the theorem
family was present.  Its equality-label exporter could then substitute a
different core from the minimized row system.  That authenticated a family
hit without proving that the exact labels, rows, cyclic order,
quadrilaterals, and cancellation path used by the exported clause were the
certified theorem instance.

The repaired bank now fails closed through two operations:

1. `certify_two_kalmanson_cancellation` reconstructs and checks the exact
   serialized core, including boundary and source labels, selected rows, both
   inequality forms and quadruples, endpoint comparison, permutation, and
   complete cancellation path.
2. `enumerate_two_kalmanson_cancellations` deterministically enumerates every
   exact admissible core in the complete verified row system.  It never uses a
   minimized family representative as a proxy for the source model.

The focused regression suite passes: 36 tests and 42 subtests.  Ruff and the
Python compile check also pass.

## Historical-bank migration

The direct-six bank was migrated by rechecking parent-artifact hashes and the
current exact certifiers.  It rescanned 274 legacy two-Kalmanson occurrences
into 408 exact cores before bank-level deduplication.  The resulting bank has
1,111 deduplicated records: 938 formalized records, 173 positive weighted
records, and 63 distinct two-Kalmanson records.

Exhaustive inspection of the twenty v10 source models found 750 exact
serialized cores and 596 distinct endpoint-comparison clauses.  The earlier
first-hit export had retained only twenty of those cuts.

## Corrected v11 round

The v11 artifact has:

- 74,813 variables;
- 2,503,787 clauses;
- 1,108 learned nogoods;
- 640 equality-label cuts; and
- CNF SHA-256
  `aede44af37dd7e157a6f289deedcdf7f75b41a9501d01729dec5969152ca31d7`.

The independent validator regenerated it byte-for-byte, replayed a CaDiCaL
model, checked three source Z3 models and 145,975 structural clauses, and
replayed all twelve static theorem families plus the transitive
convex-five-point digests.  It terminated `PASS`.

A fresh 24-seed CaDiCaL portfolio (seeds 1201--1224, `nice +10`) returned 24
`SAT` assignments.  Every assignment passed DIMACS checking, source-Z3
pinning, the independent source model checker, and exact theorem-bank replay.
All 24 contained an already formalized two-Kalmanson cancellation; two also
contained a six-point two-circle arc-overtake obstruction.

Across those models the complete-model census found:

- 900 exact serialized two-Kalmanson cores; and
- 684 distinct endpoint-comparison clauses.

These are additional instances of existing mathematics, not new theorem
schemas.  Consequently the v11 round did not close the finite target.

## v12 configuration guard and corrected v12t successor

The first v12 exporter invocation replayed all 44 authenticated analyses
(twenty v10 and twenty-four v11), but omitted the admitted
`--transitive-two-circle` family.  Its independent validation passed for the
candidate actually requested, but comparison with the v11 manifest exposed
the non-monotone configuration immediately: the candidate had only 285
variables and no transitive label variables.  No solver wave was launched
from it.  It is retained as a diagnostic artifact, not a successor result.

The corrected v12t invocation preserves every v11 clause family and adds the
new exact cores.  It produced:

- 74,813 variables;
- 2,504,349 clauses;
- 1,132 learned nogoods.

Its equality-label block contains 1,178 clauses, compared with 640 in v11.

The independent validator regenerated v12t byte-for-byte, replayed a CaDiCaL
model, checked three source Z3 models and 145,975 structural clauses, and
replayed the complete static bank.  It terminated `PASS`.

A fresh 24-seed CaDiCaL portfolio (seeds 1301--1324, `nice +10`) then returned
24 `SAT` assignments.  Every assignment passed DIMACS checking, source-Z3
pinning, the independent source model checker, and exact theorem-bank replay.
Twenty-two assignments had one bank hit and two had two hits.  Every assignment
again contained an exact two-Kalmanson cancellation.

The all-core census over these assignments found:

- 642 exact serialized two-Kalmanson cores;
- 499 model-local endpoint clauses; and
- 498 distinct endpoint clauses globally.

Only one endpoint clause recurred across the entire portfolio.  Thus a further
round that merely appends these 498 concrete endpoint clauses would eliminate
the observed assignments, but the near-total lack of reuse is evidence against
blind clause-by-clause convergence.  The next step must generalize this theorem
family in the encoding or otherwise integrate the global linear metric theory;
v13 should not be launched solely as another accumulation round.

A future `UNSAT` result would additionally require an exact proof replay and
the existing source-to-finite Lean ingress before it could close the on-spine
cap-nine theorem.

## Status classification

This work is a **finite CEGAR soundness repair and strengthened search round**.
The source-facing replay contract is materially stronger, but no theorem or
production `sorry` has been closed by the results recorded above.
