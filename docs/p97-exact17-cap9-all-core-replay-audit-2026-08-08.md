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

## Cyclic schema H and the v13 canary

The recurring-motif audit isolated a source-clean six-point obstruction,
schema H.  In increasing cyclic order `a < b < c < d < e < f`, it uses the
four selected-row incidences

- row `a` contains `b,d`;
- row `c` contains `e,f`;
- row `e` contains `d,f`; and
- row `f` contains `b,e`.

Three strict Kalmanson inequalities and the four shell equalities contradict
by linear arithmetic.  Increasing- and decreasing-order metric theorems,
direct selected-row consumers, and cyclic-shift adapters are banked in
`KalmansonFourEqualitySchemas.lean`.  Their declarations do not depend on
`sorryAx` or compiler trust.

The authenticated v13 export added 148,512 schema-H clauses.  It has 74,813
variables and 2,652,861 clauses; independent regeneration and validation
terminated `PASS`.  Four fresh CaDiCaL seeds (2101--2104) remained `SAT`.

## Analyzer audit and canonical replay

An obsolete scratch analyzer was found to mark exact rows from the legacy
fixed-center list and to scan the legacy default cyclic order.  It did not
decode the selected fifth exact row from the DIMACS assignment.  This defect
affected only that diagnostic analyzer, not the source CNF or its independent
validator.

The production analyzer is
`analyze_source_faithful_boolean_model.py`.  It pins the complete DIMACS
assignment back into the source Z3 model, derives exactness from the decoded
metric rows, runs the independent model checker, and records the normalized
cyclic order.  Replaying all four v13 canaries through this canonical path
passed every gate.  Their selected fifth exact centers are respectively
`6, 7, 7, 6`, and all four still hit the source-clean generic
two-Kalmanson-cancellation consumer.

The cyclic motif census gives a useful negative strategic result.  The four
v13 canaries contain 87 exact cancellations across 62 normalized motifs, but
none requires a new motif class: motifs already seen in v10 cover all four.
A greedy historical cover uses three motifs.  This supports compiling exact
generic cancellation certificates rather than continuing a one-schema-at-a-
time staircase.

## Corrected all-history v14b replay

The first v14 all-history export was internally sound and independently
validated, but its input list contained only 48 analyses: the twenty v10,
twenty-four v11, and four v13 reports.  It accidentally omitted all twenty-four
v12t reports.  It is therefore retained as a valid but incomplete diagnostic,
not as the intended monotone all-history successor.

The corrected v14b export replayed all 72 authenticated analyses.  It produced:

- 74,813 variables;
- 2,653,460 clauses;
- 1,160 learned nogoods;
- 1,749 equality-label clauses; and
- CNF SHA-256
  `6ea9fec71c7bb85f8260593a33bc4f22e28b7088d3c454bea0237a9d112b03da`.

The independent validator regenerated the candidate exactly, checked all
145,975 structural clauses and thirteen static theorem families, round-tripped
three source models, and terminated `PASS`.  Four fresh CaDiCaL seeds
(2201--2204) remained `SAT`.  All four assignments passed DIMACS checking,
source-Z3 pinning, the independent source checker, and the direct-CNF theorem
bank check.  Thus v14b still does not close exact 17.

## Cyclic schema I and the v15 successor

Although each v14b assignment still had an exact two-Kalmanson cancellation,
the normalized historical motif census found a stronger reusable fact: one
six-point motif already present in v10 occurs in all four v14b assignments.
For cyclic order `a < b < c < d < e < f`, schema I uses

- row `a` containing `b,e`;
- row `d` containing `b,e`;
- row `b` containing `c,f`; and
- row `e` containing `c,f`.

The Kalmanson inequalities on `(a,b,e,f)` and `(b,c,d,e)` reduce under these
four shell equalities to the contradictory strict comparisons `ec < bc` and
`bc < ec`.  Increasing- and decreasing-order metric theorems, direct
selected-row consumers, and both cyclic-shift adapters are now banked in
`KalmansonFourEqualitySchemas.lean`.  Lean elaboration is clean; all six new
declarations have axiom closure exactly `propext`, `Classical.choice`, and
`Quot.sound`.

The direct exporter and independent validator now generate schema I as a
separate static clause family.  The exporter additionally fails closed unless
the named increasing, decreasing, and cyclic-shift Lean consumers for schemas
G, H, and I are present, hashes that Lean source into the artifact provenance,
and records the consumer names in `cut_admission`.

The authenticated v15 export replayed all 72 analyses and added 74,256
schema-I clauses.  It has 285 variables and 2,328,167 clauses, with CNF
SHA-256
`b2e94d13ac45a54e497d4967af24c9a6fa0c785d508c8aa3e1fe50dfb5b40d15`.
The independent validator regenerated the candidate exactly, checked all
145,975 structural clauses and fourteen static theorem families, round-tripped
three source models, and terminated `PASS`.  Four fresh CaDiCaL seeds
(2301--2304) remained `SAT`.  Every assignment passed DIMACS checking,
source-Z3 pinning, the independent source checker, and the direct-CNF theorem
bank check.  The four seeds normalized to the same selected-row model, with
fifth exact center `6`.

## Cyclic schema J and the v16 successor

Mining that canonical v15 survivor produced another source-clean six-point
obstruction.  In cyclic order `a < b < c < d < e < f`, schema J uses

- row `a` containing `b,d`;
- row `b` containing `a,c`;
- row `e` containing `a,b`; and
- row `f` containing `c,d`.

The strict Kalmanson inequality on `(a,b,d,e)` reduces under the first and
third shell equalities to `bd < ab`.  The complementary strict Kalmanson
inequality on `(b,c,d,f)` reduces under the second and fourth shell equalities
to `ab < bd`.  Increasing- and decreasing-order metric theorems, direct
selected-row consumers, and both cyclic-shift adapters are banked in
`KalmansonFourEqualitySchemas.lean`.  Lean elaboration is clean; all six
declarations have axiom closure exactly `propext`, `Classical.choice`, and
`Quot.sound`.

The authenticated v16 successor added schema J as an independently regenerated
static clause family and replayed the 72 inherited analyses plus the four
authenticated v15 canaries.  It has 285 variables and 2,476,680 clauses, with
CNF SHA-256
`3000260a6d56798a27c6c5b3f094e6bed772786e44644e7a3a6dc06c4b3301b3`.
The independent validator regenerated the candidate exactly, checked all
145,975 structural clauses and fifteen static theorem families, round-tripped
three source models, and terminated `PASS`.

Four fresh CaDiCaL seeds (2401--2404) remained `SAT`.  All four assignments
passed DIMACS checking, source-Z3 pinning, the independent source checker, and
the direct-CNF theorem-bank check.  They normalized to the same selected-row
model, with fifth exact center `4`.  Unlike the preceding rounds, that model
needs no new geometric schema: it has eight hits in the existing formalized
bank, including two-circle bisector-order, convex-five-point, metric-alternative,
generic two-Kalmanson, exact-off-circle, duplicate-center, and perpendicular-
bisector consumers.  The v17 successor therefore replays those existing
consumer-backed cuts rather than adding another large static motif family.

## Status classification

This work is a **finite CEGAR soundness repair, reusable theorem promotion, and
strengthened search round**.  Schemas I and J are cardinality-independent
geometric theorems, but the finite cap-nine target remains open and no
production `sorry` has yet been closed by the results recorded above.
