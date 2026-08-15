# Exact17 Lean-owned PIQD chain reauthentication (2026-08-12)

Read-only audit; no solver jobs or daemon restart. The C-G CNF is the immutable root; EqualK4 through the latest thirty-first CNF are children 01 through 31 (32 CNF entries, 31 adjacent edges).

Summary: 1 immutable root + 31 children; 31/31 model replays pass; 31/31 body-prefix/delta checks pass; 32/32 current local-hash blob checks pass; 45/45 final/live recorded-root checks pass; recorded root SHA missing for 7 early/model-only entries.

| entry | root CNF (sha prefix) | recorded/final/live | current blob | model exact replay | lineage delta |
|---|---|---|---|---|---|
| root C-G | `763bb4774a4d…` / 2,189,852 clauses | MISSING | PASS (local blob; recorded SHA missing) | MISSING | - |
| child 01 EqualK4 | `00e0e3e50e51…` / 2,268,460 clauses | job-sha | PASS (recorded/local equal) | PASS | PASS +78608 |
| child 02 TwoCircle | `2feebcbf67b3…` / 2,306,540 clauses | MISSING | PASS (local blob; recorded SHA missing) | PASS | PASS +38080 |
| child 03 ThreeRow | `009b34264ddc…` / 2,430,300 clauses | job-sha | PASS (recorded/local equal) | PASS | PASS +123760 |
| child 04 H-K | `a489fdf5ddbd…` / 3,618,396 clauses | MISSING | PASS (local blob; recorded SHA missing) | PASS | PASS +1188096 |
| child 05 Interleaved | `db8f493b4a83…` / 3,915,420 clauses | MISSING | PASS (local blob; recorded SHA missing) | PASS | PASS +297024 |
| child 06 EqualityChain | `d5c09fd5e139…` / 4,212,444 clauses | MISSING | PASS (local blob; recorded SHA missing) | PASS | PASS +297024 |
| child 07 PerpBisector | `38db47b94b1f…` / 4,756,988 clauses | MISSING | PASS (local blob; recorded SHA missing) | PASS | PASS +544544 |
| child 08 TwoKalmanson | `ae29c7b97602…` / 5,301,532 clauses | job-sha | PASS (recorded/local equal) | PASS | PASS +544544 |
| child 09 SwappedDE | `759507d020a0…` / 5,846,076 clauses | final 1 | PASS (recorded/local equal) | PASS | PASS +544544 |
| child 10 GenericCancellation | `7def1009b154…` / 5,846,080 clauses | final 1 | PASS (recorded/local equal) | PASS | PASS +4 |
| child 11 GenericCancellationSecond | `6ab37b78e0db…` / 5,846,084 clauses | final 1 | PASS (recorded/local equal) | PASS | PASS +4 |
| child 12 SecondConvexFivePoint | `f3b2abfd20ba…` / 5,846,088 clauses | final 1 | PASS (recorded/local equal) | PASS | PASS +4 |
| child 13 ConvexFivePointFourthRows | `82a0fe73b57b…` / 5,846,096 clauses | final 1 | PASS (recorded/local equal) | PASS | PASS +8 |
| child 14 FourPointTwoCircleBisectorRows | `5bfbfe47d669…` / 5,846,100 clauses | final 1 | PASS (recorded/local equal) | PASS | PASS +4 |
| child 15 FourRowTwoCircleBisector | `394b93e9e79f…` / 5,846,104 clauses | final 1 | PASS (recorded/local equal) | PASS | PASS +4 |
| child 16 FifthConvexFivePoint | `c8e6011fce2f…` / 5,846,112 clauses | final 1 | PASS (recorded/local equal) | PASS | PASS +8 |
| child 17 SixteenthModelRefinements | `f02af969370d…` / 5,846,144 clauses | final 1 | PASS (recorded/local equal) | PASS | PASS +32 |
| child 18 SeventeenthModelRefinements | `40497f4c5450…` / 5,846,160 clauses | final 1 | PASS (recorded/local equal) | PASS | PASS +16 |
| child 19 EighteenthModelRefinements | `534ae4fb643f…` / 5,846,164 clauses | final 1 | PASS (recorded/local equal) | PASS | PASS +4 |
| child 20 NineteenthModelRefinements | `e719b8c17edf…` / 5,846,188 clauses | final 1 | PASS (recorded/local equal) | PASS | PASS +24 |
| child 21 TwentiethModelRefinements | `bc42cd2756d6…` / 5,846,200 clauses | final 2 | PASS (recorded/local equal) | PASS | PASS +12 |
| child 22 TwentyFirstModelRefinements | `dc44614e28c9…` / 5,846,208 clauses | final 1 | PASS (recorded/local equal) | PASS | PASS +8 |
| child 23 TwentySecondModelRefinements | `e88c12f36d11…` / 5,846,228 clauses | final 1 | PASS (recorded/local equal) | PASS | PASS +20 |
| child 24 TwentyThirdModelRefinements | `588dffabc01a…` / 5,846,232 clauses | final 1 | PASS (recorded/local equal) | PASS | PASS +4 |
| child 25 TwentyFourthModelRefinements | `8cd560206d0e…` / 5,846,252 clauses | MISSING | PASS (local blob; recorded SHA missing) | PASS | PASS +20 |
| child 26 TwentyFifthModelRefinements | `d238b81bfdc4…` / 5,846,272 clauses | final 1 | PASS (recorded/local equal) | PASS | PASS +20 |
| child 27 TwentySixthModelRefinements | `566d394436a3…` / 5,846,284 clauses | final 1 | PASS (recorded/local equal) | PASS | PASS +12 |
| child 28 TwentySeventhModelRefinements | `86bbb7f4a8f7…` / 5,846,288 clauses | final 1 | PASS (recorded/local equal) | PASS | PASS +4 |
| child 29 TwentyEighthModelRefinements | `620ea5ad066e…` / 5,846,544 clauses | final 1 | PASS (recorded/local equal) | PASS | PASS +256 |
| child 30 TwentyNinthModelRefinements | `02aca42eb228…` / 5,846,744 clauses | final 1 | PASS (recorded/local equal) | PASS | PASS +200 |
| child 31 ThirtiethModelRefinements | `3c847c1ebcac…` / 5,846,904 clauses | final 1 | PASS (recorded/local equal) | PASS | PASS +160 |

Full machine-readable evidence: `exact17-chain-reauth-20260812.json`. It records every final/live filename, local SHA/bytes/header, recorded-root comparisons, both recorded/local blob paths and hashes, model job IDs, complete-assignment checks, clause replay, and all adjacent suffix deltas.
