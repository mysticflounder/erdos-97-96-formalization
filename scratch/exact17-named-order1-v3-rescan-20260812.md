# Exact17 NamedOrder-1 v3 rescan (2026-08-12)

Read-only audit.  The ten canonical chain analyses are children 22--31
(`piqd-twenty-second-root-model-analysis.json` through
`piqd-thirty-first-root-model-analysis.json`); `equal-k4` is the separate
child-01 analysis and is intentionally excluded.  The v2 interpretation used
`reverse((0,6,8,11,10,9,12,7,2,15,16,3,4,5,1,13,14))`; v3 uses the explicit
Lean `NamedOrder 1` table, swapping labels 9 and 12:
`(0,6,8,11,10,12,9,7,2,15,16,3,4,5,1,13,14)`.

The scanner was run directly through the read-only audit helper
`scratch/audit_named_order1_v3.py` against the current analysis rows.  No
solver, daemon, or production artifact was started or changed.  Full per-hit
diffs are in `scratch/rescan-*.txt`; the combined exploratory log is
`scratch/exact17-named-order1-v3-rescan.txt`.

## Per-artifact result

`old` and `corrected` are complete canonical scanner-record counts; `+` and
`-` count records present only after/before correction.

| child | old | corrected | + | - |
|---:|---:|---:|---:|---:|
| 22 | 6 | 6 | 5 | 5 |
| 23 | 1 | 1 | 1 | 1 |
| 24 | 5 | 5 | 4 | 4 |
| 25 | 6 | 5 | 4 | 5 |
| 26 | 5 | 5 | 4 | 4 |
| 27 | 1 | 1 | 1 | 1 |
| 28 | 5 | 5 | 3 | 3 |
| 29 | 6 | 5 | 5 | 6 |
| 30 | 2 | 2 | 2 | 2 |
| 31 | 7 | 7 | 5 | 5 |
| **total** | **44** | **42** | **34** | **36** |

Thus this is not a harmless relabeling: every artifact has a different
canonical occurrence/orbit set, and children 25 and 29 also change the count.
The changed consumer declarations are:

* `Problem97.Census554.FourPointTwoCircleBisectorOrderCore.false_of_core` and
  `.false_of_core_of_neg`;
* `Problem97.Census554.ConvexFivePointCore.false_of_core` and
  `.false_of_core_of_neg`;
* `Problem97.CapCrossingKalmansonBridge.false_of_selected_rows_in_five_ccw_order`;
* `Problem97.CapCrossingKalmansonBridge.false_of_four_selected_rows_in_seven_ccw_order_C_of_decreasing`;
* `Problem97.CapCrossingKalmansonBridge.false_of_four_selected_rows_in_seven_ccw_order_L`
  and `.false_of_four_selected_rows_in_seven_ccw_order_L_of_decreasing`;
* `Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate.false_of_twoKalmansonCancellationData_of_check`.

## Lean source checks

The nine affected generic consumer declarations above (five theorem families)
are source-realization
theorems, not solver claims.  Targeted `#print axioms` (stdin Lean check,
imports only; no project build) reports only `[propext, Classical.choice,
Quot.sound]` for all of them.  Their source declarations are at:

* `Census554/ConvexFivePointCore.lean:151,169`;
  `Census554/FourPointTwoCircleBisectorOrderCore.lean:75,86`;
* `ATail/CapCrossingKalmanson.lean:380`;
  `ATail/KalmansonFourEqualitySchemas.lean:346,2177,2214`;
* `ATail/FrontierLiveClosure/GenericRowNogoodCertificate.lean:513`.

Each affected successor aggregate is also independently quantified over
`SourceRealization A` by the following declarations (all ten targeted
`#print axioms` checks pass with the same set plus `Lean.ofReduceBool` and
`Lean.trustCompiler`, due to the existing native reduction in the aggregate
clause proofs; no `sorryAx` appears):

`sourceAssign_twentySecondModelRefinementClauses` (child 22, source line 741),
`sourceAssign_twentyThirdModelRefinementClauses` (23:207),
`sourceAssign_twentyFourthModelRefinementClauses` (24:707),
`sourceAssign_twentyFifthModelRefinementClauses` (25:718),
`sourceAssign_twentySixthModelRefinementClauses` (26:523),
`sourceAssign_twentySeventhModelRefinementClauses` (27:223),
`sourceAssign_twentyEighthModelRefinementClauses` (28:2001),
`sourceAssign_twentyNinthModelRefinementClauses` (29:1469),
`sourceAssign_thirtiethModelRefinementClauses` (30:1174), and
`sourceAssign_thirtyFirstModelRefinementClauses` (31:42).

## Impact classification

* **Historical NamedOrder-1 model-hit provenance: FAIL / must be rescanned.**
  The v2 rows were scanned under the wrong order, so the old occurrence/orbit
  records cannot be treated as evidence that the corresponding NamedOrder-1
  model was cut.  This is a soundness failure of the historical *model
  attribution* (and explains the child-24 mismatch), not evidence that the
  geometric theorem statements are false.
* **Completeness: FAIL for v2.**  The corrected sets add 34 records and remove
  36; children 25 and 29 change cardinality.  Any old bank that was consumed
  as the complete NamedOrder-1 occurrence set is incomplete/incorrect.
* **Current Lean clause soundness: PASS conditional on its existing trust
  boundary.**  The generic source consumers and all ten current aggregate
  `SourceRealization` theorems check without `sorryAx`; the aggregate proofs
  retain the pre-existing `Lean.ofReduceBool`/`Lean.trustCompiler` native
  trust.  This audit does not promote the old JSON banks or prove that the
  historical generated CNFs used the corrected occurrence set.

Bottom line: v3 explicit-order rescans are required before relying on any
historical NamedOrder-1 occurrence/orbit claim.  The correction changes the
model-derived bank, while the currently checked source theorem families remain
independently source-realization-proved under their existing native-reduction
trust boundary.
