# Ordered Euclidean theorem-shape audit

Input: `incidence-audit/n17-profile-6-8-6-incidence-five-center-deletion-geometric-incidence-full-shared-pair-separation/witness.json`

Method: `theorem_shape_matcher.py` exhaustively checks every increasing 4/5/6-point
subsequence of the witness's recorded `a1`-anchored order.  It uses only the
JSON rows as same-radius supports.  It also reports cyclic-rotation matches
separately; these are not counted as exact matches against the recorded linear
enumeration without an additional rotated-boundary adapter.  The check is
finite, deterministic, and solver-free.

## Result

There is an exact anchored incidence match in the requested production bank:

`Problem97.FivePointEuclideanObstruction.false_of_five_ccw_second_two_selected_rows`
(`FivePointEuclideanObstruction.lean:306`).

Point/index map:

| theorem role | witness point | recorded position |
|---|---:|---:|
| `a` / `ia` | `t3` | 1 |
| `b` / `ib` | `a2` | 5 |
| `c` / `ic` | `q1` | 10 |
| `d` / `id` | `a3` | 12 |
| `e` / `ie` | `s1` | 15 |

Required row/support facts, all present verbatim in `witness.json`:

- `DRow` centered at `d=a3` contains `a=t3`, `c=q1`, `e=s1`.
  The witness row is `row(a3)={t3,q1,s1,s3}`.
- `ERow` centered at `e=s1` contains `a=t3`, `b=a2`.
  The witness row is `row(s1)={t3,a2,p1,s3}`.

These give the theorem's metric hypotheses
`dist(a3,t3)=dist(a3,q1)=dist(a3,s1)` and
`dist(s1,t3)=dist(s1,a2)`.  A second anchored match of the same theorem is
`(a,b,c,d,e)=(t2,r1,q2,r2,s4)`.

Thus the chosen Boolean order/row table cannot be the selected-shell table of
one injective strict-CCW Euclidean boundary.  This is not merely a missing
incidence: the chosen witness already contains a forbidden incidence shape.

## Exact requested-bank schemas

All tuples below are increasing in the stated role order.

| source theorem | exact selected-row/equality shape | anchored matches |
|---|---|---:|
| `FivePointEuclideanObstruction.false_of_five_ccw_two_selected_rows` | `row(b) ⊇ {a,e}`; `row(c) ⊇ {a,b,d}` | 0 |
| `FivePointEuclideanObstruction.false_of_five_ccw_second_two_selected_rows` | `row(d) ⊇ {a,c,e}`; `row(e) ⊇ {a,b}` | **2** |
| `FivePointEuclideanObstruction.false_of_five_ccw_reversed_second_two_selected_rows` | `row(b) ⊇ {a,c,e}`; `row(a) ⊇ {d,e}` | 0 |
| `SixPointEuclideanObstruction.false_of_six_ccw_three_selected_rows` | `row(A) ⊇ {B,D,F}`; `row(C) ⊇ {B,D,E}`; `row(D) ⊇ {A,B}` | 0 |
| `SixPointEuclideanObstruction.false_of_six_ccw_mirror_interleaving_row_equalities` | `A` equidistant on `{B,F}` and `{C,E}`; `D` equidistant on `{A,C,E}`; `E` equidistant on `{B,F}` | 0 |
| `SixPointSparseEuclideanObstruction.false_of_six_ccw_two_selected_rows` | `row(P0) ⊇ {P1,P3,P5}`; `row(P2) ⊇ {P1,P3,P4}` | 0 |

Each contradiction theorem additionally requires a common `boundary`, its
injectivity, strict CCW convexity, and the displayed strict index chain.  The
JSON supplies point labels, positions, and row sets, but no Euclidean points or
Lean proof objects for those geometric hypotheses.

`Phase3SharedPairSeparation.selectedFourClass_shared_pair_separated` is not a
contradiction consumer.  Its exact local incidence antecedent is two distinct
centers and two distinct points, with both points in both selected supports;
its conclusion is the `btw` XOR.  The matcher independently recovers exactly
13 active shared-pair cases from the JSON, and all 13 satisfy the required
separation, agreeing with the witness replay.

## Nearby metric-cut banks

- The imported `CapCrossingKalmanson` selected five-point schema
  `Y:{O,E}; O:{E,C}; A:{C,O}` has no anchored match.  Its three four-point
  shared-pair consumers also have no match, consistent with full shared-pair
  separation.
- `KalmansonThreeEqualitySchemas`, directly imported by
  `FrontierLiveClosure.lean`, has no anchored five-point match.  Of its three
  six-point schemas, `013_412_523` has 0 matches, `012_325_415` has 3, and
  `013_235_415` has 3.
- The nearby `TwoTripleRowSixPointEuclideanObstruction` schema
  `row(B) ⊇ {A,C,D}; row(F) ⊇ {A,D,E}` has 3 anchored matches.  It is collected
  by `Phase3MetricCertificateBank.lean`; it is not directly imported by
  `FrontierLiveClosure.lean` in the audited source snapshot.

The complete machine-readable census is `theorem-shape-match-report.json`.

## Forced versus witness-chosen

The live five-center deletion residual forces existence of q-deleted K4 rows
at the five named centers.  In the selected `delete-P.source1` arm these are
the common blocker `r1`, `oppApex1=a1`, the opposite collision blocker `q1`,
`oppApex2=a2`, and `surplusApex=a3`, and each surviving row avoids `p1`.

It does **not** force the concrete support of any of those rows.  In the primary
match, only the center `a3` is one of the five survival centers; the memberships
`{t3,q1,s1} ⊆ row(a3)`, the point/row choice `s1`, and
`{t3,a2} ⊆ row(s1)` are choices of this SAT witness.  The full within-block
positions are likewise existential witness choices.  Consequently this match
does not close the live Lean residual; it rejects this particular Boolean
witness as a candidate for the missing common Euclidean realization.

No Lean/Lake command, solver, generator, or axiom gate was run for this audit.
