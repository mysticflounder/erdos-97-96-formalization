# Exact-17 interlacing cross-wave analysis

Status: `PASS_READ_ONLY`.

Models: 19
Rhombus identities: 108
Disjoint 3+3 point-sum candidates: 105626 (certificate samples: 256)
Direct six-occurrence hits: 149
Conditional paper interlacing hits: 0
Universal rhombus-derived targets: 31932 across models; normalized minimal classes: 31924; smallest rhombus/support sizes: 2/8
Universal targets by model: child39:0, child40:252, child41:2772, child42:0, child43:0, child45-next-center-00:21, child45-next-center-01:0, child45-next-center-02:24024, child45-next-center-03:2083, child45-next-center-04:0, child45-next-center-05:2772, child45-next-center-06:0, child45-next-center-07:0, child45-next-center-12:0, child45-next-center-13:4, child45-next-center-14:2, child45-next-center-15:2, child45-next-center-16:0, child46:0
Top normalized classes: universal-motif-25844 (3 targets/3 models), universal-motif-29982 (3 targets/3 models), universal-motif-20342 (2 targets/2 models), universal-motif-21609 (2 targets/2 models), universal-motif-6274 (2 targets/2 models)

Sign-word and hull-separation classifications apply only to rhombus-derived point-sum certificates. Universal rejection is reported only for contiguous `PPPNNN` hull separation; conditional strict-convex-graph interlacing is not source-valid without chart ingress.
Exact declaration: `false_of_six_ccw_two_triple_row_equalities` in `lean/Erdos9796Proof/P97/ATail/TwoTripleRowSixPointEuclideanObstruction.lean`; direct raw-row hits are classified separately as `PROVEN_TWO_TRIPLE_ROW_EUCLIDEAN_OBSTRUCTION` and scan `{A,C,D} <= row[B]`, `{A,D,E} <= row[F]` over every cyclic cut and both directions.
Universal motif source support is algebra-only: equal-side edge unions plus concrete selected-row equality witnesses, with no source-clause support claim.

Machine-readable output: `scratch/exact17-lean-to-sat/interlacing-cross-wave-2026-08-15/analysis.json`
